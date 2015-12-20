class UpdateCocoaPodCategoryJob
  def run
    updater = CocoaPodCategoryUpdater.new
    CocoaPod.all.each do |k, cocoa_pod|
      updater.update cocoa_pod
    end
  end
end
