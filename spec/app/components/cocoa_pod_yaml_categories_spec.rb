require 'spec_helper'

describe CocoaPodYAMLCategories do
  before do
    subject.source_path = assets_path('example_categories.yml')
  end

  it 'returns nil for undefined cocoa pod' do
    subject['foo'].should == nil
  end

  it 'returns category name' do
    subject['AAImageUtils'].should == 'image_processing'
    subject['500px-iOS-api'].should == 'proprietary_api'
  end
end
