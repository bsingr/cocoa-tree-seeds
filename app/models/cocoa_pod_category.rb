class CocoaPodCategory < ActiveRecord::Base
  has_many :cocoa_pods
  
  validates_uniqueness_of :name
  validates_presence_of :name

  def serializable_hash context=nil
    {
      'name' => name,
      'cocoa_pods_count' => cocoa_pods.count
    }
  end
end
