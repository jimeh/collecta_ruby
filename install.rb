require "fileutils"
require "rubygems"

dir = File.dirname(__FILE__)
templates = File.join(dir, "templates")
files = [
  File.join("config", "collecta.yml")
]

files.each do |file|
  FileUtils.cp File.join(templates, file), File.join(RAILS_ROOT, file) unless File.exist?(File.join(RAILS_ROOT, file))
end
