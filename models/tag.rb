class Tag
  include DataMapper::Resource

  property :id,       Serial                                        # An auto-increment integer key.
  property :name,     String, :required => true, :unique => true    # walking_stance, block, left_technique..

  # Set up cardinality. That is, *how* one table links to another.
  #
  # Define that every tag has many movements.
  has n, :movements, :through => Resource

  # Explanation of the 'has n, :movements, :through => Resource slightly
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
