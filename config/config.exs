use Mix.Config

config :automaton_fb_messenger, api_url: "https://graph.facebook.com"

import_config "#{Mix.env}.exs"