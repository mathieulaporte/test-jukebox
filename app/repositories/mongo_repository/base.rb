module MongoRepository
  class Base
    class << self
      attr_accessor :client, :model
    end

    def client
      Base.client
    end

    def model
      self.class.model
    end

    def collection
      raise 'AbstractMethod'
    end

    def find(id)
      where(_id: id).first
    end

    def find_by_ids(ids)
      where(_id: { :$in => ids })
    end

    def count
      collection.count
    end

    def where(query = {})
      collection.find(query).map { |object| model.new(object) }
    end

    def all
      where
    end

    def first
      model.new(collection.find.limit(1).first)
    end

    def create(object)
      object_to_persist = object.as_json
      object_to_persist.delete('_id')
      response = collection.insert_one(object_to_persist)
      raise 'Fail to persist' unless response.successful?
      model.new(object_to_persist.merge(_id: response.inserted_id))
    end

    def update_many(query = {}, instructions = {})
      collection.update_many(query, instructions)
    end

    def update_one(query = {}, instructions = {})
      collection.update_one(query, instructions)
    end

    def destroy(query = {})
      collection.delete_many(query)
    end
  end
end
