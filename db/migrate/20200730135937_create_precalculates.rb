class CreatePrecalculates < ActiveRecord::Migration[6.0]
  def change
    create_table :precalculates do |t|
      t.string :full_name
      t.integer :revenue
      t.integer :type_list

      t.timestamps
    end
  end
end
