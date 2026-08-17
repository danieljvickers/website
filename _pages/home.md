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

### Recent News

<div class="section-card" markdown="0">
<div class="news-timeline">
{% for article in site.data.news %}
<div class="news-item">
<span class="news-date">{{ article.date }}</span>
<span class="news-headline">{{ article.headline }}</span>
</div>
{% endfor %}
</div>
</div>
