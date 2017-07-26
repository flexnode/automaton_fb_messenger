# Automaton Facebook Messenger

[![Build Status](https://semaphoreci.com/api/v1/tslim/automaton_fb_messenger/branches/master/shields_badge.svg)](https://semaphoreci.com/tslim/automaton_fb_messenger)

[Automaton](https://github.com/flexnode/automaton) Adapter for Facebook Messenger

## Quick Start

  ```elixir
  # In your config/config.exs file
  config :sample, Sample.Bot,
    adapter: Automaton.Adapters.FacebookMessenger
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
