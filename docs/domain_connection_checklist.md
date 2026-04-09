# Checklist — Connecting Namecheap to Vercel

If you see a "DNS Change Recommended" or "Not Available" message, follow these exact steps in your Namecheap and Vercel accounts.

## 1. Vercel Project Settings
Ensure Vercel is ready to receive traffic from your domain:
1.  Go to your project in **Vercel Dashboard**.
2.  Click **Settings** > **Domains**.
3.  Add `medihelp.live`. It will automatically suggest adding `www.medihelp.live` as well. **Add both.**
4.  Copy the values provided (they should match the ones below).

## 2. Namecheap Advanced DNS
Log in to **Namecheap** and go to **Domain List** > **medihelp.live** > **Advanced DNS**.

### Host Records
Add or update these two records:
| Type | Host | Value | TTL |
| :--- | :--- | :--- | :--- |
| **A Record** | `@` | `76.76.21.21` | Automatic |
| **CNAME Record** | `www` | `cname.vercel-dns.com.` | Automatic |

> [!WARNING]
> Delete any other **A Records** or **URL Redirect Records** with the `@` host that might be there by default. There should only be ONE A Record for `@`.

## 3. Propagation Check
-   **Time**: It usually takes **15 to 30 minutes** for these changes to take effect globally.
-   **Verification**: Once the records are correct, the status in the Vercel Dashboard will change to a green **"Valid Configuration"** badge.

## 4. Search Results
-   **Google Indexing**: Now that we've added "Canonical Tags" to your code, Google will stop seeing the site as a "Duplicate."
-   **Searchability**: Once the site is live, I recommend going to [Google Search Console](https://search.google.com/search-console) and clicking **"Request Indexing"** for your root URL.
