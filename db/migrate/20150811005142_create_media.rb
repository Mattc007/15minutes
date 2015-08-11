class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.integer :format_type_id, default: 1
      t.string :external_id
      t.integer :length_in_seconds
      t.string :name
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
