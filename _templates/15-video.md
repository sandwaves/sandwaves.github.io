<!--
Embeds from the theme's _includes/embed/. A src without :// is a site path, e.g. /assets/media/clip.mp4.
Parameters are listed per include. To check one, read
$(bundle info --path jekyll-theme-chirpy)/_includes/embed/<name>.html
-->

<!-- Local or remote video. Optional: title, poster, autoplay, loop, muted, types -->

{% include embed/video.html src='/assets/media/clip.mp4' title='Clip title' poster='/assets/img/posts/clip-poster.png' %}

<!-- Audio. Optional: title, types -->

{% include embed/audio.html src='/assets/media/track.mp3' title='Track title' %}

<!-- YouTube: id is the part after watch?v= -->

{% include embed/youtube.html id='Balreaj8Yqs' %}

<!-- Bilibili and Twitch: id is the video id from the URL -->

{% include embed/bilibili.html id='BV1Q44y1B7Wf' %}
{% include embed/twitch.html id='1634779211' %}

<!-- Spotify tracks only: id is the part after open.spotify.com/track/. Optional: compact=true, dark=true -->

{% include embed/spotify.html id='3OuMIIFP5TxM8tLXMWYPGV' %}
