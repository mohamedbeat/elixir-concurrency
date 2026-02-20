defmodule Message_Passing do
  def listen do
    receive do
      {:ok, "hello"} -> IO.puts(inspect({:ok, "world"}))
    end
    listen()

  end
end
