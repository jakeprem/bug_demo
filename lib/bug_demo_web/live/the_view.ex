defmodule BugDemoWeb.TheView do
  use Phoenix.LiveView
  alias BugDemoWeb.Router.Helpers, as: Routes

  def render(assigns) do
    ~L"""
    <form phx-change="search" phx-submit="search">
      <input
        name="search-value"
        phx-debounce="250"
        type="text"
        value="<%= @search_text %>"
        placeholder="Search things"
      >
    </form>
    <hr>
    <h1><%= @search_text %></h1>
    """
  end

  def mount(_session, socket) do
    {:ok, socket}
  end

  def handle_params(params, _uri, socket) do
    search_text = Map.get(params, "search-value", "")

    {:noreply, assign(socket, search_text: search_text)}
  end

  def handle_event("search", %{"search-value" => value}, socket) do
    {:noreply,
     live_redirect(socket, to: Routes.live_path(socket, __MODULE__, %{"search-value": value}))}
  end
end
