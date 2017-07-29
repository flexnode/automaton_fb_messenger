defmodule AutomatonFbMessenger.Mixfile do
  use Mix.Project

  def project do
    [app: :automaton_fb_messenger,
     description: description(),
     package: package(),
     name: "Automaton Facebook Messenger Adapter",
     source_url: "https://github.com/flexnode/automaton_fb_messenger",
     version: "0.1.1",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     elixirc_paths: elixirc_paths(Mix.env),
     test_coverage: [tool: ExCoveralls],
     preferred_cli_env: ["coveralls": :test, "coveralls.detail": :test, "coveralls.post": :test, "coveralls.html": :test, "coveralls.semaphore": :test]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [{:automaton, "~> 0.1"},
     {:httpoison, "~> 0.12"},
     {:poison, "< 4.0.0"},
     {:excoveralls, "~> 0.7", only: :test},
     {:bypass, "~> 0.8", only: :test},
     {:ex_doc, ">= 0.0.0", only: [:dev, :docs]}]
  end

  defp description do
    """
    Automaton Adapter for Facebook Messenger
    """
  end

  defp package do
    [
      name: :automaton_fb_messenger,
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["T.S. Lim"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/flexnode/automaton_fb_messenger"}
    ]
  end
end
