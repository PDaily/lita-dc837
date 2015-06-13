Gem::Specification.new do |spec|
  spec.name          = "lita-dc837"
  spec.version       = "0.1.0"
  spec.authors       = ["PDaily"]
  spec.email         = ["pat.irwin4@gmail.com"]
  spec.description   = "Handler for the DC837 Chat Room"
  spec.summary       = "Pointless features to entertain and distract from real work!"
  spec.homepage      = "http://www.gitbub.com/pdaily/lita-dc837"
  spec.license       = "MIT"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 4.3"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "rspec", ">= 3.0.0"
end
