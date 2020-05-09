class CreateTenants < ActiveRecord::Migration[6.0]
  def change
    create_table :tenants do |t|
      t.string :name
      t.jsonb :lets_encrypt

      t.timestamps
    end
  end
end
