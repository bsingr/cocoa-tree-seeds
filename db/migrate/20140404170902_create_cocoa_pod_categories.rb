class CreateCocoaPodCategories < ActiveRecord::Migration
  def change
    create_table :cocoa_pod_categories do |t|
      t.string :name
      t.timestamps
    end
  end
end
