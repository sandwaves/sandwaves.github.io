# Syntax templates

One copy-paste snippet file per Markdown feature the Chirpy theme supports. Read the file for the feature you need, copy its snippet, and replace the placeholder values. Comments in each file say when to pick each variant.

| Need | File |
| --- | --- |
| Optional front matter: description, pin, math, mermaid, preview image | `00-front-matter.md` |
| Headings, keeping one out of the TOC | `01-headings.md` |
| Description list (term + definition) | `03-lists.md` |
| Callout box: tip, info, warning, danger | `05-prompts.md` |
| Link to another post on this site | `07-links.md` |
| Footnotes | `08-footnotes.md` |
| File path highlight | `10-filepath.md` |
| Code block with a file name, or without line numbers | `11-code-blocks.md` |
| Equations (MathJax) | `12-mathematics.md` |
| Diagrams (Mermaid) | `13-mermaid.md` |
| Images: size, caption, alignment, float, dark/light variants | `14-images.md` |
| Video, audio, YouTube, Bilibili, Twitch, Spotify track embeds | `15-video.md` |
| Glossary term tooltip | `16-glossary-tooltip.md` |
| Keyboard shortcut keycaps | `17-keyboard-keys.md` |

## Attribute lines

Many snippets style a block with a kramdown attribute line such as `{: .prompt-tip }`. Put it on the line directly under the block it styles, with no blank line between them.
