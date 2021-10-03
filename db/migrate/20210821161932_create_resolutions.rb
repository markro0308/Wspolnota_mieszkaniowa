class CreateResolutions < ActiveRecord::Migration[6.1]
  def change
    create_table :resolutions do |t|
      t.string :titleR
      t.text :contentR

      t.timestamps
    end
  end
end
