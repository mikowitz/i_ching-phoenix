ExUnit.start

Mix.Task.run "ecto.create", ~w(-r IChing.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r IChing.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(IChing.Repo)

