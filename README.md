# Heroicon

[![Gem Version](https://badge.fury.io/rb/heroicon-ruby.svg)](https://rubygems.org/gems/heroicon-ruby)
[![Build Status](https://github.com/jclusso/heroicon-ruby/workflows/CI/badge.svg)](https://github.com/jclusso/heroicon-ruby/actions)

Ruby on Rails view helpers for the beautiful hand-crafted SVG icons, Heroicons.

This gem has no official affiliation with Tailwind CSS or the Heroicon team. Check out their sites:

- [Tailwind CSS](https://tailwindcss.com/?utm_source=jclusso_heroicon-ruby_github)
- [Tailwind UI](https://tailwindui.com/?utm_source=jclusso_heroicon-ruby_github)
- [Heroicons](https://heroicons.com/?utm_source=jclusso_heroicon-ruby_github)

## Installation

Add this line to your application's Gemfile:

```ruby
gem "heroicon-ruby"
```

And then execute:

```bash
$ bundle
```

Run the installer

```bash
$ rails g heroicon:install
```

## Usage

To use a icon in your views, simply use the provided view helper with the name of an icon.

```rb
<%= heroicon "magnifying-glass" %>
```

Heroicon comes with 4 variants, `:outline`, `:solid`, `:mini`, and `:micro`. The default variant is `:solid`. This can be changed in `config/initializers/heroicon.rb`, which is generated during installation (See [Configuration](#configuration)). To overwrite this in the view, use

```rb
<%= heroicon "magnifying-glass", variant: :outline %>
```

You can also pass HTML options directly to the icon.

```rb
<%= heroicon "magnifying-glass", options: { class: "text-primary-500" } %>
```

Heroicon currently supports icons matching [`Version 2.1.1`](https://github.com/tailwindlabs/heroicons/releases/tag/v2.1.1). If there is an icon that is missing or a new version released, feel free to contribute by following our contributing guide below.

# Configuration

After running `rails g heroicon:install` in the installation step, a configuration file will be created at `config/initializers/heroicon.rb`.

Currently there are two configuration options:

- `variant`: The default variant to use if no variant is specified in the view.
  - You can set this to either `:outline` or `:solid`. Defaults to `:solid`.
- `default_class`: A default class that gets applied to every icon.
  - This accepts either a String to apply to every icon, or a Hash, which applies the class based on the variant of the icon (see the example below).
  - You can disable this on a per-icon basis by passing `disable_default_class: true` in the options hash within the view.

**Note:** If you enable the `default_class` config, make sure to include `config/intializers/heroicon.rb` in the list of purged paths. For TailwindCSS 3.0+, you should have something like this in your `tailwind.config.js`:

```js
module.exports = {
  //...
  content: [
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*',
    './config/initializers/heroicon.rb', // 👈
  ],
  //...
}
```

An example configuration looks like this:

```ruby
Heroicon.configure do |config|
  config.variant = :solid
  config.default_class = {solid: "h-6 w-6", outline: "h-6 w-6", mini: "h-5 w-5"}
end
```

Disabling the default class in the view:

```rb
<%= heroicon "magnifying-glass", options: { class: "custom-class", disable_default_class: true } %>
```

## Contributing

Anyone is encouraged to help improve this project. Here are a few ways you can help:

- [Report bugs](https://github.com/jclusso/heroicon-ruby/issues)
- Fix bugs and [submit pull requests](https://github.com/jclusso/heroicon-ruby/pulls)
- Write, clarify, or fix documentation
- Suggest or add new features

To get started with development:

```
git clone https://github.com/jclusso/heroicon-ruby.git
cd heroicon
bundle install
bundle exec rake test
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
