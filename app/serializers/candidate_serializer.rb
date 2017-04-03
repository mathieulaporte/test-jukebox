class CandidateSerializer
  attr_reader :candidate
  def initialize(candidate)
    @candidate = candidate
  end

  def as_json(*_args)
    {
      id:   candidate.id.to_s,
      name: candidate.name
    }
  end
end
