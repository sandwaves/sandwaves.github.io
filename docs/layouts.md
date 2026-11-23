# Layouts

All layouts come from the `jekyll-theme-chirpy` gem (7.6). The repo has no `_layouts/` folder. Read a layout's source at `$(bundle info --path jekyll-theme-chirpy)/_layouts/<name>.html`. To override one, see [theme.md](theme.md).

## Which layout a file gets

| Layout | Used by | Assigned by | Renders |
| --- | --- | --- | --- |
| `post` | every file in `_posts/` | `defaults` in `_config.yml` | One post: title, dates, preview image, read time, TOC panel, categories, tags, sharing, related posts, prev/next nav, comments |
| `page` | `_tabs/about.md`; any other tab with no `layout` | `defaults` for the `tabs` collection | Title as `<h1>` plus content. A tab's title is translated through the `tabs` key in the locale file |
| `home` | `index.html` only | the file's front matter | Paginated post list (`paginate: 10`), pinned posts first, `hidden: true` posts left out |
| `archives` | `_tabs/archives.md` | the file's front matter | Every post grouped by year |
| `categories` | `_tabs/categories.md` | the file's front matter | Category tree with post counts |
| `tags` | `_tabs/tags.md` | the file's front matter | Tag cloud with post counts |
| `category` | generated `/categories/<name>/` pages | `jekyll-archives` in `_config.yml` | Posts in one category |
| `tag` | generated `/tags/<name>/` pages | `jekyll-archives` in `_config.yml` | Posts with one tag |
| `default` | parent of the layouts above | — | HTML shell: head, sidebar, topbar, side panel, footer, search |
| `compress` | parent of `default` | — | Minifies HTML when `compress_html` applies |

Each list layout (`home`, `archives`, `categories`, `tags`, `category`, `tag`) builds its output from site data and ignores the file's body.

## Inheritance

```text
compress
└── default
    ├── home
    ├── post
    └── page
        ├── archives, categories, tags
        └── category, tag
```

`default` runs `refactor-content.html` only for its **direct** children (`home`, `post`, `page`). That include lazy-loads images, applies `media_subpath`, adds image size and position classes, adds code block headers and copy buttons, and adds heading anchors. The grandchild layouts skip it.

## Front matter a layout reads

- **`post`:** `title`, `date`, `description`, `image` (`path`, `alt`, `lqip`, `no_bg`), `author`/`authors`, `categories`, `tags`, `toc`, `comments`, `math`, `mermaid`, `media_subpath`. `last_modified_at` comes from `_plugins/posts-lastmod-hook.rb`. Usage is in [writing-posts.md](writing-posts.md) and `_templates/00-front-matter.md`.
- **`home`:** reads `pin` and `hidden` from each post.
- **Tabs:** `icon` and `order` (see [theme.md](theme.md)).
- **Any page:** `compress_html: false` skips minification for that page.

## Adding a page

1. Decide whether the page belongs in the sidebar.
   - **Sidebar:** create it in `_tabs/`. It gets `page` and a `/<title>/` permalink from `defaults`.
   - **Standalone:** create it at the repo root (or in a folder) with `layout: page` in its front matter. `defaults` only cover posts and tabs, so a page with no `layout` is published as bare HTML with no theme.
2. Run `bash tools/run.sh` and open the page. Done when it shows the sidebar and topbar.

## Adding a layout

1. Create `_layouts/<name>.html` with `layout: default` in its front matter, so it gets `refactor-content.html`. Use `layout: page` only when you want the page title wrapper and can do without that processing.
2. To add panel or footer pieces, list include names (without `.html`) under `panel_includes`, `tail_includes` or `script_includes` in the layout's front matter, as `post.html` does.
3. Done when a page using it renders under `bash tools/run.sh` and `bash tools/test.sh` is green.
