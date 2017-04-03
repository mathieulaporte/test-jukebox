class Repository
  @map = {}
  def self.for(type)
    @map[type]
  end

  def self.register(type, repository)
    @map[type] = repository
  end
end

case Rails.env
when 'development'
  Mongo::Logger.logger.level = ::Logger::FATAL
  MongoRepository::Base.client = Mongo::Client.new(
    ['127.0.0.1:27017'],
    database: 'jukebox_tests_development'
  )
  Repository.register(:candidate, MongoRepository::Candidate.new)
  Repository.register(:list, MongoRepository::List.new)
when 'test'
  Mongo::Logger.logger.level = ::Logger::FATAL
  MongoRepository::Base.client = Mongo::Client.new(
    ['127.0.0.1:27017'],
    database: 'jukebox_tests_test'
  )
  Repository.register(:candidate, MongoRepository::Candidate.new)
  Repository.register(:list, MongoRepository::List.new)
end
