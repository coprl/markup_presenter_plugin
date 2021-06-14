# Markup Presenter Plugin

A [COPRL](http://github.com/coprl/coprl) presenter plugin that renders markup (HTML) in an autosized iframe. 
Can be used for TOC or other external docs display and digitally sign.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'markup_presenter_plugin', git: 'https://github.com/coprl/markup_presenter_plugin', require: false
```

And then execute:

    $ bundle


## Usage in POMs

Include the markup_presenter_plugin on a per-POM basis via the `plugin` method.

```ruby
# presenters/foos/view.pom
Coprl::Presenters.define(:view, namespace: :foos) do
  plugin :markup

  # ...
end
```

Then, embed the markup in the document, presumbable from a file or a database.

```ruby
    markup "<h1>Hello Cruel World</h1>"
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/coprl/markup_presenter_plugin.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the COPRL project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/coprl/coprl/blob/master/CODE-OF-CONDUCT.md).
