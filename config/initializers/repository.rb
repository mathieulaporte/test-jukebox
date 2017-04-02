Mongo::Logger.logger.level = ::Logger::FATAL
MongoRepository::Base.client = Mongo::Client.new(
  [ '127.0.0.1:27017' ],
  database: 'jukebox_tests_development'
)
