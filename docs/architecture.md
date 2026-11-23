# Architecture

How source turns into the published site, and the constraints each piece depends on. Posts: [writing-posts.md](writing-posts.md). Theme, tabs, site config: [theme.md](theme.md).

## Pipeline

1. Jekyll renders the repo with the `jekyll-theme-chirpy` gem, which supplies layouts, includes, Sass and JS.
2. The hooks in `_plugins/` run during that render (below).
3. Output lands in `_site/`.
4. `htmlproofer` checks internal links only (`--disable-external`).
5. `.github/workflows/pages-deploy.yml` uploads `_site/` and deploys it to GitHub Pages.

`tools/test.sh` runs steps 1–4 with `JEKYLL_ENV=production`, the same as CI. `tools/run.sh` serves in development, where `compress_html` is off, so the HTML it serves differs from what `test.sh` and CI build.

## Custom plugins depend on the Actions deploy

The site deploys through GitHub Actions. The classic branch-based Pages build runs in safe mode, which ignores `_plugins/`. Keep the repo's Pages source set to **GitHub Actions**, or every plugin there silently stops running.

## `_plugins/image-dimensions.rb`

Adds `width` and `height` to `<img>` tags, read from the file with `fastimage`.

- It is a `:documents, :post_convert` hook. It covers collection documents (posts, `_tabs/`, `_cheatsheets/`), not plain pages such as `index.html`.
- It runs after Markdown conversion and before the layout, so Chirpy treats the sizes as if they were written in the post.
- It keeps tags that already carry `width`.
- It only resolves local files. A relative `src` is resolved through the post's `media_subpath`. With no `media_subpath`, the tag is left alone.

## `_plugins/posts-lastmod-hook.rb`

Sets `last_modified_at` on posts and cheatsheets by running `git log` against the file. The collections it covers are listed in `LASTMOD_COLLECTIONS`.

- It needs the full git history. CI checks out with `fetch-depth: 0` for this reason, so keep that setting.
- A file gets the field only once more than one commit touches it. New or uncommitted files have none.

## `_plugins/kbd.rb`

Registers the `{% kbd Ctrl+Shift+P %}` Liquid tag, which renders `<span class="keys">` around one `<kbd>` per key. Usage: `_templates/17-keyboard-keys.md`.

- It parses the keys when the template is parsed, so an empty tag fails the build with a Liquid syntax error naming the file.
- Key text is HTML-escaped, and Markdown characters (`` \ ` * _ | [ ] ``) become numeric entities. Liquid runs before kramdown, so without that a key like `Ctrl+\` or `Ctrl+[` would be read as Markdown.
- The `.keys` styles live in `assets/css/jekyll-theme-chirpy.scss`. Chirpy's own `kbd` style draws the keycaps.

## Gems

- `Gemfile.lock` is gitignored, so every CI run resolves fresh versions within the `~>` ranges. A build that passes locally can fail in CI after an upstream release. Compare `bundle info <gem>` locally against the versions in the CI log.
- Jekyll plugin gems go in the `:jekyll_plugins` group **and** in `plugins:` in `_config.yml` (as with `jekyll-glossary_tooltip`).
- `jekyll-glossary_tooltip` can inject its own CSS into every page. That is off (`glossary_tooltip.include_default_style: false`), and the tooltip styles live in `assets/css/jekyll-theme-chirpy.scss`. On a gem upgrade, check that the tag's markup and class names in `lib/jekyll-glossary_tooltip/tag.rb` still match those styles.
- Libraries that a local `_plugins/` file `require`s go in the main group (as with `fastimage`).

## What gets published

- `exclude:` in `_config.yml` keeps `docs/`, `tools/`, `CLAUDE.md`, `README.md` and `LICENSE` out of `_site/`.
- `_templates/` stays out because Jekyll skips underscore-prefixed folders that aren't collections.
- CI `paths-ignore` covers only `.gitignore`, `README.md` and `LICENSE`. Every other push to `main`, including a docs-only change, rebuilds and redeploys.

## Adding to the build

- **A hook:** add a Ruby file to `_plugins/`. Jekyll loads it automatically. Done when `bash tools/test.sh` is green and the hook's effect shows up in `_site/`.
- **A tool script:** add it to `tools/`. That folder is already excluded from the build. List it under Commands in `CLAUDE.md` if agents should run it.
