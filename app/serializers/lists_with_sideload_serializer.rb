class ListsWithSideloadSerializer
  attr_reader :lists
  def initialize(lists)
    @lists = lists
  end

  def data
    lists.map { |list| ListSerializer.new(list) }
  end

  def included
    candidates.map { |candidate| CandidateSerializer.new(candidate) }
  end

  def as_json(*_args)
    {
      data: data,
      included: included
    }
  end

  private

  def candidates
    Repository
      .for(:candidate)
      .find_by_ids(lists.flat_map(&:candidate_ids).uniq)
  end
end
