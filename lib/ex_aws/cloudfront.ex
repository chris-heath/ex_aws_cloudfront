defmodule ExAws.Cloudfront do
  @moduledoc """
  Documentation for `ExAwsCloudfront`.
  """
  import ExAws.Utils
  @version "2020-05-31"

  @type list_distributions_opts :: [
    marker: binary,
    max_items: integer
  ]
  @spec list_distributions() :: ExAws.Operation.RestQuery.t
  @spec list_distributions(opts :: list_distributions_opts) :: ExAws.Operation.RestQuery.t
  def list_distributions(opts \\ []) do
    request(:get, :list_distributions, opts)
  end

  #####################
  # Helper Functions #
  #####################
  defp request(http_method, action, opts) do
    path = Keyword.get(opts, :path, "")
    params = opts |> Keyword.get(:params, []) |> rename_keys(max_items: :maxitems) |> Map.new
    %ExAws.Operation.RestQuery{
      http_method: http_method,
      path: "/#{@version}/distribution?#{path}",
      params: params,
      body: Keyword.get(opts, :body, ""),
      service: :cloudfront,
      action: action,
      parser: &ExAws.Cloudfront.Parsers.parse/2
    }
  end
end
