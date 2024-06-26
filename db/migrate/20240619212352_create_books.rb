class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :body
      t.timestamps
      add_column :books, :book_id, :integer
    end
  end
end
