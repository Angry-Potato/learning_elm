defmodule LearningElm.Seat do
  use LearningElm.Web, :model

  schema "seats" do
    field :seat_no, :integer
    field :occupied, :boolean, default: false

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:seat_no, :occupied])
    |> validate_required([:seat_no, :occupied])
  end

  defimpl Poison.Encoder, for: LearningElm.Seat do
    def encode(model, opts) do
      %{id: model.id,
        seatNo: model.seat_no,
        occupied: model.occupied} |> Poison.Encoder.encode(opts)
    end
  end
end
