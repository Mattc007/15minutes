class CreateQueueItems < ActiveRecord::Migration
  def change
    create_table :queue_items do |t|
      t.belongs_to :medium, index: true
      t.string :queue_slot

      t.timestamps null: false
    end
  end
end
