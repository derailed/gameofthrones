defmodule SvcWeb.UserSocket do
  use Phoenix.Socket

  ## Channels
  channel "kingdoms", SvcWeb.CastleChannel

  ## Transports
  # transport :websocket, Phoenix.Transports.WebSocket
  transport :websocket, Phoenix.Transports.WebSocket, check_origin: false
  # transport :longpoll, Phoenix.Transports.LongPoll

  def connect(%{"subject" => castle, "body" => minion}, socket) do
    IO.puts("!!!! Custom connect")
    IO.puts("NG URL")
    IO.puts(Application.get_env(:gotsvc, :web_url))

    # socket.check_origin([Application.get_env(:gotsvc, :web_url)])
    sock = socket
        |> assign(:castle, castle)
        |> assign(:minion, minion)
    {:ok, sock}
  end

  def connect(%{"castle" => castle, "minion" => minion}, socket) do
    IO.puts("!!!! REG Connect")
    IO.puts("NG URL")
    IO.puts(Application.get_env(:gotsvc, :web_url))

    # socket.check_origin([Application.get_env(:gotsvc, :web_url)])
    sock = socket
        |> assign(:castle, castle)
        |> assign(:minion, minion)
    {:ok, sock}
  end

  # Socket params are passed from the client and can
  # be used to verify and authenticate a user. After
  # verification, you can put default assigns into
  # the socket that will be set for all channels, ie
  #
  #     {:ok, assign(socket, :user_id, verified_user_id)}
  #
  # To deny connection, return `:error`.
  #
  # See `Phoenix.Token` documentation for examples in
  # performing token verification on connect.
  def connect(_params, socket) do
    {:ok, socket}
  end

  # Socket id's are topics that allow you to identify all sockets for a given user:
  #
  #     def id(socket), do: "user_socket:#{socket.assigns.user_id}"
  #
  # Would allow you to broadcast a "disconnect" event and terminate
  # all active sockets and channels for a given user:
  #
  #     SvcWeb.Endpoint.broadcast("user_socket:#{user.id}", "disconnect", %{})
  #
  # Returning `nil` makes this socket anonymous.
  def id(_socket), do: nil
end
