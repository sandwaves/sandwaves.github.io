<!--
Put image files in assets/img/posts/ and reference them by absolute path: /assets/img/posts/<file>.
Set width and height to the image's pixel size so the page does not shift while it loads.
-->

<!-- Default: full width, centered. An italic line directly below becomes the caption. -->

![Desktop View](/assets/img/posts/example.png){: width="972" height="589" }
_Image caption_

<!-- Left aligned at 75% width -->

![Desktop View](/assets/img/posts/example.png){: width="972" height="589" .w-75 .normal }

<!-- Float left (text wraps on the right). Use .right to float right. -->

![Desktop View](/assets/img/posts/example.png){: width="972" height="589" .w-50 .left }
Text that wraps around the image goes here.

<!-- Separate images for light and dark mode, with shadow and rounded corners -->

![light mode only](/assets/img/posts/example-light.png){: .light .w-75 .shadow .rounded-10 width="1212" height="668" }
![dark mode only](/assets/img/posts/example-dark.png){: .dark .w-75 .shadow .rounded-10 width="1212" height="668" }
