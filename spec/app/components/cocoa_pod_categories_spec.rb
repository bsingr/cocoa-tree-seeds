require 'spec_helper'

describe CocoaPodCategories do
  it 'returns nil for undefined cocoa pod' do
    subject['foo'].should == nil
  end

  it 'returns category name' do
    subject['500px-iOS-api'].should == 'proprietary_api'
  end
end
