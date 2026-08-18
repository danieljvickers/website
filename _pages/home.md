---
title: "Home"
layout: homelay
sitemap: false
permalink: /
---

<h2 class="home-hero">{{ site.name }}</h2>
<p class="home-hero-sub">{{ site.title }}, {{ site.institution }}</p>

My background is as a numerical physicist. I enjoy working with most fields of physics and specialize in computational optimizations for writing physics-based solvers and simulations. I have worked on code applied to relativistic astrophysics, medicine, signal processing, electromagnetics, computational fluid dynamics, magneto-hydrodynamics, and others. I am current pursuing a PhD in Computational Science & Engineering at the Georgia Institute of Technology on my work optimizing compressible CFD simulations of particle-laden flows. My goal is improving the efficiency of computational methods by focusing on algorithms and techniques that produce optimal results given finite resources. You can view my most-recent publications for a review of topics I am currently or have recently been working on.

{% assign latest = site.data.blog | last %}
{% if latest %}
{% assign latest_path = latest.post | append: ".md" | prepend: "_blog/" %}
{% assign latest_post = site.blog | where: "relative_path", latest_path | first %}
{% endif %}
{% if latest_post %}
### Latest Post

<div class="home-post-card" markdown="0">
{% if latest.image %}
<a href="{{ site.url }}{{ site.baseurl }}{{ latest_post.url }}" class="home-post-thumb-link">
<img src="{{ site.url }}{{ site.baseurl }}/images/blog/{{ latest.image }}" class="home-post-thumb" alt="{{ latest.alt | default: latest_post.title }}">
</a>
{% endif %}
<div class="home-post-body">
<h4 class="home-post-title"><a href="{{ site.url }}{{ site.baseurl }}{{ latest_post.url }}">{{ latest_post.title }}</a></h4>
{% if latest_post.date %}<span class="home-post-date">{{ latest_post.date | date: "%b %-d, %Y" }}</span>{% endif %}
<p class="home-post-excerpt">{{ latest_post.content | strip_html | normalize_whitespace | truncatewords: 55 }}</p>
<a href="{{ site.url }}{{ site.baseurl }}{{ latest_post.url }}" class="home-post-more">Read the full post &rarr;</a>
</div>
</div>
{% endif %}

{% assign latest_viz = site.data.visualizations | last %}
{% if latest_viz %}
{% if latest_viz.image and latest_viz.image != "" %}
{% capture viz_thumb %}{{ site.url }}{{ site.baseurl }}/images/visualizations/{{ latest_viz.image }}{% endcapture %}
{% assign viz_thumb_alt = nil %}
{% else %}
{% assign viz_thumb = latest_viz.url | media_thumb %}
{% assign viz_thumb_alt = latest_viz.url | media_thumb_alt %}
{% endif %}
{% assign viz_embed = latest_viz.url | media_embed %}
### Latest Visualization

<div class="home-post-card{% unless viz_thumb %} home-post-card-noimg{% endunless %}" markdown="0">
{% if viz_thumb %}
{% if viz_embed %}
<div class="viz-frame" data-embed="{{ viz_embed }}" data-title="{{ latest_viz.title | escape }}" role="button" tabindex="0" aria-label="Play {{ latest_viz.title | escape }}">
{% else %}
<a class="viz-frame" href="{{ latest_viz.url }}" target="_blank" rel="noopener">
{% endif %}
<img class="viz-thumb" src="{{ viz_thumb }}" alt="{{ latest_viz.title | escape }}" loading="lazy"{% if viz_thumb_alt %} onerror="this.onerror=null;this.src='{{ viz_thumb_alt }}';"{% endif %}>
<span class="viz-play" aria-hidden="true"><i class="fa-solid fa-play"></i></span>
{% if viz_embed %}
</div>
{% else %}
</a>
{% endif %}
{% endif %}
<div class="home-post-body">
<h4 class="home-post-title">{{ latest_viz.title }}</h4>
{% if latest_viz.description and latest_viz.description != "" %}<p class="home-post-excerpt">{{ latest_viz.description }}</p>{% endif %}
<a href="{{ site.url }}{{ site.baseurl }}/visualizations/" class="home-post-more">See all visualizations &rarr;</a>
</div>
</div>
{% endif %}

{% assign latest_paper = site.data.latest_paper %}
{% if latest_paper %}
### Latest Publication

