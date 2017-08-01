defmodule Automaton.FacebookMessenger.AdapterTest do
  use ExUnit.Case
  alias Automaton.FacebookMessenger.Adapter

  describe "parse/1" do
    test "returns sender id, message text and context if parse is successful" do
      assert {:ok, "1230262267102156", "Testing", %{}} = Adapter.parse(facebook_webhook_response())
    end

    test "returns error if fail to parse the response" do
      assert {:error, _message} = Adapter.parse("")
      assert {:error, _message} = Adapter.parse(123)
      assert {:error, _message} = Adapter.parse(%{})
    end
  end

  describe "send/4" do
    test "sends the message using the API" do
      bypass = Bypass.open(port: 8587)

      Bypass.expect_once bypass, "POST", "/v2.6/me/messages", fn conn ->
        Plug.Conn.resp(conn, 200, "{}")
      end

      assert :ok = Adapter.send("123456", "testing", %{}, [])
    end
  end

  defp facebook_webhook_response do
    """
    {"object":"page","entry":[{"id":"181529391901584","time":1498719452828,"messaging":[{"sender":{"id":"1230262267102156"},"recipient":{"id":"181529391901584"},"timestamp":1498719451536,"message":{"mid":"mid.$cAAClGbaIonRjI-lBkFc8qP4lPJPp","seq":47708,"text":"Testing"}}]}]}
    """
  end


end