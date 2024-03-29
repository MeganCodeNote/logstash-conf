# -*- encoding: utf-8 -*-
# stub: elasticsearch 1.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "elasticsearch"
  s.version = "1.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Karel Minarik"]
  s.date = "2014-05-22"
  s.description = "Ruby integrations for Elasticsearch (client, API, etc.)\n"
  s.email = ["karel.minarik@elasticsearch.org"]
  s.extra_rdoc_files = ["README.md", "LICENSE.txt"]
  s.files = ["README.md", "LICENSE.txt"]
  s.homepage = "http://github.com/elasticsearch/elasticsearch-ruby"
  s.licenses = ["Apache 2"]
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.1.9"
  s.summary = "Ruby integrations for Elasticsearch"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<elasticsearch-transport>, ["= 1.0.2"])
      s.add_runtime_dependency(%q<elasticsearch-api>, ["= 1.0.2"])
      s.add_development_dependency(%q<bundler>, ["> 1"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<elasticsearch-extensions>, [">= 0"])
      s.add_development_dependency(%q<ansi>, [">= 0"])
      s.add_development_dependency(%q<shoulda-context>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<turn>, [">= 0"])
      s.add_development_dependency(%q<yard>, [">= 0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
      s.add_development_dependency(%q<ci_reporter>, [">= 0"])
      s.add_development_dependency(%q<minitest>, ["~> 4.0"])
      s.add_development_dependency(%q<ruby-prof>, [">= 0"])
      s.add_development_dependency(%q<require-prof>, [">= 0"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<simplecov-rcov>, [">= 0"])
      s.add_development_dependency(%q<cane>, [">= 0"])
      s.add_development_dependency(%q<coveralls>, [">= 0"])
    else
      s.add_dependency(%q<elasticsearch-transport>, ["= 1.0.2"])
      s.add_dependency(%q<elasticsearch-api>, ["= 1.0.2"])
      s.add_dependency(%q<bundler>, ["> 1"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<elasticsearch-extensions>, [">= 0"])
      s.add_dependency(%q<ansi>, [">= 0"])
      s.add_dependency(%q<shoulda-context>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<turn>, [">= 0"])
      s.add_dependency(%q<yard>, [">= 0"])
      s.add_dependency(%q<pry>, [">= 0"])
      s.add_dependency(%q<ci_reporter>, [">= 0"])
      s.add_dependency(%q<minitest>, ["~> 4.0"])
      s.add_dependency(%q<ruby-prof>, [">= 0"])
      s.add_dependency(%q<require-prof>, [">= 0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<simplecov-rcov>, [">= 0"])
      s.add_dependency(%q<cane>, [">= 0"])
      s.add_dependency(%q<coveralls>, [">= 0"])
    end
  else
    s.add_dependency(%q<elasticsearch-transport>, ["= 1.0.2"])
    s.add_dependency(%q<elasticsearch-api>, ["= 1.0.2"])
    s.add_dependency(%q<bundler>, ["> 1"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<elasticsearch-extensions>, [">= 0"])
    s.add_dependency(%q<ansi>, [">= 0"])
    s.add_dependency(%q<shoulda-context>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<turn>, [">= 0"])
    s.add_dependency(%q<yard>, [">= 0"])
    s.add_dependency(%q<pry>, [">= 0"])
    s.add_dependency(%q<ci_reporter>, [">= 0"])
    s.add_dependency(%q<minitest>, ["~> 4.0"])
    s.add_dependency(%q<ruby-prof>, [">= 0"])
    s.add_dependency(%q<require-prof>, [">= 0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<simplecov-rcov>, [">= 0"])
    s.add_dependency(%q<cane>, [">= 0"])
    s.add_dependency(%q<coveralls>, [">= 0"])
  end
end
