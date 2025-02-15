class LinkUsersAndTasks < ActiveRecord::Migration[8.0]
  def change
    add_column :tasks, :author_id, :bigint, null: false
    add_column :tasks, :assignee_id, :bigint, null: true

    add_foreign_key :tasks, :users, column: :author_id
    add_foreign_key :tasks, :users, column: :assignee_id
  end
end
