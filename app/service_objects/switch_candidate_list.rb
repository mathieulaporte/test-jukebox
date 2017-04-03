class SwitchCandidateList
  attr_reader :candidate, :list
  def initialize(candidate, list)
    @candidate = candidate
    @list      = list
  end

  def call
    Repository
      .for(:list)
      .update_many({}, :$pull => { candidate_ids: candidate.id })
    AddCandidateToList(candidate, list)
  end
end
