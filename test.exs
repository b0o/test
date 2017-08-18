defmodule Test do
	def f(n, l) do
		Enum.concat(
			Enum.map(0..n, fn(i) ->
				List.duplicate(i, l)
			end)
		)
	end
end

IO.puts(length(Test.f(10000, 10000)))

