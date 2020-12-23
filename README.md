# ParseGemspec::Cli

[![Gem version][gem-image]][gem-url] [![CI Status][ci-image]][ci-url]

> CLI for parsing *.gemspec file. Convert to JSON format.

See [parse_gemspec](https://rubygems.org/gems/parse_gemspec) ([repo](https://github.com/packsaddle/ruby-parse_gemspec)) for the programmatic API.


## Usage

```bash
$ parse-gemspec-cli
Commands:
  parse-gemspec-cli help [COMMAND]      # Describe available commands or one specific command
  parse-gemspec-cli [parse] GEMSPEC_PATH  # Parse *.gemspec
  parse-gemspec-cli version             # Show the ParseGemspec::Cli version
```


## Example

### Pretty print

```bash
$ parse-gemspec-cli checkstyle_filter-git.gemspec | jq .
{
  "name": "checkstyle_filter-git",
  "version": "1.0.3.pre.beta",
  "homepage": "https://github.com/packsaddle/ruby-checkstyle_filter-git"
}
```


### Use from another language

```js
// javascript
'use strict';
var execSync = require('child_process').execSync;
var gemspec = JSON.parse(execSync('bundle exec parse-gemspec-cli parse_gemspec-cli.gemspec'));

module.exports = {
  version: gemspec.version
};
```

Actual example [.conventional-changelog.context.js](./.conventional-changelog.context.js).

## Changelog

[changelog.md](./changelog.md).


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'parse_gemspec-cli'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install parse_gemspec-cli


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/packsaddle/ruby-parse_gemspec-cli. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

© [sanemat](http://sane.jp)

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

[ci-url]: https://circleci.com/gh/packsaddle/ruby-parse_gemspec-cli
[ci-image]: https://img.shields.io/circleci/build/github/packsaddle/ruby-parse_gemspec-cli?style=flat-square
[gem-url]: https://rubygems.org/gems/parse_gemspec-cli
[gem-image]: http://img.shields.io/gem/v/parse_gemspec-cli.svg?style=flat-square
