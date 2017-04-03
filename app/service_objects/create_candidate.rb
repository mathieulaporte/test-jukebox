class CreateCandidate
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def call
    candidate = Candidate.new(name: name)
    # TODO: validation
    Repository.for(:candidate).create(candidate)
  end
end
