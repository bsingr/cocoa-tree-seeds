require 'spec_helper'

describe CocoaPodsCategoriesExport do
  before { CocoaPod.delete_all }
  subject { described_class.new }
  before do
    a = CocoaPod.create name: 'example-pod',
                        category_name: 'example-category',
                        summary: 'This is the example.'
    b = CocoaPod.create name: 'another-pod',
                        category_name: 'other-category',
                        summary: "This is another one.\nWith multiline summary"
    CocoaPod.create name: 'another-other-pod'
  end

  its(:build_data) do
    should == [{:name => "another-other-pod",
                :category=>"uncategorized",
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
  "another-other-pod": "uncategorized", // 
  "another-pod": "other-category", // This is another one. With multiline summary
  "example-pod": "example-category" // This is the example.
}
}
    JSON.parse(content).should be_kind_of(Hash)
  end
end
