---
title: "Blog"
layout: gridlay
sitemap: false
permalink: /blog/
---

## Blog

{% if site.data.blog and site.data.blog.size > 0 %}
<div class="blog-grid" markdown="0">
{% assign entries = site.data.blog | reverse %}
{% for entry in entries %}
{% assign target = entry.post | append: ".md" | prepend: "_blog/" %}
{% assign post = site.blog | where: "relative_path", target | first %}
{% if post %}
<div class="blog-card">
{% if entry.image %}
<a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">
<img src="{{ site.url }}{{ site.baseurl }}/images/blog/{{ entry.image }}" class="blog-thumb" alt="{{ entry.alt | default: post.title }}">
</a>
{% endif %}
<div class="blog-body">
<h4 class="blog-title"><a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></h4>
{% if post.date %}<span class="blog-date">{{ post.date | date: "%b %-d, %Y" }}</span>{% endif %}
<p class="blog-summary">{{ post.summary | default: post.excerpt | strip_html | truncatewords: 40 }}</p>
</div>
</div>
{% endif %}
{% endfor %}
</div>
{% else %}
<p class="text-muted">No blog posts yet.</p>
{% endif %}
