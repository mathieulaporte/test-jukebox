class CreateList
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def call
    list = List.new(title: name)
    # check validity
    Repository.for(:list).create(list)
  end
end
