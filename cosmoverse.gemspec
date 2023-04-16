# frozen_string_literal: true

require_relative "lib/cosmoverse/version"

Gem::Specification.new do |spec|
  spec.name = "cosmoverse"
  spec.version = Cosmoverse::VERSION
  spec.authors = ["Armin Kirchner"]
  spec.email = ["post.armin@gmail.com"]

  spec.summary = "Ruby client for the cosmos ecosystem."
  spec.description = "Ruby client for the cosmos ecosystem."
  spec.homepage = "https://github.com/uchu-ai/cosmoverse"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org/"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/uchu-ai/cosmoverse"
  spec.metadata["changelog_uri"] = "https://github.com/uchu-ai/cosmoverse/blob/main/CHANGELOG.md"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.add_dependency "grpc"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
