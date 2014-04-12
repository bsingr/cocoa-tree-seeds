require 'spec_helper'

describe CocoaPodsCategoriesExport do
  let('categories') { double('categories') }
  subject { described_class.new(categories) }
  before do
    a = CocoaPod.create name: 'example-pod',
                        summary: 'This is the example.'
    b = CocoaPod.create name: 'another-pod',
                        summary: "This is another one.\nWith multiline summary"
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
                :comment=>"This is another one. With multiline summary"},  
               {:name => "example-pod",
                :category=>"example-category",
                :comment=>"This is the example."}]
  end

  it 'dumps file with comments' do
    content = subject.json
    content.should include('This is the example.')
    content.should include('This is another one. With multiline summary')
    content.should == \
%q{{
  "another-other-pod": "", // 
  "another-pod": "other-category", // This is another one. With multiline summary
  "example-pod": "example-category" // This is the example.
}
}
    JSON.parse(content).should be_kind_of(Hash)
  end
end
