class CreateStaticfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :staticfiles do |t|
      t.string :filename
      t.text :content
      t.integer :filesize

      t.timestamps
    end
  end
end
