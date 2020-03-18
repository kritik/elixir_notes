# iex(4)> ping = spawn(PingPong, :loop, [{0, :ping}])
# iex(5)> pong = spawn(PingPong, :loop, [{0, :pong}])
# iex(6)> Process.alive?(ping)
# iex(7)> Process.alive?(pong)
# iex(8)> send(ping, {:ball, pong})
# send(ping, {:stop})
# Process.alive?(ping
# Process.register(pong, :pong)
# send(ping, {:ball, :pong})
defmodule PingPong do
  def loop({num_iterations, name}) do
    IO.puts("#{num_iterations} - #{name}")
    receive do
      {:ball, from} -> pass_ball(from); loop({num_iterations+1, name})
      {:stop} -> stop()
    end
  end

  defp pass_ball(from) do
    :timer.sleep(2000)
    send(from, {:ball, self()})
  end

  defp stop do
    :ok
  end
end
