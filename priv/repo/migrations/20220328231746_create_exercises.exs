defmodule Wabanex.Repo.Migrations.CreateExercises do
  use Ecto.Migration

  def change do
    create table(:exercises) do
      add :training_id, references(:trainings)
      add :name, :string
      add :youtube_video_url, :string
      add :protocol_description, :string
      add :repetitions, :string

      timestamps()
    end
  end
end
