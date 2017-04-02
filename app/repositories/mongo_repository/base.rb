module MongoRepository
  class Base
    class << self
      attr_accessor :client
    end

    def client
      Base.client
    end

    def collection
      raise 'AbstractMethod'
    end
  end
end
