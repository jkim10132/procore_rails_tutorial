class CreateItemHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :item_histories do |t|
      t.string :name
      t.integer :times_modified

      t.timestamps
    end
  end
end
