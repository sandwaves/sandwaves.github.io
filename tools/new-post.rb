#!/usr/bin/env ruby
# frozen_string_literal: true
#
# Create a new post in _posts/ following the Jekyll naming convention
# (YYYY-MM-DD-slug.md) with Chirpy front matter, then open it in VS Code.
#
# Usage: ruby tools/new-post.rb "Post Title" ["Category, Subcategory"] ["tag1, tag2"]

title = ARGV[0].to_s.strip
abort "Usage: ruby tools/new-post.rb \"Post Title\" [categories] [tags]" if title.empty?

split_list = ->(str) { str.to_s.split(",").map(&:strip).reject(&:empty?) }
categories = split_list.call(ARGV[1]).first(2) # Chirpy supports at most two levels
tags = split_list.call(ARGV[2]).map(&:downcase) # tag names should be lowercase

slug = title.downcase.gsub(/[^\p{Alnum}]+/, "-").gsub(/\A-+|-+\z/, "")
abort "Could not derive a file name from title: #{title}" if slug.empty?

now = Time.now
posts_dir = File.expand_path("../_posts", __dir__)
path = File.join(posts_dir, "#{now.strftime('%Y-%m-%d')}-#{slug}.md")
abort "Post already exists: #{path}" if File.exist?(path)

yaml_str = ->(s) { %("#{s.gsub('\\', '\\\\\\\\').gsub('"', '\\"')}") }

File.write(path, <<~POST)
  ---
  title: #{yaml_str.call(title)}
  date: #{now.strftime('%Y-%m-%d %H:%M:%S %z')}
  categories: [#{categories.join(', ')}]
  tags: [#{tags.join(', ')}] # TAG names should always be lowercase
  ---

POST

puts "Created #{path}"
system("code", "--reuse-window", path) || puts("Open it manually (VS Code CLI 'code' not found).")
