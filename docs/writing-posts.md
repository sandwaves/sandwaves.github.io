# Writing posts

## Create

Start every post with `ruby tools/new-post.rb "Title" ["Top, Sub"] ["tag1, tag2"]`. It writes the dated file name and front matter.

Every post's front matter has:

- `title`
- `date`, with offset (e.g. `2026-11-23 11:38:06 +0300`)
- `categories`, at most two levels
- `tags`, lowercase

Optional keys (preview image, pinning, math, diagrams) are in `_templates/00-front-matter.md`. Add one only when the post uses it. Layout, comments, TOC and the permalink come from `defaults` in `_config.yml`, so leave them out of the post.

## Chirpy features

`_templates/` holds one copy-paste snippet per Markdown feature the theme supports, indexed in `_templates/README.md`. Callouts, filepaths, math, mermaid, images and glossary tooltips are all there. Read the matching snippet before using a feature beyond plain Markdown. Jekyll skips the folder, so nothing in it gets published.

## Glossary tooltips

`{% glossary term %}` looks the term up in `_data/glossary.yml`. An unknown or duplicated term fails the build, so:

1. Add the term to `_data/glossary.yml` (snippet: `_templates/16-glossary-tooltip.md`).
2. Use it in the post.
3. Run `ruby tools/check-glossary.rb`. Done when it prints `Glossary OK`.

## Done

The post is finished when `bash tools/test.sh` is green.
