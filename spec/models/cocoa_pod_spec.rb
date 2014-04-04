require 'spec_helper'

describe CocoaPod do
  it { should have_many(:cocoa_pod_dependencies) }
  it { should have_many(:dependent_cocoa_pods) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:name) }
end
