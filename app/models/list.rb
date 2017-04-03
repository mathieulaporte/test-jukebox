class List
  include Virtus.model
  attribute :_id,           BSON::ObjectId
  attribute :title,         String
  attribute :candidate_ids, Array[BSON::ObjectId] # this field is ordered
  alias_method :id, :_id
end
