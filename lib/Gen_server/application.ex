# the OTP will use this to auto start the app and the GenServer when we run `iex -S mix`
defmodule SimpleQueue.Application do
  # Use the Application behavior
  use Application

  def start(_type, _args) do
    children = [
      # Define workers and child supervisors here
      # {MyProject.Worker, arg}
      {SimpleQueue, [1,2,3]}
    ]

    # Start the supervisor with the children
    opts = [strategy: :one_for_one, name: SimpleQueue.Supervisor]
    Supervisor.start_link(children, opts)
    # There are currently three different supervision strategies available to supervisors:
    # :one_for_one - Only restart the failed child process.
    # :one_for_all - Restart all child processes in the event of a failure.
    # :rest_for_one - Restart the failed process and any process started after it.


  end
end
