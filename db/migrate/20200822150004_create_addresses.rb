class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :neighborhood
      t.string :street
      t.string :uf
      t.string :zip_code
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
