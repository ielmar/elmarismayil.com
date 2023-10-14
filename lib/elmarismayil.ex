defmodule Elmarismayil do
  alias Elmarismayil.Blog
  use Phoenix.Component
  import Phoenix.HTML

  def post(assigns) do
    ~H"""
    <.layout>
      <%= raw @post.body %>
    </.layout>
    """
  end

  def index(assigns) do
    ~H"""
    <.layout>
      <h1>Elmar Ismayil's personal website</h1>
      <h2>Posts</h2>
      <ul>
        <li :for={post <- @posts}>
          <a href={post.path}> <%= post.title %> </a>
        </li>
      </ul>
    </.layout>
    """
  end

  def about(assigns) do
    ~H"""
    <.layout>
      <h1>About me</h1>
      <p>I am a full stack developer with more than 20 years of experience.</p>
    </.layout>
    """
      end

      def header(assigns) do
        ~H"""
        <nav class="bg-white">
          <div class="px-4 mx-auto max-w-7xl sm:px-6 lg:px-8">
          header
          </div>
        </nav>
        """
      end

  def layout(assigns) do
    ~H"""
    <html>
      <head>
        <link rel="stylesheet" href="/assets/app.css" />
        <script type="text/javascript" src="/assets/app.js" />
      </head>
    <body>
    <div class="min-h-full">
    <.header>
    </.header>
    <%= render_slot(@inner_block) %>
    </div>
      </body>
    </html>
    """
  end

  @output_dir "./output"
  File.mkdir_p!(@output_dir)

  def build() do
    posts = Blog.all_posts()

    render_file("index.html", index(%{posts: posts}))
    render_file("about.html", about(%{}))

    for post <- posts do
      dir = Path.dirname(post.path)
      if dir != "." do
        File.mkdir_p!(Path.join([@output_dir, dir]))
      end
      render_file(post.path, post(%{post: post}))
    end

    :ok
  end

  def render_file(path, rendered) do
    safe = Phoenix.HTML.Safe.to_iodata(rendered)
    output = Path.join([@output_dir, path])
    File.write!(output, safe)
  end
end
