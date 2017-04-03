case Rails.env
when 'development'
  Repository.register(:candidate, MongoRepository::Candidate.new)
  Repository.register(:list, MongoRepository::List.new)
end
