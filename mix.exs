defmodule Elmarismayil.MixProject do
  use Mix.Project

  def project do
    [
      app: :elmarismayil,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  defp aliases do
    [
      "site.build": ["build", "tailwind default --minify", "esbuild default --minify"]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:nimble_publisher, "~> 0.1.3"},
      {:phoenix_live_view, "~> 0.18.2"},
      {:esbuild, "~> 0.5"},
      {:tailwind, "~> 0.1.8"}
    ]
  end
end
