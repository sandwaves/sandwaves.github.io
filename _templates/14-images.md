<!--
Put image files in assets/img/posts/ and reference them by absolute path: /assets/img/posts/<file>.
_plugins/image-dimensions.rb adds width and height from the file at build time, so leave them out.
-->

<!-- Default: full width, centered. An italic line directly below becomes the caption. -->

![Desktop View](/assets/img/posts/example.png)
_Image caption_

<!-- Left aligned at 75% width -->

![Desktop View](/assets/img/posts/example.png){: .w-75 .normal }

<!-- Float left (text wraps on the right). Use .right to float right. -->

![Desktop View](/assets/img/posts/example.png){: .w-50 .left }
Text that wraps around the image goes here.

<!-- Separate images for light and dark mode, with shadow and rounded corners -->

![light mode only](/assets/img/posts/example-light.png){: .light .w-75 .shadow .rounded-10 }
![dark mode only](/assets/img/posts/example-dark.png){: .dark .w-75 .shadow .rounded-10 }
