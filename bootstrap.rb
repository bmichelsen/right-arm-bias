require 'lab'

# ----------------------------------------------------------------------
# Database migration
# ----------------------------------------------------------------------

puts "Migrating the database.."

DataMapper.auto_migrate!

puts "Done."

# ----------------------------------------------------------------------
# Console output
# ----------------------------------------------------------------------

puts "Inserting data into the database.."

# ----------------------------------------------------------------------
# Pattern names
# ----------------------------------------------------------------------

# get pattern names from the given directory with Dir.entries,
# which returns an array containing all of the filenames in a
# directory

pattern_names = Dir.entries("data/patterns/")
pattern_names.delete(".")
pattern_names.delete("..")

# insert pattern names into the database

pattern_names.each { |element|
  @new_pattern = Pattern.new;
  @new_pattern.attributes = { :name => "#{element}" };
  if @new_pattern.save;
    # object saved
  else
    @new_pattern.errors.each do |e|
      puts e
    end
  end
}

# ----------------------------------------------------------------------
# Tags
# ----------------------------------------------------------------------

# get all pattern filenames

all_pattern_filenames = Dir["data/patterns/*"]

# ----------------------------------------------------------------------

# insert all unique tags into the database

@tags = []

all_pattern_filenames.each { |element|

  file = File.readlines("#{element}")

  # convert each index in the array to enum
  # get each item and its index
  #
  #   :each_with_index)
  #
  #
  # we now have two value sets for each array element
  # the first is the (1) index (0, 1, 2 etc.) and the
  # second is the tag value ("walking_stance", "block,
  # and so forth)
  #
  #
  # for each of these sets, we want to keep *v*
  #
  #   .collect { |v,i| )
  #
  #
  # if the index (i) is ... fifth element, but start with
  # index 1, not 0 which is the array default
  #
  #   if ((i + 1) % 5 == 0);
  #     v;
  #   end;
  #
  #
  # we now have an array consisint of elements we want,
  # along with lots of empty elements that got removed
  # so now, we'll go ahead and remove every nil instance
  #
  #   .compact
  #
  # Thanks Eirik!

  tag_lines = file.to_enum(:each_with_index).collect { |v,i|
    if ((i + 1) % 5 == 0);
      v;
    end;
  }.compact

  @tags += tag_lines
}

# split tag lines to tag words
@tags = @tags.to_s.split

# remove instances of brackets ('[' and ']'), quotation
# marks ('"'), back slashes ('\'), commas (',') and new
# lines ('\n')
@tags = @tags.to_s.gsub(/"|\[|\]|\\n|\\|\,/, '')

# create an array with all tag words
@tags = @tags.split

# remove duplicate elements from self with uniq!
@tags.uniq!

# insert tags into database
@tags.each { |tag|
  @new_tag = Tag.new;
  @new_tag.attributes = { :name => "#{tag}" };
  if @new_tag.save;
    # object saved
  else
    @new_tag.errors.each do |e|
      puts e
    end
  end
}

# ----------------------------------------------------------------------
# Populate the database
# ----------------------------------------------------------------------

all_pattern_filenames.each { |element|

  # return a new string formed by joining the strings using
  # File::SEPARATOR
  file = File.readlines("#{element}").join

  # split the string into an array containing the technique's
  # movement number, terminology and tags
  file = file.split(/\n\n/)

  # get pattern name
  @pattern_name = file.first.downcase

  # remove pattern name from array
  file.delete(file.first)

  # look up the pattern name in the database
  @pattern = Pattern.first(:name => @pattern_name)

  # insert movement data into the database
  file.each { |element|

    @new_movement = @pattern.movements.new;

    # create an array of each element based on new lines,
    # since that gives us an array with movement number,
    # terminology, tags and description as array elements
    e = element.split(/\n/);

    # get movement number
    movement_number = e[0].to_s.scan(/\d+/);

    # convert movement number from array to integer
    movement_number = movement_number.to_s.gsub(/"|\[|\]/, '').to_i

    # insert the movement number into the database
    @new_movement.number = movement_number;

    # get terminology
    terminology = e[1].to_s;

    # insert terminology into the database
    @new_movement.terminology = terminology;

    # create an array of tags
    tags = e[2].split;

    tags.each { |tag|

      # look up the tag name in the database
      @t = Tag.first(:name => "#{tag}");
      
      # associate the tag to the movement
      @new_movement.tags << @t;
    }

    # get the english description
    description = e[3].to_s;

    # insert the description into the database
    @new_movement.description = description;

    # save the object to the database
    if @new_movement.save;
      # object saved
    else
      puts
      puts "---------------------------------------------------------"
      puts "Pattern:       #{@new_movement.pattern.name}"
      puts
      puts "Movement"
      puts "  number:      #{@new_movement.number}"
      puts "  terminology: #{@new_movement.terminology}"
      puts "  description: #{@new_movement.description}"
      puts
      puts "Error message(s):"
      puts

      @new_movement.errors.each do |e|
        puts e
      end
      puts "---------------------------------------------------------"
      puts
    end
  }

}
