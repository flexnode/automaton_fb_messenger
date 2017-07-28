defmodule Automaton.FacebookMessenger.APITest do
  use ExUnit.Case
  alias Automaton.FacebookMessenger.API

  setup do
    bypass = Bypass.open(port: 8587)
    {:ok, bypass: bypass}
  end

  describe "post_message/3" do

    test "successfully post message to FB Messenger API", %{bypass: bypass} do
      Bypass.expect_once bypass, "POST", "/v2.6/me/messages", fn conn ->
        Plug.Conn.resp(conn, 200, "{}")
      end

      assert :ok = API.post_message("12355", "testing", [])
    end

    test "returns error if posting fails", %{bypass: bypass} do
      Bypass.expect_once bypass, "POST", "/v2.6/me/messages", fn conn ->
        Plug.Conn.resp(conn, 400, "{\"error\": \"\"}")
      end

      assert {:error, _} = API.post_message("12355", "testing", [])
    end

  end


end