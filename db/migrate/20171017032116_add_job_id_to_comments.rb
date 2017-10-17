class AddJobIdToComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :jobs, index: true, foreign_key: true
  end
end
