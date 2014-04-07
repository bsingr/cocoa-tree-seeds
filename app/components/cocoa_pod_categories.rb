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
      c = Curl::Easy.new(URL)
      c.follow_location = true
      c.ssl_verify_peer = false
      c.perform
      JSON.parse(c.body_str)
    end
  end
end
