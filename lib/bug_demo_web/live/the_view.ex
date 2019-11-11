defmodule BugDemoWeb.TheView do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    <h1>Basic Live View</h1>
    """
  end

  def mount(_session, socket) do
    {:ok, socket}
  end
end
