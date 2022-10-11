# frozen_string_literal: true

require "securerandom"

module GaiaTestHelper
  TesterWallet = Struct.new("TesterWallet", :address, :name)
  TesterTx = Struct.new("TesterTx", :tx_hash)

  def self.genesis_wallet
    GaiaTestHelper::TesterWallet.new("cosmos14eadktsf4zzah6har7h7a46tunnj7rq7lmppy5", "tester")
  end

  def self.generate_wallet
    random = SecureRandom.hex

    response =
      `docker-compose exec -T gaia gaiad keys add tester-#{random} --keyring-backend test --output json 2>&1 | cat`

    GaiaTestHelper::TesterWallet.new(*JSON.parse(response).values_at("address", "name"))
  end

  def self.send_tokens(to_wallet:, amount:, from_wallet: genesis_wallet)
    response =
      `docker-compose exec -T gaia gaiad tx bank send #{from_wallet.name} #{to_wallet.address} #{amount} \
       --keyring-backend test --chain-id testhub --gas-prices 0.0025uatom --yes --output json`

    GaiaTestHelper::TesterTx.new(JSON.parse(response).fetch("txhash"))
  end

  def self.wait_for_next_block
    `docker-compose exec -T gaia wait_for_next_block`
  end
end
