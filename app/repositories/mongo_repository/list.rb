module MongoRepository
  class List < Base
    self.model = ::List
    def collection
      client['lists']
    end
  end
end
