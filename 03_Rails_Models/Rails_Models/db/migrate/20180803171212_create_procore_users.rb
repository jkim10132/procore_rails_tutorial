class CreateProcoreUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :procore_users do |t|
      t.string :name
      t.integer :age
      t.string :email

      t.timestamps
    end
  end
end
