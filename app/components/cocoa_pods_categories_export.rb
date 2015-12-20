class CocoaPodsCategoriesExport
  def build_data
    data = []
    CocoaPod.all.sort.each do |k, cocoa_pod|
      data << {
        name: cocoa_pod.name,
        category: cocoa_pod.category_name,
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
