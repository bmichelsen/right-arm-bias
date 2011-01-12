class Movement
  include DataMapper::Resource

  property :id,               Serial                                # An auto-increment integer key.
  property :number,           Integer,    :required => true         # The technique's movement number in the pattern.
  property :terminology,      Text,       :required => true         # Gunnun so bakat palmok najunde makgi.
  property :description,      Text,       :required => true         # Move the left foot to B, forming a left walking stance toward B wile executing a middle punch.


  # Declare the associations (ie. relationships) between models.
  #
  # With the associations defined, the models get a set of methods which
  # enables us to create relationships and retrieve data from related
  # models with DataMapper.
  #
  # Define that every movement belongs to a pattern by referencing the
  # primary key in the patterns table as a foreign key in the movements
  # table.
  belongs_to :pattern

  # Set up cardinality. That is, *how* one table links to another.
  #
  # Define that every movement has and belongs to many tags. In other
  # words, all movements have many tags, and many tags have many
  # movements.
  has n, :tags, :through => Resource

  # Explanation of the 'has n, :tags, :through => Resource slightly
  # adapted from http://datamapper.org/docs/associations
  #
  #   When auto_migrate! is being called, the model definitions above
  #   will create a
  #
  #     MovementTag
  #
  #   model that will be automigrated and that will act as the join model.
  #   DataMapper just picks both model names, sorts them alphabetically
  #   and then joins them together. The resulting storage name follows
  #   the  same conventions it would if the model had been declared
  #   traditionally.
  #
  #   The resulting model is no different from any traditionally declared
  #   model. It contains two belongs_to relationships pointing to both
  #   Article and Category, and both underlying child key properties form
  #   the composite primary key (CPK) of that model. DataMapper uses
  #   consistent naming conventions to infer the names of the child key
  #   properties. Since it's told to link together a Movement and a Tag
  #   model, it'll establish the following relationships in the join
  #   model:
  #
  #     MovementTag.belongs_to :movement, 'Movement', :key => true
  #     MovementTag.belongs_to :tag,      'Tag',      :key => true
  #
  #   Since every many to many relationship needs a one to many
  #   relationship to "go through", these also get set up for us.
  #
  #     Movement.has n, :movement_tags Tag.has n,     :movement_tags
  #
  #   Essentially, you can think of ":through => Resource" being replaced
  #   with ":through => :movement_tags" when DM processes the relationship
  #   definition.
  #
  #   This also means that you can access the join model just like any
  #   other DataMapper model since there's really no difference at all.
  #   All you need to know is the inferred name, then you can treat it
  #   just like any other DataMapper model.
end
