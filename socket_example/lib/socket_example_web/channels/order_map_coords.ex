defmodule SocketExampleWeb.OrderMapCoords do
  use SocketExampleWeb, :channel

  def join("order_map_coords:lobby", _payload, socket) do
    {:ok, socket}
  end

  def handle_in("update", payload, socket) do
    broadcast socket, "update", payload
    {:noreply, socket}
  end
end
