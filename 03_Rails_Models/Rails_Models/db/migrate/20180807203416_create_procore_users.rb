class CreateProcoreUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :procore_users do |t|

      t.timestamps
    end
  end
end
