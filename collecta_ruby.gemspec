# Generated by jeweler
# DO NOT EDIT THIS FILE
# Instead, edit Jeweler::Tasks in Rakefile, and run `rake gemspec`
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{collecta_ruby}
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jim Myhrberg"]
  s.date = %q{2009-10-13}
  s.description = %q{A quick and rough Ruby/Rails library to query info from the Collecta API.}
  s.email = %q{contact@jimeh.me}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.md"
  ]
  s.files = [
    ".gitignore",
     "LICENSE",
     "README.md",
     "Rakefile",
     "VERSION",
     "collecta_ruby.gemspec",
     "init.rb",
     "install.rb",
     "lib/collecta.rb",
     "lib/collecta_ruby.rb",
     "tasks/collecta_ruby_tasks.rake",
     "templates/config/collecta.yml",
     "test/collecta_ruby_test.rb",
     "test/test_helper.rb",
     "uninstall.rb"
  ]
  s.homepage = %q{http://github.com/jimeh/collecta_ruby}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Ruby library to query the Collecta.com API.}
  s.test_files = [
    "test/collecta_ruby_test.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
