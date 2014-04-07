class CocoaPodCategories
  URL = 'https://github.com/cocoa-tree/branches/raw/branches/cocoa_pods_categories.json'

  def [] key
    if data.has_key?(key)
      data[key]
    else
      nil
    end
  end

private

  def data
    @data ||= begin
      response = HTTParty.get(URL)
      JSON.parse(response.body)
    end
  end
end
