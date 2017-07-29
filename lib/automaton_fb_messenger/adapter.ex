defmodule Automaton.FacebookMessenger.Adapter do
  @moduledoc """
  Facebook Messenger Adapter
  """
  @behaviour Automaton.Adapter
  alias Automaton.FacebookMessenger.API

  def parse(response) when is_binary(response) do
    response
    |> Poison.decode
    |> case do
      {:ok, decoded_response} -> parse(decoded_response)
      {:error, _} -> {:error, "unable to parse message"}
      {:error, _, _} -> {:error, "unable to parse message"}
    end
  end

  def parse(response) do
    try do
      %{"entry" => [%{"messaging" => [message]}]} = response

      sender_id = get_in(message, ["sender", "id"])
      message_text = get_in(message, ["message", "text"])

      {:ok, sender_id, message_text, %{}}
    rescue
      _ ->
        {:error, "unable to parse message"}
    end
  end

  def send(sender_id, message_text, _context, config) do
    API.post_message(sender_id, message_text, config)
  end
end