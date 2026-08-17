---
title: "About"
layout: gridlay
sitemap: false
permalink: /about/
---

## About

<div class="section-card">
<div class="pi-card">
<img src="{{ site.url }}{{ site.baseurl }}/images/{{ site.photo }}" class="pi-photo" alt="{{ site.name }}" loading="lazy">
<div>
<h3 class="pi-name">{{ site.name }}</h3>
<p style="font-style: italic; color: var(--text-secondary);">{{ site.title }}, {{ site.institution }}</p>
<div class="pi-links">
{% if site.email %}<a href="mailto:{{ site.email }}" class="icon-link" title="Email"><i class="fa-solid fa-envelope"></i></a>{% endif %}
{% if site.links.cv and site.links.cv != "" %}<a href="{{ site.url }}{{ site.baseurl }}/{{ site.links.cv }}" class="icon-link" title="CV"><i class="ai ai-cv"></i></a>{% endif %}
{% if site.links.google_scholar and site.links.google_scholar != "" %}<a href="{{ site.links.google_scholar }}" class="icon-link" title="Google Scholar"><i class="ai ai-google-scholar"></i></a>{% endif %}
{% if site.links.github and site.links.github != "" %}<a href="{{ site.links.github }}" class="icon-link" title="GitHub"><i class="fa-brands fa-github"></i></a>{% endif %}
{% if site.links.researchgate and site.links.researchgate != "" %}<a href="{{ site.links.researchgate }}" class="icon-link" title="ResearchGate"><i class="ai ai-researchgate"></i></a>{% endif %}
</div>
{% if site.data.pi[0].education %}
<ul style="margin-top: var(--space-4);">
{% for education in site.data.pi[0].education %}
<li>{{ education | replace: "-","&#8211;" }}</li>
{% endfor %}
</ul>
{% endif %}
</div>
</div>
</div>

# About Me

## Research Background

My name is Danile Vickers. I like to think of myself as a computational physicist specializing in parallel compute and algorithms. For my undergraduate, I attended Wake Forest University in Winston-Salem, NC. Originally thinking that I would go into medicine, I initially started working with Dr. Sam Cho in buiphysics simulations during my underadute research (2014). During that time, I performed Molecular Dynamics (MD) simulations of the DNA G-quadruplex in a water box. I never published my simulations, but I owe a lot to Sam for teaching me the fundamentals of HPC. I eventually worked with Dr. Greg Cook on his work investigating harmonics of the Kerr metric for application in analyzing gravitational waves. Staying with Greg, I work with him on my undergraduate and Masters theses. My master's thesis, titled "Understanding Solutions of the Angular Teukolsky Equation in the Prolate Asymptotic Limit" was the largest at the time in its investigation of solutions to the Angular Teukolsky equation, which is used in determining the fundamental modes of Kerr. Over 6 months, I generated data and eventually produced a polynomial fit of solutions in the prolate limit.

After graduate school, I decided that I did not want to stay in astrophysics, but did eventually want to pursue a PhD. Because of this, I decided to spend some years working in research and exploring variaous fields. I worked on real-time Radar simulation code at the Georgia Tech Research Institute (GTRI), where I got experience working in C++ on distributed programs that interface with FPGAs. Following GTRI, I went to MIT Lincoln Lab (MITLL), where I was hired to write real-time GPU processing software. I also developed HPC code for use in plasma physics simulations. It was at MITLL that I understood that I had a fascination with optimizing software and pushing compute to the limits of what was possible. I also most-enjoyed my time working with fluids, as it allowed me wo work on many areas of physics computationally.

During my time working at MITLL, I also married my beautiful wife, Dr. Rachel Barkley, and published several papers and videos on EEG processing applied to Anesthesia and medical education. I had the benfit of working with Dr. Donald Lambert and Dr. Rafael Ortega at this time and publish with my wife. Not many people get to say their spouse is also their coauthor.

I am now at the Georgia Institute of Technology in the Computational Science and Engineering deparment. I work with several individuals, including Dr. Spencer Bryngelson of UT Austin, Dr. S. “Bala” Balachandar of UF, and Dr. Tom Jackson at UF. I am funded on the PSAAP IV center, and am currently focused on computational optimizations and simulations of particle-laden flows. More details can be found in my publications and talks.

## Not Reseach

Aside from my research, some may call me a relatively accomplished rock climber. I am an AMGA-certified Single Pitch Instructor, and I was the previous owner of Greater Boston Climbing School. I enjoy easy days of climbing outside where I can enjoy time with others in the sun with a great view. I am not finished guiding professionally, but I still enjoy setting some objectives outdoors with others. More information can be found in the blog.