class UpdateCocoaPodCategoryJob
  def run
    updater = CocoaPodCategoryUpdater.new
    CocoaPod.all.find_each do |cocoa_pod|
      updater.update cocoa_pod
    end
  end
end
