class CocoaPodsCategoriesExport
  attr_reader :categories

  def initialize categories=CocoaPodCategories.new
    @categories = categories
  end

  def build_data
    data = []
    CocoaPod.order('name ASC').each do |cocoa_pod|
      data << {
        name: cocoa_pod.name,
        category: cocoa_pod.cocoa_pod_category.try(:name) || '',
        comment: cocoa_pod.try(:summary).try(:gsub, "\n", " ") || ''
      }
    end
    data
  end

  def json
    str = ''
    str << "{\n"
    data = build_data
    data.each_with_index do |value, index|
      sep = index < data.length-1 ? ',' : ''
      str << "  \"#{value[:name]}\": \"#{value[:category]}\"#{sep} // #{value[:comment]}\n"
    end
    str << "}\n"
    str
  end
end
