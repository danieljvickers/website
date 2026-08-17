---
title: "Visualizations"
layout: gridlay
sitemap: false
permalink: /visualizations/
---

## Visualizations

{% if site.data.visualizations and site.data.visualizations.size > 0 %}
<div class="viz-grid" markdown="0">
{% for item in site.data.visualizations %}
{% assign kind = item.url | media_kind %}
{% assign embed = item.url | media_embed %}
{% if item.image %}
  {% capture thumb %}{{ site.url }}{{ site.baseurl }}/images/visualizations/{{ item.image }}{% endcapture %}
  {% assign thumb_alt = nil %}
{% else %}
  {% assign thumb = item.url | media_thumb %}
  {% assign thumb_alt = item.url | media_thumb_alt %}
{% endif %}
<div class="viz-card">
{% if embed %}
<div class="viz-frame" data-embed="{{ embed }}" data-title="{{ item.title | escape }}" role="button" tabindex="0" aria-label="Play {{ item.title | escape }}">
{% else %}
<a class="viz-frame" href="{{ item.url }}" target="_blank" rel="noopener">
{% endif %}
{% if thumb %}
<img class="viz-thumb" src="{{ thumb }}" alt="{{ item.title | escape }}" loading="lazy"{% if thumb_alt %} onerror="this.onerror=null;this.src='{{ thumb_alt }}';"{% endif %}>
{% else %}
<div class="viz-thumb viz-thumb-blank"></div>
{% endif %}
<span class="viz-play" aria-hidden="true"><i class="fa-solid fa-play"></i></span>
{% if embed %}
</div>
{% else %}
</a>
{% endif %}
<div class="viz-body">
<h4 class="viz-title">{{ item.title }}</h4>
{% if item.description %}<p class="viz-desc">{{ item.description }}</p>{% endif %}
<a class="viz-link" href="{{ item.url }}" target="_blank" rel="noopener">
{% case kind %}
{% when 'youtube' %}<i class="fa-brands fa-youtube"></i> Watch on YouTube
{% when 'drive' %}<i class="fa-brands fa-google-drive"></i> Open in Google Drive
{% when 'vimeo' %}<i class="fa-brands fa-vimeo-v"></i> Watch on Vimeo
{% else %}<i class="fa-solid fa-arrow-up-right-from-square"></i> Open link
{% endcase %}
</a>
</div>
</div>
{% endfor %}
</div>

<script>
// Click a preview to swap it for the player, so nothing loads from
// YouTube/Drive until the visitor actually asks for it.
(function () {
  var frames = document.querySelectorAll('.viz-frame[data-embed]');
  Array.prototype.forEach.call(frames, function (frame) {
    function play() {
      if (frame.querySelector('iframe')) return;
      var iframe = document.createElement('iframe');
      iframe.src = frame.getAttribute('data-embed');
      iframe.title = frame.getAttribute('data-title') || 'Visualization';
      iframe.loading = 'lazy';
      iframe.allow = 'accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture';
      iframe.allowFullscreen = true;
      iframe.setAttribute('frameborder', '0');
      frame.innerHTML = '';
      frame.appendChild(iframe);
      frame.classList.add('is-playing');
    }
    frame.addEventListener('click', play);
    frame.addEventListener('keydown', function (e) {
      if (e.key === 'Enter' || e.key === ' ') {
        e.preventDefault();
        play();
      }
    });
  });
})();
</script>
{% else %}
<p class="text-muted">No visualizations yet.</p>
{% endif %}
