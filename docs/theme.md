# Theme and site structure

## Overriding theme files

The theme is the `jekyll-theme-chirpy` gem. To change a layout, include, Sass or JS file, copy it from `bundle info --path jekyll-theme-chirpy` to the same relative path in this repo, then edit the copy. Theme docs: https://github.com/cotes2020/jekyll-theme-chirpy/wiki

## Sidebar tabs

Sidebar pages are the `tabs` collection in `_tabs/`. `order` sets the position and `icon` takes a Font Awesome class.

## Permalinks

Keep the post permalink `/posts/:title/` in `_config.yml` `defaults`. Theme-internal links are built on it.
