# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'batting_leaders/version'

Gem::Specification.new do |spec|
  spec.name          = "batting_leaders"
  spec.version       = BattingLeaders::VERSION
  spec.authors       = ["Han Lee"]
  spec.email         = ["hanlee12@gmail.com"]

  spec.summary       = %q{A CLI app for listing MLB batting leaders for batting average}
  spec.description   = %q{This app allows users to check the current MLB batting leaders, and select a player in the list to see a more detailed info on the player.}
  spec.homepage      = "https://github.com/tpstar/mlb-batting-leaders"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  spec.files         = ["lib/batting_leaders.rb", "lib/batting_leaders/cli.rb", "lib/batting_leaders/player.rb", "lib/batting_leaders/version.rb", "bin/batting_leaders", "bin/console", "bin/setup"]
  spec.bindir        = "bin"
  spec.executables   = ["batting_leaders"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  # spec.add_development_dependency "require_all" , '~> 1.3', '>= 1.3.3'
  spec.add_runtime_dependency "require_all" , '~> 1.3', '>= 1.3.3'
end
