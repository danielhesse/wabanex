defmodule Wabanex.UserTest do
  use Wabanex.DataCase, async: true

  alias Wabanex.User

  describe "changeset/1" do
    test "when all params are valid, returns the user" do
      params = %{name: "Daniel", email: "daniel@example.com", password: "123456"}

      response = User.changeset(params)

      assert %Ecto.Changeset{
               valid?: true,
               changes: %{name: "Daniel", email: "daniel@example.com", password: "123456"},
               errors: []
             } = response
    end

    test "when there ate invalid params, returns a invalid changeset" do
      params = %{name: "D", email: "daniel@example.com"}

      response = User.changeset(params)

      expected_response = %{
        name: ["should be at least 3 character(s)"],
        password: ["can't be blank"]
      }

      assert errors_on(response) == expected_response
    end
  end
end
