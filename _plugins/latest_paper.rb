require "bibtex"

# =============================================================
# Latest paper
# -------------------------------------------------------------
# Exposes the LAST entry of the scholar bibliography as
# site.data.latest_paper, so the home page can feature the newest
# publication without hardcoding a citation key.
#
# File order is what counts: add new papers to the BOTTOM of
# assets/ref.bib -- the same "newest at the bottom" convention
# _data/blog.yml, talks.yml and visualizations.yml already use.
# (The publications page is unaffected; it still sorts by year
# through the normal jekyll-scholar config.)
#
#   site.data.latest_paper.title
#   site.data.latest_paper.authors   -> "Wilfong, B, Le Berre, H, ..."
#   site.data.latest_paper.venue     -> journal, booktitle, or school
#   site.data.latest_paper.year
#   site.data.latest_paper.doi_url   -> normalized https://doi.org/...
#   site.data.latest_paper.arxiv_url -> set instead of doi_url for @unpublished
#   site.data.latest_paper.pdf       -> value of the `file` field, if any
#
# Any of these may be nil -- the home page template guards each one.
# =============================================================
module Jekyll
  class LatestPaperGenerator < Generator
    safe true
    priority :high

    def generate(site)
      path = bibliography_path(site)
      return if path.nil? || !File.exist?(path)

      entry = last_entry(path)
      return if entry.nil?

      site.data["latest_paper"] = {
        "key"       => entry.key.to_s,
        "type"      => entry.type.to_s,
        "title"     => field(entry, :title),
        "authors"   => authors(entry),
        "venue"     => field(entry, :journal) || field(entry, :booktitle) || field(entry, :school),
        "year"      => field(entry, :year),
        "publisher" => field(entry, :publisher),
        "doi_url"   => doi_url(entry),
        "arxiv_url" => arxiv_url(entry),
        "pdf"       => field(entry, :file),
      }
    end

    private

    # Mirrors the `source` + `bibliography` keys of the scholar config,
    # so moving the .bib file only has to be done in _config.yml.
    def bibliography_path(site)
      scholar = site.config["scholar"] || {}
      source  = (scholar["source"] || "./_bibliography").to_s
      file    = (scholar["bibliography"] || "references.bib").to_s

      # `source: /assets/` is site-relative, not an absolute FS path.
      File.join(site.source, source.sub(%r!\A/!, ""), file)
    end

    def last_entry(path)
      # :latex turns \'{\i} and friends into the characters they mean.
      bib = BibTeX.open(path, :filter => :latex)
      bib.select { |item| item.is_a?(BibTeX::Entry) }.last
    rescue StandardError => e
      Jekyll.logger.warn "LatestPaper:", "could not read #{path} (#{e.message})"
      nil
    end

    def field(entry, name)
      return nil unless entry.has_field?(name)

      value = entry[name].to_s.strip
      value.empty? ? nil : value
    end

    # BibTeX joins authors with " and "; the card wants a plain list.
    def authors(entry)
      raw = field(entry, :author)
      return nil if raw.nil?

      raw.split(/\s+and\s+/).map(&:strip).reject(&:empty?).join(", ")
    end

    # Entries in this bibliography store the DOI both bare and as a full
    # URL, so strip any resolver prefix before rebuilding it over https.
    def bare_doi(entry)
      raw = field(entry, :doi)
      return nil if raw.nil?

      doi = raw.sub(%r!\Ahttps?://(?:dx\.)?doi\.org/!i, "").strip
      doi.empty? ? nil : doi
    end

    def doi_url(entry)
      return nil if entry.type.to_s == "unpublished"

      doi = bare_doi(entry)
      doi.nil? ? nil : "https://doi.org/#{doi}"
    end

    # Preprints keep the arXiv id in the doi field, matching the
    # convention _layouts/bibtemplate.html already relies on.
    def arxiv_url(entry)
      return nil unless entry.type.to_s == "unpublished"

      id = bare_doi(entry)
      id.nil? ? nil : "https://arxiv.org/abs/#{id}"
    end
  end
end
