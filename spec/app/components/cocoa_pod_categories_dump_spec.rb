require 'spec_helper'

describe CocoaPodCategoriesDump do
  let('categories') { double('categories') }
  subject(:dump) { described_class.new(categories) }
  before do
    CocoaPod.create name: 'example-pod',
                    summary: 'This is the example.'
    CocoaPod.create name: 'another-pod',
                    summary: 'This is another one.'
    CocoaPod.create name: 'another-other-pod'
  end

  its(:build_data) do
    should == [{:name => "example-pod", :category=>"", :comment=>"This is the example."},
               {:name => "another-pod", :category=>"", :comment=>"This is another one."},
               {:name => "another-other-pod", :category=>"", :comment=>""}]
  end

  it 'dumps file' do
    path = root_path('tmp', 'rspec-CocoaPodCategoriesDump.json')
    subject.dump(path)
    JSON.load(path).should == {}
  end
end
