# frozen_string_literal: true

# {% kbd Ctrl+Shift+P %} renders keyboard keys:
#   <span class="keys"><kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>P</kbd></span>
# Spaces separate the chords of a sequence: {% kbd Ctrl+K Ctrl+S %}.
# A + with no key before it is the + key itself: {% kbd Ctrl++ %}.
# Styles: .keys in assets/css/jekyll-theme-chirpy.scss.

require 'cgi'

module Kbd
  # Characters kramdown would read as Markdown after Liquid runs.
  MARKDOWN_CHARS = /[\\`*_|\[\]]/

  def self.escape(key)
    CGI.escapeHTML(key).gsub(MARKDOWN_CHARS) { |c| "&##{c.ord};" }
  end

  def self.keys(chord)
    keys = []
    key = +''
    chord.each_char do |c|
      if c == '+' && !key.empty?
        keys << key
        key = +''
      else
        key << c
      end
    end
    keys << key unless key.empty?
    keys
  end

  class Tag < Liquid::Tag
    def initialize(tag_name, markup, tokens)
      super
      @chords = markup.split.map { |chord| Kbd.keys(chord) }
      raise Liquid::SyntaxError, 'kbd: no keys given, e.g. kbd Ctrl+Shift+P' if @chords.empty?
    end

    def render(_context)
      html = @chords.map do |keys|
        keys.map { |k| "<kbd>#{Kbd.escape(k)}</kbd>" }.join('+')
      end
      %(<span class="keys">#{html.join(' ')}</span>)
    end
  end
end

Liquid::Template.register_tag('kbd', Kbd::Tag)
