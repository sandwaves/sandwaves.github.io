# Layouts

Layouts come from the `jekyll-theme-chirpy` gem, except the overrides and additions in `_layouts/` (listed in [theme.md](theme.md)). Read a gem layout's source at `$(bundle info --path jekyll-theme-chirpy)/_layouts/<name>.html`.

## Which layout a file gets

| Layout | Used by | Assigned by | Renders |
| --- | --- | --- | --- |
| `post` | every file in `_posts/` | `defaults` in `_config.yml` | One post: title, dates, preview image, read time, TOC panel, categories, tags, sharing, related posts, prev/next nav, comments |
| `page` | `_tabs/about.md`; any other tab with no `layout`; every file in `_cheatsheets/` | `defaults` for the `tabs` and `cheatsheets` collections | Title as `<h1>` plus content. A tab's title is translated through the `tabs` key in the locale file. Cheatsheets branch to `_includes/cheatsheet.html` (below) |
| `cheatsheets` | `_tabs/cheatsheets.md` | the file's front matter | Every cheatsheet, sorted by title, with its description |
| `home` | `index.html` only | the file's front matter | Paginated post list (`paginate: 10`), pinned posts first, `hidden: true` posts left out |
| `archives` | `_tabs/archives.md` | the file's front matter | Every post grouped by year |
| `categories` | `_tabs/categories.md` | the file's front matter | Category tree with post counts |
| `tags` | `_tabs/tags.md` | the file's front matter | Tag cloud with post counts |
| `category` | generated `/categories/<name>/` pages | `jekyll-archives` in `_config.yml` | Posts in one category |
| `tag` | generated `/tags/<name>/` pages | `jekyll-archives` in `_config.yml` | Posts with one tag |
| `default` | parent of the layouts above | — | HTML shell: head, sidebar, topbar, side panel, footer, search |
| `compress` | parent of `default` | — | Minifies HTML when `compress_html` applies |

Each list layout (`home`, `archives`, `categories`, `tags`, `cheatsheets`, `category`, `tag`) builds its output from site data and ignores the file's body.

## Inheritance

```text
compress
└── default
    ├── home
    ├── post
    └── page
        ├── archives, categories, tags, cheatsheets
        └── category, tag
```

`default` runs `refactor-content.html` only for its **direct** children (`home`, `post`, `page`). That include lazy-loads images, applies `media_subpath`, adds image size and position classes, adds code block headers and copy buttons, and adds heading anchors. The grandchild layouts skip it.

## Chirpy picks JS by layout name

`_includes/js-selector.html` and `head.html` in the gem choose scripts and styles by the page's own `layout` value, not by the layout chain. Only `post`, `page` and `home` get the image popup and the code-block copy button. A page on a custom layout gets the `commons` bundle without them, even when that layout inherits from `page`.

## Cheatsheets

Cheatsheets use `layout: page` for the reason above. The repo's `_layouts/page.html` sends any page in the `cheatsheets` collection to `_includes/cheatsheet.html`, which:

- renders `title`, `description`, and `last_modified_at` (set by `_plugins/posts-lastmod-hook.rb`);
- splits the content on `<h2` and wraps each section in `<section class="sheet-section">` inside `.sheet-grid`; content before the first `<h2>` goes in `.sheet-intro`;
- relies on styles in `assets/css/jekyll-theme-chirpy.scss`: CSS columns for `.sheet-grid`, and a print rule that hides the sidebar, topbar and panels.

The split runs before `refactor-content.html`, so heading anchors and copy buttons still apply. Writing a cheatsheet: [cheatsheets.md](cheatsheets.md).

## Front matter a layout reads

- **`post`:** the keys in [writing-posts.md](writing-posts.md) and `_templates/00-front-matter.md`.
- **`home`:** reads `pin` and `hidden` from each post.
- **Tabs:** `icon` and `order` (see [theme.md](theme.md)).
- **Any page:** `compress_html: false` skips minification for that page.

## Adding a page

1. Decide whether the page belongs in the sidebar.
   - **Sidebar:** create it in `_tabs/`. It gets `page` and a `/<title>/` permalink from `defaults`.
   - **Standalone:** create it at the repo root (or in a folder) with `layout: page` in its front matter. `defaults` only cover posts and tabs, so a page with no `layout` is published as bare HTML with no theme.
2. Run `bash tools/run.sh` and open the page. Done when it shows the sidebar and topbar.

## Adding a layout

1. Decide whether pages need the copy button or image popup. If they do, keep them on `layout: page` and branch inside `_layouts/page.html`, as cheatsheets do (see "Chirpy picks JS by layout name").
2. Otherwise create `_layouts/<name>.html` with `layout: default` in its front matter, so it gets `refactor-content.html`. Use `layout: page` only when you want the page title wrapper and can do without that processing.
3. To add panel or footer pieces, list include names (without `.html`) under `panel_includes`, `tail_includes` or `script_includes` in the layout's front matter, as `post.html` does.
4. Done when a page using it renders under `bash tools/run.sh` and `bash tools/test.sh` is green.
