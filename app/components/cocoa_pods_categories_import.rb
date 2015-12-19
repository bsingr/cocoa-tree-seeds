class CocoaPodsCategoriesImport
  URL = 'https://github.com/cocoa-tree/branches/raw/master/cocoa_pods_categories.json'

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
      res = HTTP.get(URL, follow: true)
      JSON.parse(res.body)
    end
  end
end
