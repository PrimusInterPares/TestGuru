class AddGithubGistIdIntoGists < ActiveRecord::Migration[7.1]
  def up
    add_column :gists, :github_gist_id, :string, null: false
  end

  def down
    remove_column :gists, :github_gist_id
  end
end
