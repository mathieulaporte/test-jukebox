class Candidate
  include Virtus.model
  attribute :_id, BSON::ObjectId
  attribute :name, String
end
