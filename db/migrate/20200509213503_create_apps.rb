class CreateApps < ActiveRecord::Migration[6.0]
  def change
    create_table :apps, id: :uuid do |t|
      t.belongs_to :tenant, null: false, type: :uuid, foreign_key: true, index: true
      t.jsonb :data

      t.timestamps
    end
  end
end
