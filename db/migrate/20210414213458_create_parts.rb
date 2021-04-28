class CreateParts < ActiveRecord::Migration[6.0]
  def change
    create_table :parts do |t|
      t.string :brand_name
      t.string :part_name
      t.integer :user_id
    end
  end
end
