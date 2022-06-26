# Cosmoverse

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/cosmoverse`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

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

### TODO

- Extract network clients for diffrent request.
- Create presenters for RPC responses.
- Use POST for JSON::PRC requests.
- Test helper to send transactions with gaiad and wait for next block.

- Find out about gRPC/JSON::RPC authentication and apply it.

```
https://grpc.io/docs/guides/auth/#with-server-authentication-ssltls-1
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/cosmoverse. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/cosmoverse/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Cosmoverse project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/cosmoverse/blob/master/CODE_OF_CONDUCT.md).
