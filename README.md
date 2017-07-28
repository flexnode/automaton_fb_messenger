# Automaton Facebook Messenger [![Hex.pm](https://img.shields.io/hexpm/v/automaton_fb_messenger.svg)](https://hex.pm/packages/automaton_fb_messenger) [![Build Status](https://semaphoreci.com/api/v1/tslim/automaton_fb_messenger/branches/master/shields_badge.svg)](https://semaphoreci.com/tslim/automaton_fb_messenger) [![Coverage Status](https://coveralls.io/repos/github/flexnode/automaton_fb_messenger/badge.svg?branch=master)](https://coveralls.io/github/flexnode/automaton_fb_messenger?branch=master)

[Automaton](https://github.com/flexnode/automaton) Adapter for Facebook Messenger

## Quick Start

  ```elixir
  # In your config/config.exs file
  config :sample, Sample.Bot,
    adapter: Automaton.FacebookMessenger.Adapter,
    access_token: "YOUR_PAGE_ACCESS_TOKEN"
  ```

## Installation

Add Automaton in your `mix.exs` dependencies:

  ```elixir
  def deps do
    [{:automaton_fb_messenger, "~> 0.1.0"}]
  end
  ```

## License

Plug source code is released under MIT License.
Check [LICENSE](https://github.com/flexnode/automaton_fb_messenger/blob/master/LICENSE.md) file for more information.
