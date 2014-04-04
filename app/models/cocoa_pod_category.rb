class CocoaPodCategory < ActiveRecord::Base
  has_many :cocoa_pods
  
  validates_uniqueness_of :name
  validates_presence_of :name
end
