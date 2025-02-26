defmodule NumberHelper do
  def float_to_string(float) when is_float(float) do
    :erlang.float_to_binary(float, decimals: 2) |> IO.puts()
  end
end

IO.puts(NumberHelper.float_to_string(2.13213))

defmodule OSHelper do
  def get_env_variables(variable_name) do
    System.get_env(variable_name) |> IO.puts()
  end

  def get_file_extension(file_name) do
    Path.extname(file_name) |> IO.puts()
  end

  def get_cwd do
    {:ok, cwd} = File.cwd()
    cwd
  end
end

IO.puts(OSHelper.get_env_variables("HOME"))
IO.puts(OSHelper.get_file_extension("bitchy/bitchy.bitchs"))
IO.puts(OSHelper.get_cwd())
