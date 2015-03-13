# -*- encoding: utf-8 -*-
# stub: edn 1.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "edn"
  s.version = "1.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Clinton N. Dreisbach"]
  s.date = "2014-04-17"
  s.description = "'edn implements a reader for Extensible Data Notation by Rich Hickey.'"
  s.email = ["clinton@thinkrelevance.com"]
  s.homepage = ""
  s.rubygems_version = "2.2.2"
  s.summary = "'edn implements a reader for Extensible Data Notation by Rich Hickey.'"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<parslet>, ["~> 1.4.0"])
      s.add_development_dependency(%q<pry>, ["~> 0.9.10"])
      s.add_development_dependency(%q<rspec>, ["~> 2.11.0"])
      s.add_development_dependency(%q<rantly>, ["~> 0.3.1"])
      s.add_development_dependency(%q<rake>, ["~> 10.0.3"])
    else
      s.add_dependency(%q<parslet>, ["~> 1.4.0"])
      s.add_dependency(%q<pry>, ["~> 0.9.10"])
      s.add_dependency(%q<rspec>, ["~> 2.11.0"])
      s.add_dependency(%q<rantly>, ["~> 0.3.1"])
      s.add_dependency(%q<rake>, ["~> 10.0.3"])
    end
  else
    s.add_dependency(%q<parslet>, ["~> 1.4.0"])
    s.add_dependency(%q<pry>, ["~> 0.9.10"])
    s.add_dependency(%q<rspec>, ["~> 2.11.0"])
    s.add_dependency(%q<rantly>, ["~> 0.3.1"])
    s.add_dependency(%q<rake>, ["~> 10.0.3"])
  end
end
