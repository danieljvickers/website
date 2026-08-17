---
title: "Visualizations"
layout: gridlay
sitemap: false
permalink: /visualizations/
---

## Visualizations

{% if site.data.visualizations and site.data.visualizations.size > 0 %}
<div class="viz-grid" markdown="0">
{% assign items = site.data.visualizations | reverse %}
{% for item in items %}
{% assign kind = item.url | media_kind %}
{% assign embed = item.url | media_embed %}
{% if item.image and item.image != "" %}
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
{% if item.description and item.description != "" %}<p class="viz-desc">{{ item.description }}</p>{% endif %}
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

{% include media_player.html %}
{% else %}
<p class="text-muted">No visualizations yet.</p>
{% endif %}
