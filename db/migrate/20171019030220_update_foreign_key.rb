class UpdateForeignKey < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :job_id

    add_reference :comments, :job, index: true, foreign_key: true, on_delet:w
    e: :cascade
  end
end
