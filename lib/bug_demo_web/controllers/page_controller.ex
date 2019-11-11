defmodule BugDemoWeb.PageController do
  use BugDemoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
