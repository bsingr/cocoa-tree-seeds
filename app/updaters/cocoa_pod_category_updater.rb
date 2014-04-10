class CocoaPodCategoryUpdater
  def update cocoa_pod
    if category_name = categories[cocoa_pod.name]
      category = cocoa_pod.cocoa_pod_category
      if !category || category.name != category_name
        Rails.logger.info "Assigning category #{category_name} to #{cocoa_pod.name}"
        new_category = CocoaPodCategory.find_or_create_by_name(category_name)
        cocoa_pod.cocoa_pod_category = new_category
        cocoa_pod.save
      end
    end
  end

  def categories
    @categories ||= CocoaPodCategories.new
  end
end
