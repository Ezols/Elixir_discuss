defmodule Discuss.TopicController do
    use Discuss.Web, :controller

    alias Discuss.Topic

    def new(conn, _params) do
        changeset = Topic.changeset(%Topic{}, %{})
        
        # show the form
        render conn, "new.html", changeset: changeset
            
    end

    def create(conn, %{"topic" => topic}) do
        changeset = Topic.changeset(%Topic{}, topic)

        case Repo.insert(changeset) do
            # Record added, will return atom :ok and post
            {:ok, post} -> IO.inspect(post)
            # Record faild to add, will return atom :error and changeset
            {:error, changeset} -> 
                render conn, "new.html", changeset: changeset
        end
    end
end