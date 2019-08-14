lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'voom/presenters/plugins/markup/version'

Gem::Specification.new do |spec|
  spec.name          = 'markup_presenter_plugin'
  spec.version       = Voom::Presenters::Plugins::Markup::VERSION
  spec.authors       = ['Nick Miller']
  spec.email         = ['nick@geotix.com']

  spec.summary       = 'Render a markup document'
  spec.homepage      = 'http://github.com/mynorth/markup_presenter_plugin'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
end
