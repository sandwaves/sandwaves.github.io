# Theme and site structure

## Overriding theme files

The theme is the `jekyll-theme-chirpy` gem. To change a layout, include, Sass or JS file, copy it from `bundle info --path jekyll-theme-chirpy` to the same relative path in this repo, then edit the copy. Theme docs: https://github.com/cotes2020/jekyll-theme-chirpy/wiki

A copy stops receiving upstream fixes. These files are copies of gem 7.6.0 with local additions. When the gem version changes, diff each against the new gem file and carry the local additions over:

| File | Local addition |
| --- | --- |
| `_layouts/page.html` | Branch for the `cheatsheets` collection |
| `assets/css/jekyll-theme-chirpy.scss` | Custom styles below the `append your custom style below` comment, including all glossary tooltip styles |
| `assets/js/data/search.json` | Cheatsheets added to the search index |

`assets/css/jekyll-theme-chirpy.scss` is rendered through Liquid, so a Liquid tag written in one of its comments runs. Name tags in prose there (`the kbd tag`).

Files in `_layouts/` and `_includes/` with no gem counterpart (`cheatsheets.html`, `cheatsheet.html`) are local additions and need no diff.

## Sidebar tabs

Sidebar pages are the `tabs` collection in `_tabs/`. `order` sets the position and `icon` takes a Font Awesome class. Inserting a tab means renumbering the `order` of the tabs after it.

## Permalinks

Keep the post permalink `/posts/:title/` in `_config.yml` `defaults`. Theme-internal links are built on it.
