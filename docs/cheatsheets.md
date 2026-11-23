# Writing cheatsheets

A cheatsheet is a one-page **quick reference**: commands, shortcuts and flags you look up, not read. Explanation belongs in a post; the cheatsheet links to it. Cheatsheets live in `_cheatsheets/`, publish at `/cheatsheets/<file-name>/`, and are listed on the Cheatsheets tab and in site search.

## Create

1. Create `_cheatsheets/<slug>.md`. The file name is the URL, so pick it once and keep it.
2. Front matter is `title` and `description` only. The description shows on the Cheatsheets tab and under the title:

   ```yaml
   ---
   title: Git
   description: Everyday git commands, from status to stash.
   ---
   ```

   Layout and permalink come from `_config.yml`. Cheatsheets have no date, categories or tags.
3. Write the body as **cards**: every `##` heading starts a card, and cards flow into columns. Text before the first `##` spans the full width; keep it to one line or drop it.
   - One topic per card, short enough to fit on a screen. Split a long card into two `##` sections.
   - Inside a card, use tables, short lists, code blocks and `###` subheadings.
   - Keyboard shortcuts: `{% kbd Ctrl+Shift+P %}` (snippet: `_templates/17-keyboard-keys.md`).
   - Other Markdown features: the snippets in `_templates/`, indexed in `_templates/README.md`.
4. Run `bash tools/test.sh`. Done when it is green and the sheet appears in `_site/cheatsheets/index.html`.

To change how cheatsheets render, see [layouts.md](layouts.md).
