defmodule Test do
  def f(n, l) do
    Stream.concat Stream.map 0..n, &List.duplicate(&1, l)
  end
end

IO.puts Enum.count Test.f(10000, 10000)
