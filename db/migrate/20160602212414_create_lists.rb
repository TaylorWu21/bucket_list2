class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title, null: false
      t.attachment :image
      t.string :description
      t.boolean :completed
      t.belongs_to :bucket, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
