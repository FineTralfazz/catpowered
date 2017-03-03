class CreateCats < ActiveRecord::Migration[5.0]
  def change
    create_table :cats do |t|
      t.string :name
      t.string :color
      t.string :status

      t.timestamps
    end
  end
end
