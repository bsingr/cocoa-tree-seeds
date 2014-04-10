class CocoaPodCategoriesDump
  attr_reader :categories

  def initialize categories=CocoaPodCategories.new
    @categories = categories
  end

  def build_data
    data = {}
    CocoaPod.find_each do |cocoa_pod|
      data[cocoa_pod.name] = {
        category: cocoa_pod.try(:cocoa_pod_category).try(:name) || '',
        comment: cocoa_pod.summary || ''
      }
    end
    data
  end
end
