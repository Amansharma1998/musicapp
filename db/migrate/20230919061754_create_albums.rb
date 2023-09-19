class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.string :title
      t.references :artistid, null: false, foreign_key: true
      t.date :release_date

      t.timestamps
    end
  end
end
