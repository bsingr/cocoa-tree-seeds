class AddCocoaPodCategoryToCocoaPod < ActiveRecord::Migration
  def change
    add_column :cocoa_pods, :cocoa_pod_category_id, :reference
  end
end
