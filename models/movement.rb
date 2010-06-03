class Movement
  include DataMapper::Resource

  property :id,               Serial
  property :number,           Integer,    :required => true             # The technique's movement number in the pattern
  property :terminology,      String,     :required => true             # Gunnun so bakat palmok najunde makgi
  property :description,      Text,       :required => true             # Move the left foot to B, forming a left walking stance toward B wile executing..

  belongs_to :pattern
  has n, :tags, :through => Resource
end
