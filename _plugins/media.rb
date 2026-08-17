require "uri"

# =============================================================
# Media filters
# -------------------------------------------------------------
# Turn a plain share link (YouTube, Google Drive, Vimeo) into the
# pieces the visualization page needs: a thumbnail image and an
# embeddable player URL. Nothing has to be downloaded or stored
# locally -- the thumbnails are served by the host.
#
#   {{ item.url | media_kind }}       -> "youtube" | "drive" | "vimeo" | nil
#   {{ item.url | media_thumb }}      -> preview image URL, or nil
#   {{ item.url | media_thumb_alt }}  -> lower-res fallback, or nil
#   {{ item.url | media_embed }}      -> iframe src for inline playback, or nil
# =============================================================
module Jekyll
  module MediaFilters
    def media_kind(url)
      media_info(url)[:kind]
    end

    def media_thumb(url)
      media_info(url)[:thumb]
    end

    # YouTube only publishes maxresdefault.jpg for some uploads; the
    # page falls back to this one if the first image fails to load.
    def media_thumb_alt(url)
      media_info(url)[:thumb_alt]
    end

    def media_embed(url)
      media_info(url)[:embed]
    end

    private

    def media_info(url)
      str = url.to_s.strip
      return {} if str.empty?

      uri = begin
        URI.parse(str)
      rescue URI::InvalidURIError
        nil
      end
      return {} if uri.nil? || uri.host.nil?

      host = uri.host.downcase.sub(%r!\Awww\.!, "")
      path = uri.path.to_s
      query = begin
        Hash[URI.decode_www_form(uri.query.to_s)]
      rescue ArgumentError
        {}
      end

      case host
      when "youtu.be"
        youtube(path.split("/").reject(&:empty?).first)
      when "youtube.com", "m.youtube.com", "youtube-nocookie.com"
        id = query["v"] || path[%r!/(?:embed|shorts|v|live)/([^/?#]+)!, 1]
        youtube(id)
      when "drive.google.com"
        id = path[%r!/file/d/([^/?#]+)!, 1] || query["id"]
        drive(id)
      when "vimeo.com", "player.vimeo.com"
        vimeo(path[%r!(\d+)!, 1])
      else
        {}
      end
    end

    def youtube(id)
      return {} if id.nil? || id.empty?

      {
        :kind      => "youtube",
        :thumb     => "https://i.ytimg.com/vi/#{id}/maxresdefault.jpg",
        :thumb_alt => "https://i.ytimg.com/vi/#{id}/hqdefault.jpg",
        :embed     => "https://www.youtube-nocookie.com/embed/#{id}?rel=0&autoplay=1",
      }
    end

    # Works for anything shared as "Anyone with the link".
    def drive(id)
      return {} if id.nil? || id.empty?

      {
        :kind  => "drive",
        :thumb => "https://drive.google.com/thumbnail?id=#{id}&sz=w1000",
        :embed => "https://drive.google.com/file/d/#{id}/preview",
      }
    end

    # Vimeo thumbnails need an API call, so there is no build-time URL
    # for them -- set `image:` in the yml if you want a preview.
    def vimeo(id)
      return {} if id.nil? || id.empty?

      {
        :kind  => "vimeo",
        :embed => "https://player.vimeo.com/video/#{id}?autoplay=1",
      }
    end
  end
end

Liquid::Template.register_filter(Jekyll::MediaFilters)
