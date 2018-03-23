class CreatePlugins < ActiveRecord::Migration[5.1]
  def change
    create_table :plugins do |t|
      t.string :name, null: false,  index: { unique: true }
      t.string :appid, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
