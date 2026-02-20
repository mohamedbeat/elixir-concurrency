defmodule Concurrency.ProcessLinking do
  def explode do
    exit(:boom)
  end


  def run_trap_exit do
    Process.flag(:trap_exit, true)
    spawn_link(Concurrency.ProcessLinking, :explode, [])

    receive do
      {:EXIT, pid, reason} -> IO.puts("Process #{inspect(pid)} exited with reason: #{inspect(reason)}")
    end
  end

   def run_monitor do
    spawn_monitor(Concurrency.ProcessLinking, :explode, [])

    receive do
      {:DOWN, _ref, :process, _from_pid, reason} -> IO.puts("Exit reason: #{inspect(reason)}")
    end
  end

end
