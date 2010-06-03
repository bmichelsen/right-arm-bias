class Tag
  include DataMapper::Resource

  property :id,       Serial
  property :name,     String, :required => true, :unique => true         # walking_stance, block, left_technique..

  has n, :movements, :through => Resource
end
