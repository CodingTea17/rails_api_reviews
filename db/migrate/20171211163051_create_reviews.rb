class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.text :content
      t.string :author
      t.string :destination

      t.timestamps
    end
  end
end
