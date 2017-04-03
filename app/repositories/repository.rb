class Repository
  @map = {}

  def self.for(type)
    @map[type]
  end

  def self.register(type, repository)
    @map[type] = repository
  end
end
