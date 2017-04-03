class ListSerializer
  attr_reader :list
  def initialize(list)
    @list  = list
  end

  def as_json(*_args)
    {
      id:            list.id.to_s,
      title:         list.title,
      candidate_ids: list.candidate_ids.map(&:to_s)
    }
  end
end
