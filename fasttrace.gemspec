# frozen_string_literal: true

require_relative "lib/fasttrace/version"

Gem::Specification.new do |spec|
  spec.name          = "fasttrace"
  spec.version       = Fasttrace::VERSION
  spec.authors       = ["Nigel Baillie"]
  spec.email         = ["nigelbaillie@hey.com"]

  spec.summary       = "Trace your Ruby programs - and fast!"
  spec.description   = <<~DESC
    This library does nothing but spit out an execution trace when you tell it to.
    Those traces can be used for runtime analysis and visualization.
  DESC
  spec.homepage      = "https://nigelbaillie.me"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.4.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'https://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Resonious/fasttrace"
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.extensions    = ["ext/fasttrace/extconf.rb"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
