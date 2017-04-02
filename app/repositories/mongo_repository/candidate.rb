module MongoRepository
  class Candidate < Base
    def collection
      client['candidates']
    end
  end
end
