require 'active_support/concern'

module Persistence
  extend ActiveSupport::Concern

  def save!
    if collection_name = self.class.collection_name
      DB.transaction do
        DB[collection_name] ||= {}
        DB[collection_name][name] = serializable_hash
      end
    end
  end

  included do
    def self.collection_name
      nil
    end

    def self.all
      if collection_name = self.collection_name
        DB.transaction do
          DB[collection_name] ||= {}
          h = DB[collection_name]
          h.each { |k,v| h[k] = new(v) }
          return h
        end
      else
        {}
      end
    end

    def self.find name
      if collection_name = self.collection_name
        DB.transaction do
          DB[collection_name] ||= {}
          if found = DB[collection_name][name]
            return new(found)
          end
        end
      end
    end

    def self.create attributes
      self.new(attributes).save!
    end

    def self.delete_all
      if collection_name = self.collection_name
        DB.transaction do
          DB[collection_name] = {}
        end
      end
    end
  end
end
