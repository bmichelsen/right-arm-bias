class Pattern
  include DataMapper::Resource

  property :id,               Serial                                # An auto-increment integer key.
  property :name,             String,     :unique => true           # Unique pattern name. No two values can be identical.

  # Set up cardinality. That is, *how* one table links to another.
  #
  # Define that every pattern has many movements.
  has n, :movements
end
