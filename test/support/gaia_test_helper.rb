# frozen_string_literal: true

module GaiaTestHelper
  class TesterWallet
    def initialize(params)
      @address = params.fetch("address")
      @name = params.fetch("name")
    end

    attr_reader :address, :name
  end

  def self.genesis_wallet
    GaiaTestHelper::TesterWallet.new(
      "address" => "cosmos14eadktsf4zzah6har7h7a46tunnj7rq7lmppy5",
      "name" => "tester"
    )
  end

  def self.generate_wallet
    random = (0...8).map { rand(65..90).chr }.join

    `docker-compose exec -T gaia gaiad keys add tester-#{random} --keyring-backend test --output json 2>&1 | cat`
      .then { |json| GaiaTestHelper::TesterWallet.new(JSON.parse(json)) }
  end

  def self.send_tokens(to_wallet:, amount:, from_wallet: genesis_wallet)
    `docker-compose exec -T gaia gaiad tx bank send #{from_wallet.name} #{to_wallet.address} #{amount} \
     --keyring-backend test --chain-id testhub --gas-prices 0.0025uatom --yes --output json`
  end

  def self.wait_for_next_block
    `docker-compose exec -T gaia wait_for_next_block`
  end
end
