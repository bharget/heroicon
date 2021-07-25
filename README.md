# Heroicon
[![Build Status](https://github.com/bharget/heroicon/workflows/CI/badge.svg)](https://github.com/bharget/heroicon/actions)
[![Ruby Style Guide](https://img.shields.io/badge/code_style-standard-brightgreen.svg)](https://github.com/testdouble/standard)

Ruby on Rails view helpers for the beautiful hand-crafted SVG icons, Heroicons.

 Used in production at [Morning Brew ☕](https://www.morningbrew.com/?utm_source=bharget_github)


This gem has no official affiliation with Tailwind CSS or the Heroicon team (yet!). Check out their sites:

- [Tailwind CSS](https://tailwindcss.com/?utm_source=bharget_github)
- [Tailwind UI](https://tailwindui.com/?utm_source=bharget_github)
- [Heroicons](https://heroicons.com/?utm_source=bharget_github)

## Installation
Add this line to your application's Gemfile:

```ruby
gem "heroicon"
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
<%= heroicon "search" %>
```

Heroicon comes with two variants, `:outline` and `:solid`. The default variant is `:solid`. This can be changed in `config/initializers/heroicon.rb`, which is generated during installation. To overwrite this in the view, use

```rb
<%= heroicon "search", variant: :outline %>
```

You can also pass HTML options directly to the icon.

```rb
<%= heroicon "search", options: { class: "text-primary-500" } %>
```

Heroicon currently supports icons up to [`Version 1.0.1`](https://github.com/tailwindlabs/heroicons/releases/tag/v1.0.1). If there is a icon that is missing, feel free to contribute by following our contributing guide below.

## Contributing

Anyone is encouraged to help improve this project. Here are a few ways you can help:

- [Report bugs](https://github.com/bharget/heroicon/issues)
- Fix bugs and [submit pull requests](https://github.com/bharget/heroicon/pulls)
- Write, clarify, or fix documentation
- Suggest or add new features

To get started with development:

```
git clone https://github.com/bharget/heroicon.git
cd heroicon
bundle install
bundle exec rake test
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
