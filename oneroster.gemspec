Gem::Specification.new do |s|
  s.name = "oneroster"
  s.version = "0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Thomas R. Koll"]
  s.date = "2016-10-28"
  s.description = "Provides a ruby interface to Infinite Campus OneRoster API"
  s.summary = "Provides a ruby interface to Infinite Campus OneRoster API"
  s.email = "tomk@naiku.net"
  s.extra_rdoc_files = [
    "README"
  ]
  s.add_dependency 'flexirest'
  s.add_dependency 'oauth'
  s.add_dependency 'addressable'
  s.files = [
    "Gemfile",
    "LICENSE",
    "README",
    "lib/oneroster.rb",
    "lib/oneroster/apibase.rb",
    "lib/oneroster/endpoints.rb",
    "oneroster.gemspec"
    ]
end
