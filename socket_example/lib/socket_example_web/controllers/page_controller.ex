defmodule SocketExampleWeb.PageController do
  use SocketExampleWeb, :controller

  def index(conn, _params) do
    text(conn, "message sent")
  end
end
