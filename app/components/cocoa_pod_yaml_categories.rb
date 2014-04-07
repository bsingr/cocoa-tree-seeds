class CocoaPodYAMLCategories
  attr_accessor :source_path

  def [] key
    data[key]
  end

private

  def data
    @data ||= YAML.load_file source_path
  end
end
