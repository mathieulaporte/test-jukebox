class AddCandidateToList
  attr_reader :candidate, :list
  def initialize(candidate, list)
    @candidate = candidate
    @list      = list
  end

  def call
    Repository
      .for(:list)
      .update_one({ _id: list.id }, :$push => { candidate_ids: candidate.id })
  end
end
