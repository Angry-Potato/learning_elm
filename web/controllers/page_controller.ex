defmodule LearningElm.PageController do
  use LearningElm.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
