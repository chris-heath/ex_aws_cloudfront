defmodule ExAwsCloudfront.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_aws_cloudfront,
      version: "0.1.0",
      elixir: "~> 1.8.1",
      start_permanent: Mix.env() == :prod,
      deps: deps()
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
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:hackney, ">= 0.0.0", only: [:dev, :test]},
      {:sweet_xml, ">= 0.0.0", only: [:dev, :test]},
      {:poison, ">= 0.0.0", only: [:dev, :test]},
      {:xml_builder, ">= 0.0.0"},
      {:ex_aws, "~> 2.1.1"}
    ]
  end
end
