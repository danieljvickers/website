---
title: "Presentations"
layout: gridlay
sitemap: false
permalink: /presentations/
---

## Talks

{% if site.data.talks and site.data.talks.size > 0 %}
<div class="talk-list" markdown="0">
{% assign talks = site.data.talks | reverse %}
{% for talk in talks %}
{% assign embed = talk.url | media_embed %}
{% assign thumb = talk.url | media_thumb %}
{% assign thumb_alt = talk.url | media_thumb_alt %}
<div class="talk-card{% unless thumb %} talk-card-noimg{% endunless %}">
{% if thumb %}
{% if embed %}
<div class="talk-frame" data-embed="{{ embed }}" data-title="{{ talk.title | escape }}" role="button" tabindex="0" aria-label="Play {{ talk.title | escape }}">
{% else %}
<a class="talk-frame" href="{{ talk.url }}" target="_blank" rel="noopener">
{% endif %}
<img class="talk-thumb" src="{{ thumb }}" alt="{{ talk.title | escape }}" loading="lazy"{% if thumb_alt %} onerror="this.onerror=null;this.src='{{ thumb_alt }}';"{% endif %}>
<span class="talk-play" aria-hidden="true"><i class="fa-solid fa-play"></i></span>
{% if embed %}
</div>
{% else %}
</a>
{% endif %}
{% endif %}
<div class="talk-body">
<h4 class="talk-title">{{ talk.title }}</h4>
{% assign meta = "" | split: "" %}
{% if talk.event and talk.event != "" %}{% assign meta = meta | push: talk.event %}{% endif %}
{% if talk.location and talk.location != "" %}{% assign meta = meta | push: talk.location %}{% endif %}
{% if talk.date and talk.date != "" %}{% assign meta = meta | push: talk.date %}{% endif %}
{% if meta.size > 0 %}<span class="talk-meta">{{ meta | join: " &middot; " }}</span>{% endif %}
{% if talk.description and talk.description != "" %}<p class="talk-desc">{{ talk.description }}</p>{% endif %}
<div class="talk-actions">
{% if talk.url and talk.url != "" %}<a href="{{ talk.url }}" target="_blank" rel="noopener" class="btn-pill btn-website"><i class="fa-brands fa-youtube"></i> Watch</a>{% endif %}
{% if talk.slides and talk.slides != "" %}<a href="{{ talk.slides }}" target="_blank" rel="noopener" class="btn-pill btn-git"><i class="fa-solid fa-file-lines"></i> Slides</a>{% endif %}
</div>
</div>
</div>
{% endfor %}
</div>

{% include media_player.html %}
{% else %}
<p class="text-muted">No talks yet.</p>
{% endif %}

## Posters

{% if site.data.posters and site.data.posters.size > 0 %}
<div class="viz-grid" markdown="0">
{% assign posters = site.data.posters | reverse %}
{% for poster in posters %}
{% assign poster_href = poster.url | default: nil %}
{% unless poster_href %}{% capture poster_href %}{{ site.url }}{{ site.baseurl }}/assets/pdfs/{{ poster.file }}{% endcapture %}{% endunless %}
{% if poster.image and poster.image != "" %}
{% assign poster_img = poster.image %}
{% else %}
{% assign poster_img = poster.file | replace: ".pdf", ".jpg" %}
{% endif %}
<div class="viz-card">
<a class="poster-frame" href="{{ poster_href }}" target="_blank" rel="noopener" aria-label="Open {{ poster.title | escape }} (PDF)">
<img class="poster-thumb" src="{{ site.url }}{{ site.baseurl }}/images/posters/{{ poster_img }}" alt="{{ poster.title | escape }}" loading="lazy">
</a>
<div class="viz-body">
<h4 class="viz-title">{{ poster.title }}</h4>
{% assign poster_meta = "" | split: "" %}
{% if poster.venue and poster.venue != "" %}{% assign poster_meta = poster_meta | push: poster.venue %}{% endif %}
{% if poster.location and poster.location != "" %}{% assign poster_meta = poster_meta | push: poster.location %}{% endif %}
{% if poster.date and poster.date != "" %}{% assign poster_meta = poster_meta | push: poster.date %}{% endif %}
{% if poster_meta.size > 0 %}<span class="talk-meta">{{ poster_meta | join: " &middot; " }}</span>{% endif %}
{% if poster.description and poster.description != "" %}<p class="viz-desc">{{ poster.description }}</p>{% endif %}
<div class="talk-actions">
<a href="{{ poster_href }}" target="_blank" rel="noopener" class="btn-pill btn-pdf"><i class="fa-solid fa-file-pdf"></i> Poster PDF</a>
</div>
</div>
</div>
{% endfor %}
</div>
{% else %}
<p class="text-muted">No posters yet.</p>
{% endif %}
