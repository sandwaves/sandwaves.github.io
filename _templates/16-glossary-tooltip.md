<!-- jekyll-glossary_tooltip: https://github.com/erikw/jekyll-glossary_tooltip -->
<!-- Shows a term with a hover tooltip holding its definition from _data/glossary.yml -->

<!-- 1. Add the term to _data/glossary.yml -->

<!--
- term: default branch
  definition: The branch a GitHub repo shows and clones by default, usually main or master.
  url: https://docs.github.com/en/repositories   # optional, adds a link in the tooltip
-->

<!-- 2. Use it in a post -->

<!-- Basic: shows the term as written in the tag (matching is case-insensitive) -->

Download from the {% glossary default branch %}.

<!-- Different display text: the tooltip then starts with "term: definition" -->

Run it with the {% glossary npx, display: npx command %}.

<!--
Rules:
- The term is everything before the first comma, so terms cannot contain commas.
- The display text must start with a letter and cannot contain commas.
- `display` is the only option.
- An unknown term, or two entries with the same term, fails the build.
- `url` can use Liquid, for example {{ site.baseurl }}/posts/some-post/
-->
