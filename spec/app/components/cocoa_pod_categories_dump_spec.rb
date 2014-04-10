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
    should == [{:name => "another-other-pod",
                :category=>"",
                :comment=>""},
               {:name => "another-pod",
                :category=>"other-category",
                :comment=>"This is another one."},
               {:name => "example-pod",
                :category=>"example-category",
                :comment=>"This is the example."}]
  end

  it 'dumps file with comments' do
    content = subject.json
    content.should include('This is the example.')
    content.should include('This is another one.')
    content.should == \
%q{{
  "another-other-pod": "", // 
  "another-pod": "other-category", // This is another one.
  "example-pod": "example-category" // This is the example.
}
}
    JSON.parse(content).should be_kind_of(Hash)
  end
end
