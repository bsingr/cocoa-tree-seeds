class CocoaPodCategoriesDump
  attr_reader :categories

  def initialize categories=CocoaPodCategories.new
    @categories = categories
  end

  def build_data
    data = []
    CocoaPod.find_each do |cocoa_pod|
      data << {
        name: cocoa_pod.name,
        category: cocoa_pod.try(:cocoa_pod_category).try(:name) || '',
        comment: cocoa_pod.summary || ''
      }
    end
    data
  end

  def dump path
    File.open(path, 'w') do |f|
      f.puts '{'
      data = build_data
      data.each_with_index do |value, index|
        sep = index < data.length-1 ? ',' : ''
        f.puts "  \"#{value[:name]}\": \"#{value[:category]}\"#{sep} // #{value[:comment]}"
      end
      f.puts '}'
    end
  end
end
