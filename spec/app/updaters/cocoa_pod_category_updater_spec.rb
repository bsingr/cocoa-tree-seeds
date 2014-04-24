require 'spec_helper'

describe CocoaPodCategoryUpdater do
  let('categories_import') { double('categories_import') }
  subject(:updater) { described_class.new(categories_import) }
  let('cocoa_pod') do
    CocoaPod.new source_url: 'https://github.com/bsingr/cocoa-tree.git',
                 name: 'cocoa-tree'
  end
  
  it 'updates category' do
    categories_import.stub('[]').with('cocoa-tree').and_return('stuff')
    subject.update cocoa_pod
    cocoa_pod.cocoa_pod_category.name.should == 'stuff'
  end

  it 'wont update category for nil' do
    categories_import.stub('[]').with('cocoa-tree').and_return(nil)
    subject.update cocoa_pod
    cocoa_pod.cocoa_pod_category.should == nil
  end

  it 'wont update category for empty string' do
    categories_import.stub('[]').with('cocoa-tree').and_return('')
    subject.update cocoa_pod
    cocoa_pod.cocoa_pod_category.should == nil
  end
end
