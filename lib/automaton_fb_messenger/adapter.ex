defmodule Automaton.FacebookMessenger.Adapter do
  @moduledoc """
  Facebook Messenger Adapter
  """
  @behaviour Automaton.Adapter
  alias Automaton.FacebookMessenger.API

  require Logger

  def parse(response) do
    try do
      %{"entry" => [%{"messaging" => [message]}]} = response

      sender_id = get_in(message, ["sender", "id"])
      message_text = get_in(message, ["message", "text"])

      Logger.info("RECEIVED: sender_id:#{sender_id} message:#{message_text}")
      {:ok, sender_id, message_text, %{}}
    rescue
      _ ->
        {:error, "unable to parse message"}
    end
  end

  def send(sender_id, message_text, _context, config) do
    Logger.info("SENT: sender_id:#{sender_id} message:#{message_text}")
    API.post_message(sender_id, message_text, config)
  end
end