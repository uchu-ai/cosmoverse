# frozen_string_literal: true

module GaiaTestHelper
  def self.generate_address
    random = (0...8).map { rand(65..90).chr }.join

    `docker-compose exec -T gaia gaiad keys add tester-#{random} --keyring-backend test --output json 2>&1 | cat`
      .then { |json| JSON.parse(json)["address"] }
  end

  def self.send_tokens(address:, amount:)
    `docker-compose exec -T gaia gaiad tx bank send tester #{address} #{amount} --keyring-backend test \
    --chain-id testhub --gas-prices 0.0025uatom --yes --output json`
  end

  def self.wait_for_next_block
    `docker-compose exec -T gaia wait_for_next_block`
  end
end
