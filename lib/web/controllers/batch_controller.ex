defmodule BorsNG.BatchController do
  @moduledoc """
  The controller for the batches

  This will either show a batch detail page
  """

  use BorsNG.Web, :controller

  alias BorsNG.Database.Batch
  alias BorsNG.Database.Repo
  alias BorsNG.Database.Patch
  alias BorsNG.Database.Project
  alias BorsNG.Database.Status

  def show(conn, %{"id" => id}) do
    batch = Repo.get(Batch, id)
    project = Repo.get(Project, batch.project_id)

    patches = Repo.all(Patch.all_for_batch(batch.id))
    statuses = Repo.all(Status.all_for_batch(batch.id))

    render(conn, "show.html", batch: batch, patches: patches, project: project, statuses: statuses)
  end
end
