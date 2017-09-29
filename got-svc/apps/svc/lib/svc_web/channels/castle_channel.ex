defmodule SvcWeb.CastleChannel do
    use SvcWeb, :channel

    alias SvcWeb.Presence

    def join("kingdoms", params, socket) do
        send self(), :after_join

        if Map.has_key?(params, "subject") do
            s = socket
            |> assign(:castle, params["subject"])
            |> assign(:minion, params["body"])
            {:ok, s}
        else
            {:ok, socket}
        end
    end

    def handle_in(event, params, socket) do
        broadcast! socket, event, %{
            from: params["from"],
            text: params["body"],
            time: params["at"]
        }
        {:reply, :ok, socket}
    end

    def handle_info(:after_join, socket) do
        Presence.track(socket, socket.assigns.minion, %{
            device: "browser",
            castle: socket.assigns.castle,
            online_at: inspect(:os.timestamp())
        })
        push socket, "presence_state", Presence.list(socket)
        {:noreply, socket}
    end
end