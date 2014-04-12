class CocoaPodCategoryUpdater
  attr_reader :categories_import

  def initialize categories_import=CocoaPodsCategoriesImport.new
    @categories_import = categories_import
  end

  def update cocoa_pod
    category_name = categories_import[cocoa_pod.name]
    if category_name.present?
      category = cocoa_pod.cocoa_pod_category
      if !category || category.name != category_name
        Rails.logger.info "Assigning category #{category_name} to #{cocoa_pod.name}"
        new_category = CocoaPodCategory.find_or_create_by_name(category_name)
        cocoa_pod.cocoa_pod_category = new_category
        cocoa_pod.save
      end
    end
  end
end
