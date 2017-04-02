module MongoRepository
  class List < Base
    def collection
      client['lists']
    end
  end
end
