# frozen_string_literal: true

# Add width and height to local images that lack them, read from the image file.
# Runs after Markdown is converted and before the layout, so Chirpy treats the
# sizes as if they were written in the post. Sizes written by hand are kept.

require 'fastimage'
require 'uri'

module ImageDimensions
  IMG_TAG = /<img\b[^>]*>/
  SRC_ATTR = /\ssrc="([^"]+)"/

  def self.local_path(site, doc, src)
    return if src.include?('://') || src.start_with?('//', 'data:')

    src = URI.decode_www_form_component(src.split(/[?#]/).first)
    unless src.start_with?('/')
      subpath = doc.data['media_subpath']
      return unless subpath

      src = File.join('/', subpath, src)
    end
    File.join(site.source, src)
  end

  def self.apply(doc)
    doc.content = doc.content.gsub(IMG_TAG) do |tag|
      next tag if tag.match?(/\swidth=/)

      src = tag[SRC_ATTR, 1]
      path = src && local_path(doc.site, doc, src)
      size = path && File.file?(path) && FastImage.size(path)
      next tag unless size

      tag.sub('<img', %(<img width="#{size[0]}" height="#{size[1]}"))
    end
  end
end

Jekyll::Hooks.register :documents, :post_convert do |doc|
  ImageDimensions.apply(doc)
end
