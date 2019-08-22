lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "kat/version"

Gem::Specification.new do |spec|
  spec.name          = "kat"
  spec.version       = Kat::VERSION
  spec.author        = "Dennis Sutch"
  spec.email         = "dennis@sutch.com"

  spec.summary       = %q{Keycloak Analysis Tool (Kat).}
  spec.description   = %q{Kat assists with understanding the workings of Keycloak.}
  spec.homepage      = "https://github.com/sutch/kat"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "https://https://github.com/sutch/kat"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/sutch/kat"
  spec.metadata["changelog_uri"] = "https://github.com/sutch/kat/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
