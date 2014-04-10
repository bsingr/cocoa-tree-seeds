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
    should == {"example-pod"=>{:category=>"", :comment=>"This is the example."},
               "another-pod"=>{:category=>"", :comment=>"This is another one."},
               "another-other-pod"=>{:category=>"", :comment=>""}}
  end
end
