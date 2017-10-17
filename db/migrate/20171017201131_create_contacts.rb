class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.text :name
      t.text :position
      t.text :email
      t.references :company, foreign_key: true
     
      t.timestamps
    end
  end
end
