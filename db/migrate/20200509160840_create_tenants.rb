class CreateTenants < ActiveRecord::Migration[6.0]
  def change
    create_table :tenants, id: :uuid do |t|
      t.jsonb :data
      t.timestamps
    end
  end
end
