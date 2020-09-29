defmodule SocketExample.SendCoord do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, %{})
  end

  def init(state) do
    SocketExampleWeb.Endpoint.broadcast!("order_map_coords:lobby", "update", %{eae: "eae"})
    schedule_work()
    {:ok, state}
  end

  def handle_info(:work, state) do
    colors = ["red", "blue", "green", "pink", "orange"]
    number_of_orders = Enum.random(1..5)
    orders = List.duplicate("order", number_of_orders)
    orders = orders |> Enum.with_index |> Enum.map(fn {_, i} -> %{color: colors |> Enum.at(i), pos_x: Enum.random(0..700), pos_y: Enum.random(0..200)}  end)
    SocketExampleWeb.Endpoint.broadcast!("order_map_coords:lobby", "update", %{data: orders})
    schedule_work()
    {:noreply, state}
  end

  defp schedule_work() do
    Process.send_after(self(), :work, Enum.random(4..10) * 1000) # 4 to 10 seconds
  end
end
