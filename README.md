# BattingLeaders

A command line interface app for listing current MLB batting leaders for batting average.  This app allows users to check the current MLB batting leaders, and select a player in the list to see a more detailed info on the player.  The app scrapes the info from ESPN.go.com using nokogiri and open-url.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'batting_leaders'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install batting_leaders

## Usage

Start the app by typing:

    $ batting_leaders

, and follow the instructions in the app.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/batting_leaders. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
