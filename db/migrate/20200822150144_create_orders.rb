class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.jsonb :request_info
      t.references :address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
