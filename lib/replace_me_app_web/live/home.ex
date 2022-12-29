defmodule ReplaceMeAppWeb.Home do
  use ReplaceMeAppWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <.page_title title="Home" />
    <.body>Some content</.body>
    """
  end
end
