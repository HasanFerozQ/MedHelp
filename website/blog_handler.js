/**
 * MediHelp Now: Universal Web/Extension Logic
 * 1. Error Logging (Supabase)
 * 2. Blog Logic (GitHub API + Supabase Analytics)
 */

window.MediHelp = {
  // --- Error Logger (site_logs Table) ---
  logError: async function(message, page = window.location.pathname) {
    if (!window.supabase) return;
    try {
      const client = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
      await client.from('site_logs').insert([{
        source: 'website',
        page: page,
        error_message: message,
        user_agent: navigator.userAgent
      }]);
    } catch (e) {
      console.warn("Failed to log error to Supabase:", e);
    }
  },

  // --- Blog Logic ---
  fetchBlogs: async function() {
    const owner = 'HasanFerozQ';
    const repo = 'MedHelp';
    const path = 'blog';
    const api_url = `https://api.github.com/repos/${owner}/${repo}/contents/${path}`;

    try {
      const res = await fetch(api_url);
      const files = await res.json();
      
      // Filter for .md files
      const mdFiles = files.filter(f => f.name.endsWith('.md'));
      
      // Fetch contents and parse frontmatter (simplistic regex for static site)
      const posts = await Promise.all(mdFiles.map(async (file) => {
        const rawRes = await fetch(file.download_url);
        const text = await rawRes.text();
        
        // Extract frontmatter (Title, Date, Thumbnail)
        const titleMatch = text.match(/title:\s*(.*)/);
        const dateMatch = text.match(/date:\s*(.*)/);
        const thumbMatch = text.match(/thumbnail:\s*(.*)/);
        const categoryMatch = text.match(/category:\s*(.*)/);
        const summaryMatch = text.match(/summary:\s*(.*)/);

        return {
          slug: file.name.replace('.md', ''),
          title: titleMatch ? titleMatch[1].trim() : file.name,
          date: dateMatch ? dateMatch[1].trim() : '2024-04-04',
          thumbnail: thumbMatch ? thumbMatch[1].trim() : '',
          category: categoryMatch ? categoryMatch[1].trim() : 'General',
          summary: summaryMatch ? summaryMatch[1].trim() : '',
          raw: text
        };
      }));

      // Sort by date (Most recent first)
      return posts.sort((a, b) => new Date(b.date) - new Date(a.date));
    } catch (e) {
      this.logError("Failed to fetch blogs: " + e.message);
      return [];
    }
  },

  incrementReadCount: async function(slug) {
    if (!window.supabase) return;
    const client = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
    try {
      const { data } = await client.from('blog_stats').select('read_count').eq('slug', slug).single();
      const count = (data ? data.read_count : 0) + 1;
      await client.from('blog_stats').upsert({ slug, read_count: count, last_read_at: new Date().toISOString() });
      return count;
    } catch (e) {
      this.logError("Failed to increment read count: " + e.message);
      return 0;
    }
  },

  getReadCount: async function(slug) {
    if (!window.supabase) return 0;
    const client = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
    const { data } = await client.from('blog_stats').select('read_count').eq('slug', slug).single();
    return data ? data.read_count : 0;
  }
};

// Global Error Catcher
window.onerror = function(msg, url, line, col, error) {
  MediHelp.logError(`Global error: ${msg} [${line}:${col}] at ${url}`);
  return false;
};
