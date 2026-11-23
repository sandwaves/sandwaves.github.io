<!--
Shows a term with a hover tooltip holding its definition from _data/glossary.yml.
Plugin: https://github.com/erikw/jekyll-glossary_tooltip
-->

<!-- Entry in _data/glossary.yml. url is optional and adds a link to the tooltip; it can use Liquid, e.g. {{ site.baseurl }}/posts/some-post/ -->

<!--
- term: default branch
  definition: The branch a GitHub repo shows and clones by default, usually main or master.
  url: https://docs.github.com/en/repositories
-->

<!-- Basic: shows the term as written in the tag. Matching against glossary.yml is case-insensitive. -->

Download from the {% glossary default branch %}.

<!-- Different display text. display is the only option; the tooltip then starts with "term: definition". -->

Run it with the {% glossary npx, display: npx command %}.

<!-- The term is everything before the first comma. Write terms and display text without commas; display text starts with a letter. -->
