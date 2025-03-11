defmodule Canvas do
  @defaults [fg: "black", bg: "white", font: "Merriweather"]
  # Keyword Lists - Keys are always atom, preserved order, keys can be duplicated

  def draw_text(text, options \\ []) do
    options = Keyword.merge(@defaults, options)
    IO.puts("Drawing text #{inspect(text)}")
    IO.puts("Foreground: #{options[:fg]}")
    IO.puts("Background: #{options[:bg]}")
    IO.puts("Font: #{options[:font]}")
    IO.puts("Pattern: #{Keyword.get(options, :pattern, "solid")}")
    IO.puts("Style: #{inspect(Keyword.get_values(options, :style))}")
  end
end

Canvas.draw_text("hello", fg: "red", style: "italic", style: "bold")
