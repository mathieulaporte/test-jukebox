module MongoRepository
  class Candidate < Base
    self.model = ::Candidate

    def collection
      client['candidates']
    end
  end
end
