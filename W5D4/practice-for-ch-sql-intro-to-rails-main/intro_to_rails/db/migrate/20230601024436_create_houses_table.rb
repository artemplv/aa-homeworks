class CreateHousesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :houses do |t|
      t.text :address, presence: true

      t.timestamps
    end
  end
end
