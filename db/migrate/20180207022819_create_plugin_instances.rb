class CreatePluginInstances < ActiveRecord::Migration[5.1]
  def change
    create_table :plugin_instances do |t|
      t.string :version
      t.string :path
      t.boolean :published
      t.references :plugin, foreign_key: true
      t.string :description
      t.timestamps
    end
  end
end
