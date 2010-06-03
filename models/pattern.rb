class Pattern
  include DataMapper::Resource

  property :id,               Serial
  property :name,             String,     :unique => true

  has n, :movements
end
