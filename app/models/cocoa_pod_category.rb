class CocoaPodCategory
  include Persistence
  include ::ActiveModel::Model
  include ::ActiveModel::Serialization

  attr_accessor :name,
                :cocoa_pods

  validates_presence_of :name

  def cocoa_pods
    @cocoa_pods || []
  end

  def serializable_hash context=nil
    {
      'name' => name,
      'cocoa_pods' => cocoa_pods
    }
  end

  def self.collection_name
    :categories
  end
end
