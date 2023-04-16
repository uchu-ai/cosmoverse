# Cosmoverse

The Cosmoverse GEM tries to make it easy to request data directly from the Cosmos blockchains. Cosmovers attempt to wrap complex blockchain data types in an easy-to-understand structure.

This project is in a very early stage and will most likely change dramatically.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add cosmoverse

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install cosmoverse

## Usage

### Example: Getting all balanced for an account.

```
# Query default tendermint endpoint (https://rpc.cosmos.network)
Cosmoverse::Cosmos.all_balances 'cosmos111111111111111111111111111111111111111'

# Query local tendermint JSON::RPC host
Cosmoverse::Cosmos.all_balances 'cosmos111111111111111111111111111111111111111', tendermint_rpc_host: 'http://localhost:26657'

# Query local gRPC host
Cosmoverse::Cosmos.all_balances 'cosmos111111111111111111111111111111111111111', tendermint_rpc_host: 'localhost:9090'
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `docker-compose up -d` and `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### Generate from cosmos protos

```
bin/generate_protos
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/cosmoverse. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/cosmoverse/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Cosmoverse project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/cosmoverse/blob/master/CODE_OF_CONDUCT.md).
