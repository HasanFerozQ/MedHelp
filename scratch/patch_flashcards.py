import os

filepath = r"c:\Users\Hasan-PC\Desktop\MedHelp\flash-cards.html"

with open(filepath, 'r', encoding='utf-8') as f:
    content = f.read()

# 1. Inject MathJax in head
target_head = '<script src="https://unpkg.com/lucide@latest"></script>'
replacement_head = """<script src="https://unpkg.com/lucide@latest"></script>
  <!-- MathJax configuration and script -->
  <script>
    window.MathJax = {
      tex: {
        inlineMath: [['$', '$'], ['\\\\(', '\\\\)']],
        displayMath: [['$$', '$$'], ['\\\\[', '\\\\]']],
        processEscapes: true
      },
      options: {
        ignoreHtmlClass: 'tex2jax_ignore',
        processHtmlClass: 'tex2jax_process'
      }
    };
  </script>
  <script src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js" id="MathJax-script" async></script>"""

if target_head in content:
    content = content.replace(target_head, replacement_head, 1)
    print("MathJax head script replaced successfully.")
else:
    print("WARNING: Could not find target head tag.")

# 2. Inject cleanLaTeX helper and update updateCard()
target_update_card = """    function updateCard() {
      const topics = FLASH_DATA[currentTab];
      if (!topics || !topics[currentTopicIndex]) return;

      const cards = topics[currentTopicIndex].cards;
      const card = cards[currentCardIndex];

      cardElement.classList.remove('is-flipped');
      
      setTimeout(() => {
        frontText.innerHTML = card.q;
        backText.innerHTML = card.a;
        cardCounter.textContent = `${currentCardIndex + 1} / ${cards.length}`;
        
        prevBtn.disabled = currentCardIndex === 0;
        nextBtn.disabled = currentCardIndex === cards.length - 1;
      }, 50);
    }"""

replacement_update_card = """    function cleanLaTeX(text) {
      if (!text) return '';
      // Replace any run of backslashes (like \\ or \\\\) with a single backslash for LaTeX
      return text.replace(/\\\\+/g, '\\\\');
    }

    function updateCard() {
      const topics = FLASH_DATA[currentTab];
      if (!topics || !topics[currentTopicIndex]) return;

      const cards = topics[currentTopicIndex].cards;
      const card = cards[currentCardIndex];

      cardElement.classList.remove('is-flipped');
      
      setTimeout(() => {
        frontText.innerHTML = cleanLaTeX(card.q);
        backText.innerHTML = cleanLaTeX(card.a);
        cardCounter.textContent = `${currentCardIndex + 1} / ${cards.length}`;
        
        prevBtn.disabled = currentCardIndex === 0;
        nextBtn.disabled = currentCardIndex === cards.length - 1;

        // Trigger MathJax dynamic rendering
        if (window.MathJax && typeof MathJax.typesetPromise === 'function') {
          MathJax.typesetPromise([frontText, backText]).catch((err) => {
            console.error("MathJax typesetting error:", err);
          });
        }
      }, 50);
    }"""

# Try matching normalized line endings first
normalized_content = content.replace('\r\n', '\n')
normalized_target = target_update_card.replace('\r\n', '\n')
normalized_replacement = replacement_update_card.replace('\r\n', '\n')

if normalized_target in normalized_content:
    normalized_content = normalized_content.replace(normalized_target, normalized_replacement, 1)
    # Restore Windows line endings if they were originally present
    if '\r\n' in content:
        content = normalized_content.replace('\n', '\r\n')
    else:
        content = normalized_content
    print("updateCard function replaced successfully.")
else:
    print("ERROR: Could not find target updateCard function in file.")

with open(filepath, 'w', encoding='utf-8') as f:
    f.write(content)
print("File saved successfully.")
