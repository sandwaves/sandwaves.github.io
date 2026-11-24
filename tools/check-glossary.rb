#!/usr/bin/env ruby
# frozen_string_literal: true

# Fast check for {% glossary term %} usage, without a full Jekyll build.
# Fails on terms used in posts, tabs or cheatsheets that are missing from _data/glossary.yml,
# and on duplicated terms inside the glossary itself.

require 'yaml'

ROOT = File.expand_path('..', __dir__)
glossary = YAML.safe_load_file(File.join(ROOT, '_data', 'glossary.yml')) || []
terms = glossary.map { |entry| entry['term'].to_s }

errors = []

terms.tally.each do |term, count|
  errors << "Duplicate glossary term: #{term} (#{count}x)" if count > 1
end

known = terms.map(&:downcase)
tag = /\{%-?\s*glossary\s+([^,%}]+?)\s*(?:,[^%]*)?-?%\}/

Dir.glob(File.join(ROOT, '{_posts,_tabs,_cheatsheets}', '**', '*.{md,markdown,html}')).sort.each do |file|
  File.foreach(file).with_index(1) do |line, number|
    line.scan(tag) do |(term)|
      next if known.include?(term.downcase)

      errors << "#{file.delete_prefix("#{ROOT}/")}:#{number}: unknown glossary term '#{term}'"
    end
  end
end

if errors.empty?
  puts "Glossary OK (#{terms.size} terms)"
else
  warn errors
  exit 1
end