<div class="home-post-card home-post-card-noimg" markdown="0">
<div class="home-post-body">
{% assign paper_link = latest_paper.doi_url | default: latest_paper.arxiv_url %}
<h4 class="home-post-title">{% if paper_link %}<a href="{{ paper_link }}" target="_blank" rel="noopener">{{ latest_paper.title }}</a>{% else %}{{ latest_paper.title }}{% endif %}</h4>
{% assign paper_meta = "" | split: "" %}
{% if latest_paper.venue %}{% assign paper_meta = paper_meta | push: latest_paper.venue %}{% endif %}
{% if latest_paper.year %}{% assign paper_meta = paper_meta | push: latest_paper.year %}{% endif %}
{% if paper_meta.size > 0 %}<span class="home-post-date">{{ paper_meta | join: " &middot; " }}</span>{% endif %}
{% if latest_paper.authors %}<p class="home-post-excerpt">{{ latest_paper.authors }}</p>{% endif %}
<div class="talk-actions">
{% if latest_paper.pdf %}<a href="{{ site.url }}{{ site.baseurl }}/papers/{{ latest_paper.pdf }}" target="_blank" class="btn-pill btn-pdf">PDF</a>{% endif %}
{% if latest_paper.arxiv_url %}<a href="{{ latest_paper.arxiv_url }}" target="_blank" rel="noopener" class="btn-pill btn-arxiv">arXiv</a>{% endif %}
{% if latest_paper.doi_url %}<a href="{{ latest_paper.doi_url }}" target="_blank" rel="noopener" class="btn-pill btn-doi">DOI</a>{% endif %}
</div>
<a href="{{ site.url }}{{ site.baseurl }}/publications/" class="home-post-more">See all publications &rarr;</a>
</div>
</div>
{% endif %}

{% assign latest_talk = site.data.talks | last %}
{% if latest_talk %}
{% assign talk_embed = latest_talk.url | media_embed %}
{% assign talk_thumb = latest_talk.url | media_thumb %}
{% assign talk_thumb_alt = latest_talk.url | media_thumb_alt %}
### Latest Talk

<div class="home-post-card{% unless talk_thumb %} home-post-card-noimg{% endunless %}" markdown="0">
{% if talk_thumb %}
{% if talk_embed %}
<div class="viz-frame" data-embed="{{ talk_embed }}" data-title="{{ latest_talk.title | escape }}" role="button" tabindex="0" aria-label="Play {{ latest_talk.title | escape }}">
{% else %}
<a class="viz-frame" href="{{ latest_talk.url }}" target="_blank" rel="noopener">
{% endif %}
<img class="viz-thumb" src="{{ talk_thumb }}" alt="{{ latest_talk.title | escape }}" loading="lazy"{% if talk_thumb_alt %} onerror="this.onerror=null;this.src='{{ talk_thumb_alt }}';"{% endif %}>
<span class="viz-play" aria-hidden="true"><i class="fa-solid fa-play"></i></span>
{% if talk_embed %}
</div>
{% else %}
</a>
{% endif %}
{% endif %}
<div class="home-post-body">
<h4 class="home-post-title">{{ latest_talk.title }}</h4>
{% assign talk_meta = "" | split: "" %}
{% if latest_talk.event and latest_talk.event != "" %}{% assign talk_meta = talk_meta | push: latest_talk.event %}{% endif %}
{% if latest_talk.location and latest_talk.location != "" %}{% assign talk_meta = talk_meta | push: latest_talk.location %}{% endif %}
{% if latest_talk.date and latest_talk.date != "" %}{% assign talk_meta = talk_meta | push: latest_talk.date %}{% endif %}
{% if talk_meta.size > 0 %}<span class="home-post-date">{{ talk_meta | join: " &middot; " }}</span>{% endif %}
{% if latest_talk.description and latest_talk.description != "" %}<p class="home-post-excerpt">{{ latest_talk.description }}</p>{% endif %}
<div class="talk-actions">
{% if latest_talk.url and latest_talk.url != "" %}<a href="{{ latest_talk.url }}" target="_blank" rel="noopener" class="btn-pill btn-website"><i class="fa-brands fa-youtube"></i> Watch</a>{% endif %}
{% if latest_talk.slides and latest_talk.slides != "" %}<a href="{{ latest_talk.slides }}" target="_blank" rel="noopener" class="btn-pill btn-git"><i class="fa-solid fa-file-lines"></i> Slides</a>{% endif %}
</div>
<a href="{{ site.url }}{{ site.baseurl }}/presentations/" class="home-post-more">See all presentations &rarr;</a>
</div>
</div>
{% endif %}

{% if latest_viz or latest_talk %}{% include media_player.html %}{% endif %}
