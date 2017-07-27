defmodule Automaton.FacebookMessenger.API do
  use HTTPoison.Base

  defp process_url(url) do
    "https://graph.facebook.com/v2.6/me" <> url
  end

  defp process_request_body(body) do
    body
    |> Poison.encode!
  end

  defp process_request_headers(headers) do
    headers
    |> Keyword.put(:"Content-Type", "application/json")
  end

  defp format_standard_response(http_response) do
    case http_response do
      {:ok, %HTTPoison.Response{body: %{"error": error}}} ->
        {:error, error}
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:error, "404 Not Found"}
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
      {:ok, %HTTPoison.Response{body: body}} ->
        {:ok, body}
    end
  end

  def post_message(recipient_id, message_text, config) do
    access_token = config[:access_token]
    payload = %{"recipient" => %{
                  "id" => recipient_id
                },
                "message" => %{
                  "text" => message_text
                }
              }

    post("/messages?access_token=#{access_token}", payload)
    |> format_standard_response
    |> case do
      {:ok, _} -> :ok
      {:error, error} -> {:error, error}
    end
  end
end
