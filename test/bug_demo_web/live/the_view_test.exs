defmodule BugDemoWeb.TheViewTest do
  use BugDemoWeb.ConnCase
  use Phoenix.ConnTest
  import Phoenix.LiveViewTest

  @url_path "/stuff"

  test "This test fails", %{conn: conn} do
    search_value = "SOMETHING"

    assert {:ok, view, html} = live(conn, @url_path <> "?search-value=" <> search_value)

    assert search_value ==
             html
             |> Floki.find("input")
             |> Floki.attribute("value")
             |> List.first()

    assert search_value ==
             html
             |> Floki.find("h1")
             |> Floki.text()
  end

  test "This test passes", %{conn: conn} do
    search_value = "SOMETHING"

    conn = get(conn, @url_path)

    assert {:ok, view, html} = live(conn, @url_path <> "?search-value=" <> search_value)

    assert search_value ==
             html
             |> Floki.find("input")
             |> Floki.attribute("value")
             |> List.first()

    assert search_value ==
             html
             |> Floki.find("h1")
             |> Floki.text()
  end

  test "Live redirect also passes", %{conn: conn} do
    {:ok, view, _html} = live(conn, @url_path)

    search_text = "Some search"

    assert_redirect(view, @url_path <> "?search-value=" <> search_text, fn ->
      assert search_text ==
               view
               |> render_change(:search, %{"search-value" => search_text})
               |> Floki.find("input")
               |> Floki.attribute("value")
               |> List.first()
    end)
  end
end
