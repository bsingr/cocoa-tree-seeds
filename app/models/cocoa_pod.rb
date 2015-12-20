class CocoaPod
  include Persistence
  include ::ActiveModel::Model
  include ::ActiveModel::Serialization

  validates_presence_of :name

  attr_accessor :name,
                :category_name,
                :stars,
                :pushed_at,
                :website_url,
                :source_url,
                :doc_url,
                :version,
                :summary,
                :dependencies,
                :dependents

  def cocoa_pod_category
    CocoaPodCategory.find(category_name)
  end

  def stars
    @stars || 0
  end

  def dependents
    @dependents || []
  end

  def dependencies
    @dependencies || []
  end

  def category_name
    @category_name || 'uncategorized'
  end

  def serializable_hash context=nil
    {
      'name' => name,
      'stars' => stars,
      'pushed_at' => pushed_at.try(:iso8601).to_s,
      'website_url' => website_url,
      'source_url' => source_url,
      'doc_url' => doc_url,
      'version' => version,
      'summary' => summary || "",
      'category_name' => category_name,
      'dependencies' => dependencies.map{|d| {'name' => d.name,
                                              'requirement' => d.requirement }},
      'dependents' => dependents.map{|d| {'name' => d.name,
                                          'requirement' => d.requirement }}
    }
  end

  def self.collection_name
    :pods
  end

  def self.delete_all_dependencies
    h = DB[collection_name] || {}
    h.each do |k,v|
      v.dependencies = []
      v.dependents = []
      h[v.name] = v.serializable_hash
    end
    DB.transaction do
      DB[collection_name] ||= {}
      DB[collection_name]
    end
  end
end
