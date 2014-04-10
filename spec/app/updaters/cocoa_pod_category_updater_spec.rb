require 'spec_helper'

describe CocoaPodCategoryUpdater do
  let('categories') { double('categories') }
  subject(:updater) { described_class.new(categories) }
  let('cocoa_pod') do
    CocoaPod.new source_url: 'https://github.com/dpree/cocoa-tree.git',
                 name: 'cocoa-tree'
  end
  
  it 'calls CocoaPodCategories' do
    categories.stub('[]').with('cocoa-tree').and_return('stuff')
    subject.update cocoa_pod
    cocoa_pod.cocoa_pod_category.name.should == 'stuff'
  end
end
