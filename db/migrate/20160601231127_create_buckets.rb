class CreateBuckets < ActiveRecord::Migration
  def change
    create_table :buckets do |t|
      t.string :title
      t.string :description
      t.boolean :completed
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
