defmodule CebuAmRadioDb.UserManager.User do
  use Ecto.Schema
  use CebuAmRadioDb.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :type, :string, default: "basic"
    field :status, :boolean, default: true
    field :username, :string
    field :password, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :password, :name, :type, :status])
    |> validate_required([:username, :password, :name, :type, :status])
    |> put_password_hash()
  end

  @doc false
  def login_changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :password])
    |> validate_required([:username, :password])
  end

  defp put_password_hash(
         %Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset
       ) do
    change(changeset, password: Argon2.hash_pwd_salt(password))
  end

  defp put_password_hash(changeset), do: changeset
end
