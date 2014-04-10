require 'spec_helper'

describe CocoaPodCategoriesDump do
  let('categories') { double('categories') }
  subject(:dump) { described_class.new(categories) }
  before do
    a = CocoaPod.create name: 'example-pod',
                        summary: 'This is the example.'
    b = CocoaPod.create name: 'another-pod',
                        summary: 'This is another one.'
    CocoaPod.create name: 'another-other-pod'
    a.build_cocoa_pod_category name: 'example-category'
    a.save
    b.build_cocoa_pod_category name: 'other-category'
    b.save
  end

  its(:build_data) do
    should == [{:name => "example-pod", :category=>"example-category", :comment=>"This is the example."},
               {:name => "another-pod", :category=>"other-category", :comment=>"This is another one."},
               {:name => "another-other-pod", :category=>"", :comment=>""}]
  end

  it 'dumps file with comments' do
    path = root_path('tmp', 'rspec-CocoaPodCategoriesDump.json')
    subject.dump(path)
    content = File.read(path)
    content.should include('This is the example.')
    content.should include('This is another one.')
    JSON.parse(content).should == {
      "example-pod" => "example-category",
      "another-pod" => "other-category",
      "another-other-pod" => ""
    }
  end
end
