require 'RMagick'
require 'gruff'
require_relative 'lab'

@left = Tag.first(:name => 'left_technique')
@right = Tag.first(:name => 'right_technique')

@high = Tag.first(:name => 'high_technique')
@middle = Tag.first(:name => 'middle_technique')
@low = Tag.first(:name => 'low_technique')

@block = Tag.first(:name => 'block')
@punch = Tag.first(:name => 'punch')
@strike = Tag.first(:name => 'strike')
@thrust = Tag.first(:name => 'thrust')

@all_techniques = Movement.all
@left_techniques = @left.movements.all
@right_techniques = @right.movements.all

@all_high = @high.movements.all
@all_middle = @middle.movements.all
@all_low = @low.movements.all

@all_blocks = @block.movements.all
@all_punches = @punch.movements.all
@all_strikes = @strike.movements.all
@all_thrusts = @thrust.movements.all

@all_blocks_left = @all_blocks & @left_techniques
@all_punches_left = @all_punches & @left_techniques
@all_strikes_left = @all_strikes & @left_techniques
@all_thrusts_left = @all_thrusts & @left_techniques

@all_blocks_right = @all_blocks & @right_techniques
@all_punches_right = @all_punches & @right_techniques
@all_strikes_right = @all_strikes & @right_techniques
@all_thrusts_right = @all_thrusts & @right_techniques

# -----------------------------------------------------------------------------
# All techniques
# -----------------------------------------------------------------------------

def all_techniques
  all_blocks = @all_blocks_left.count + @all_blocks_right.count
  all_punches = @all_punches_left.count + @all_punches_right.count
  all_strikes = @all_strikes_left.count + @all_strikes_right.count
  all_thrusts = @all_thrusts_left.count + @all_thrusts_right.count

  puts "All techniques..."
  dataset_all = [
    [:blocks,
      [
        all_blocks,
      ]
    ],
    [:punches,
      [
        all_punches,
      ]
    ],
    [:strikes,
      [
        all_strikes,
      ]
    ],
    [:thrusts,
      [
        all_thrusts,
      ]
    ],
  ]

  dataset_all.each { |data|
    puts data[0], data[1]
  }

  puts "---------------------------------------"
  puts "All left techniques..."

  dataset_all_left = [
    [:blocks,
      [
        @all_blocks_left.count,
      ]
    ],
    [:punches,
      [
        @all_punches_left.count,
      ]
    ],
    [:strikes,
      [
        @all_strikes_left.count,
      ]
    ],
    [:thrusts,
      [
        @all_thrusts_left.count,
      ]
    ],
  ]

  dataset_all_left.each { |data|
    puts data[0], data[1]
  }


  puts "---------------------------------------"
  puts "All right techniques..."

  dataset_all_right = [
    [:blocks,
      [
        @all_blocks_right.count,
      ]
    ],
    [:punches,
      [
        @all_punches_right.count,
      ]
    ],
    [:strikes,
      [
        @all_strikes_right.count,
      ]
    ],
    [:thrusts,
      [
        @all_thrusts_right.count,
      ]
    ],
  ]

  dataset_all_right.each { |data|
    puts data[0], data[1]
  }
end

# -----------------------------------------------------------------------------
# Height
# -----------------------------------------------------------------------------

def techniques_by_height
  @high_blocks = @all_blocks & @high.movements.all
  @middle_blocks = @all_blocks & @middle.movements.all
  @low_blocks = @all_blocks & @low.movements.all

  @high_punches = @all_punches & @high.movements.all
  @middle_punches = @all_punches & @middle.movements.all
  @low_punches = @all_punches & @low.movements.all

  @high_strikes = @all_strikes & @high.movements.all
  @middle_strikes = @all_strikes & @middle.movements.all
  @low_strikes = @all_strikes & @low.movements.all

  @high_thrusts = @all_thrusts & @high.movements.all
  @middle_thrusts = @all_thrusts & @middle.movements.all
  @low_thrusts = @all_thrusts & @low.movements.all


  @high_blocks_left = @high_blocks & @left_techniques
  @middle_blocks_left = @middle_blocks & @left_techniques
  @low_blocks_left = @low_blocks & @left_techniques

  @high_punches_left = @high_punches & @left_techniques
  @middle_punches_left = @middle_punches & @left_techniques
  @low_punches_left = @low_punches & @left_techniques

  @high_strikes_left = @high_strikes & @left_techniques
  @middle_strikes_left = @middle_strikes & @left_techniques
  @low_strikes_left = @low_strikes & @left_techniques

  @high_thrusts_left = @high_thrusts & @left_techniques
  @middle_thrusts_left = @middle_thrusts & @left_techniques
  @low_thrusts_left = @low_thrusts & @left_techniques


  @high_blocks_right = @high_blocks & @right_techniques
  @middle_blocks_right = @middle_blocks & @right_techniques
  @low_blocks_right = @low_blocks & @right_techniques

  @high_punches_right = @high_punches & @right_techniques
  @middle_punches_right = @middle_punches & @right_techniques
  @low_punches_right = @low_punches & @right_techniques

  @high_strikes_right = @high_strikes & @right_techniques
  @middle_strikes_right = @middle_strikes & @right_techniques
  @low_strikes_right = @low_strikes & @right_techniques

  @high_thrusts_right = @high_thrusts & @right_techniques
  @middle_thrusts_right = @middle_thrusts & @right_techniques
  @low_thrusts_right = @low_thrusts & @right_techniques


  puts "---------------------------------------"
  puts "All techniques by height"

  dataset = [
    [:blocks,
      [
        @high_blocks.count,
        @middle_blocks.count,
        @low_blocks.count
      ]
    ],
    [:punches,
      [
        @high_punches.count,
        @middle_punches.count,
        @low_punches.count
      ]
    ],
    [:strikes,
      [
        @high_strikes.count,
        @middle_strikes.count,
        @low_strikes.count
      ]
    ],
    [:thrusts,
      [
        @high_thrusts.count,
        @middle_thrusts.count,
        @low_thrusts.count
      ]
    ],
  ]

  dataset.each { |data|
    puts data[0], data[1]
  }


  puts "---------------------------------------"
  puts "Left techniques by height"

  dataset_left = [
    [:blocks,
      [
        @high_blocks_left.count,
        @middle_blocks_left.count,
        @low_blocks_left.count
      ]
    ],
    [:punches,
      [
        @high_punches_left.count,
        @middle_punches_left.count,
        @low_punches_left.count
      ]
    ],
    [:strikes,
      [
        @high_strikes_left.count,
        @middle_strikes_left.count,
        @low_strikes_left.count
      ]
    ],
    [:thrusts,
      [
        @high_thrusts_left.count,
        @middle_thrusts_left.count,
        @low_thrusts_left.count
      ]
    ],
  ]

  dataset_left.each { |data|
    puts data[0], data[1]
  }

  puts "---------------------------------------"
  puts "Right techniques by height"

  dataset_right = [
    [:blocks,
      [
        @high_blocks_right.count,
        @middle_blocks_right.count,
        @low_blocks_right.count
      ]
    ],
    [:punches,
      [
        @high_punches_right.count,
        @middle_punches_right.count,
        @low_punches_right.count
      ]
    ],
    [:strikes,
      [
        @high_strikes_right.count,
        @middle_strikes_right.count,
        @low_strikes_right.count
      ]
    ],
    [:thrusts,
      [
        @high_thrusts_right.count,
        @middle_thrusts_right.count,
        @low_thrusts_right.count
      ]
    ],
  ]

  dataset_right.each { |data|
    puts data[0], data[1]
  }
end

# -----------------------------------------------------------------------------
# Stances
# -----------------------------------------------------------------------------

def techniques_by_stances
  @l_stance = Tag.first(:name => 'l_stance')
  @walking_stance = Tag.first(:name => 'walking_stance')
  @bending_ready_stance_a = Tag.first(:name => 'bending_ready_stance_a')
  @fixed_stance = Tag.first(:name => 'fixed_stance')
  @sitting_stance = Tag.first(:name => 'sitting_stance')
  @close_stance = Tag.first(:name => 'close_stance')
  @low_stance = Tag.first(:name => 'low_stance')
  @rear_foot_stance = Tag.first(:name => 'rear_foot_stance')
  @x_stance = Tag.first(:name => 'x_stance')
  @one_leg_stance = Tag.first(:name => 'one_leg_stance')
  @diagonal_stance = Tag.first(:name => 'diagonal_stance')
  @bending_ready_stance_b = Tag.first(:name => 'bending_ready_stance_b')
  @parallel_stance = Tag.first(:name => 'parallel_stance')
  @vertical_stance = Tag.first(:name => 'vertical_stance')

  l_stance_blocks = @l_stance.movements.all & @all_blocks
  walking_stance_blocks = @walking_stance.movements.all & @all_blocks
  bending_ready_stance_a_blocks = @bending_ready_stance_a.movements.all & @all_blocks
  fixed_stance_blocks = @fixed_stance.movements.all & @all_blocks
  sitting_stance_blocks = @sitting_stance.movements.all & @all_blocks
  close_stance_blocks = @close_stance.movements.all & @all_blocks
  low_stance_blocks = @low_stance.movements.all & @all_blocks
  rear_foot_stance_blocks = @rear_foot_stance.movements.all & @all_blocks
  x_stance_blocks = @x_stance.movements.all & @all_blocks unless nil
  one_leg_stance_blocks = @one_leg_stance.movements.all & @all_blocks
  diagonal_stance_blocks = @diagonal_stance.movements.all & @all_blocks
  bending_ready_stance_b_blocks = @bending_ready_stance_b.movements.all & @all_blocks
  parallel_stance_blocks = @parallel_stance.movements.all & @all_blocks
  vertical_stance_blocks = @vertical_stance.movements.all & @all_blocks

  l_stance_punches = @l_stance.movements.all & @all_punches
  walking_stance_punches = @walking_stance.movements.all & @all_punches
  bending_ready_stance_a_punches = @bending_ready_stance_a.movements.all & @all_punches
  fixed_stance_punches = @fixed_stance.movements.all & @all_punches
  sitting_stance_punches = @sitting_stance.movements.all & @all_punches
  close_stance_punches = @close_stance.movements.all & @all_punches
  low_stance_punches = @low_stance.movements.all & @all_punches
  rear_foot_stance_punches = @rear_foot_stance.movements.all & @all_punches
  x_stance_punches = @x_stance.movements.all & @all_punches
  one_leg_stance_punches = @one_leg_stance.movements.all & @all_punches unless nil
  diagonal_stance_punches = @diagonal_stance.movements.all & @all_punches
  bending_ready_stance_b_punches = @bending_ready_stance_b.movements.all & @all_punches
  parallel_stance_punches = @parallel_stance.movements.all & @all_punches
  vertical_stance_punches = @vertical_stance.movements.all & @all_punches

  l_stance_strikes = @l_stance.movements.all & @all_strikes
  walking_stance_strikes = @walking_stance.movements.all & @all_strikes
  bending_ready_stance_a_strikes = @bending_ready_stance_a.movements.all & @all_strikes
  fixed_stance_strikes = @fixed_stance.movements.all & @all_strikes
  sitting_stance_strikes = @sitting_stance.movements.all & @all_strikes
  close_stance_strikes = @close_stance.movements.all & @all_strikes
  low_stance_strikes = @low_stance.movements.all & @all_strikes
  rear_foot_stance_strikes = @rear_foot_stance.movements.all & @all_strikes
  x_stance_strikes = @x_stance.movements.all & @all_strikes
  one_leg_stance_strikes = @one_leg_stance.movements.all & @all_strikes
  diagonal_stance_strikes = @diagonal_stance.movements.all & @all_strikes
  bending_ready_stance_b_strikes = @bending_ready_stance_b.movements.all & @all_strikes
  parallel_stance_strikes = @parallel_stance.movements.all & @all_strikes
  vertical_stance_strikes = @vertical_stance.movements.all & @all_strikes

  l_stance_thrusts = @l_stance.movements.all & @all_thrusts
  walking_stance_thrusts = @walking_stance.movements.all & @all_thrusts
  bending_ready_stance_a_thrusts = @bending_ready_stance_a.movements.all & @all_thrusts
  fixed_stance_thrusts = @fixed_stance.movements.all & @all_thrusts
  sitting_stance_thrusts = @sitting_stance.movements.all & @all_thrusts
  close_stance_thrusts = @close_stance.movements.all & @all_thrusts
  low_stance_thrusts = @low_stance.movements.all & @all_thrusts
  rear_foot_stance_thrusts = @rear_foot_stance.movements.all & @all_thrusts
  x_stance_thrusts = @x_stance.movements.all & @all_thrusts
  one_leg_stance_thrusts = @one_leg_stance.movements.all & @all_thrusts
  diagonal_stance_thrusts = @diagonal_stance.movements.all & @all_thrusts
  bending_ready_stance_b_thrusts = @bending_ready_stance_b.movements.all & @all_thrusts
  parallel_stance_thrusts = @parallel_stance.movements.all & @all_thrusts
  vertical_stance_thrusts = @vertical_stance.movements.all & @all_thrusts



  l_stance_blocks_left = @l_stance.movements.all & @all_blocks_left
  walking_stance_blocks_left = @walking_stance.movements.all & @all_blocks_left
  bending_ready_stance_a_blocks_left = @bending_ready_stance_a.movements.all & @all_blocks_left
  fixed_stance_blocks_left = @fixed_stance.movements.all & @all_blocks_left
  sitting_stance_blocks_left = @sitting_stance.movements.all & @all_blocks_left
  close_stance_blocks_left = @close_stance.movements.all & @all_blocks_left
  low_stance_blocks_left = @low_stance.movements.all & @all_blocks_left
  rear_foot_stance_blocks_left = @rear_foot_stance.movements.all & @all_blocks_left
  x_stance_blocks_left = @x_stance.movements.all & @all_blocks_left unless nil
  one_leg_stance_blocks_left = @one_leg_stance.movements.all & @all_blocks_left
  diagonal_stance_blocks_left = @diagonal_stance.movements.all & @all_blocks_left
  bending_ready_stance_b_blocks_left = @bending_ready_stance_b.movements.all & @all_blocks_left
  parallel_stance_blocks_left = @parallel_stance.movements.all & @all_blocks_left
  vertical_stance_blocks_left = @vertical_stance.movements.all & @all_blocks_left

  l_stance_punches_left = @l_stance.movements.all & @all_punches_left
  walking_stance_punches_left = @walking_stance.movements.all & @all_punches_left
  bending_ready_stance_a_punches_left = @bending_ready_stance_a.movements.all & @all_punches_left
  fixed_stance_punches_left = @fixed_stance.movements.all & @all_punches_left
  sitting_stance_punches_left = @sitting_stance.movements.all & @all_punches_left
  close_stance_punches_left = @close_stance.movements.all & @all_punches_left
  low_stance_punches_left = @low_stance.movements.all & @all_punches_left
  rear_foot_stance_punches_left = @rear_foot_stance.movements.all & @all_punches_left
  x_stance_punches_left = @x_stance.movements.all & @all_punches_left
  one_leg_stance_punches_left = @one_leg_stance.movements.all & @all_punches_left unless nil
  diagonal_stance_punches_left = @diagonal_stance.movements.all & @all_punches_left
  bending_ready_stance_b_punches_left = @bending_ready_stance_b.movements.all & @all_punches_left
  parallel_stance_punches_left = @parallel_stance.movements.all & @all_punches_left
  vertical_stance_punches_left = @vertical_stance.movements.all & @all_punches_left

  l_stance_strikes_left = @l_stance.movements.all & @all_strikes_left
  walking_stance_strikes_left = @walking_stance.movements.all & @all_strikes_left
  bending_ready_stance_a_strikes_left = @bending_ready_stance_a.movements.all & @all_strikes_left
  fixed_stance_strikes_left = @fixed_stance.movements.all & @all_strikes_left
  sitting_stance_strikes_left = @sitting_stance.movements.all & @all_strikes_left
  close_stance_strikes_left = @close_stance.movements.all & @all_strikes_left
  low_stance_strikes_left = @low_stance.movements.all & @all_strikes_left
  rear_foot_stance_strikes_left = @rear_foot_stance.movements.all & @all_strikes_left
  x_stance_strikes_left = @x_stance.movements.all & @all_strikes_left
  one_leg_stance_strikes_left = @one_leg_stance.movements.all & @all_strikes_left
  diagonal_stance_strikes_left = @diagonal_stance.movements.all & @all_strikes_left
  bending_ready_stance_b_strikes_left = @bending_ready_stance_b.movements.all & @all_strikes_left
  parallel_stance_strikes_left = @parallel_stance.movements.all & @all_strikes_left
  vertical_stance_strikes_left = @vertical_stance.movements.all & @all_strikes_left

  l_stance_thrusts_left = @l_stance.movements.all & @all_thrusts_left
  walking_stance_thrusts_left = @walking_stance.movements.all & @all_thrusts_left
  bending_ready_stance_a_thrusts_left = @bending_ready_stance_a.movements.all & @all_thrusts_left
  fixed_stance_thrusts_left = @fixed_stance.movements.all & @all_thrusts_left
  sitting_stance_thrusts_left = @sitting_stance.movements.all & @all_thrusts_left
  close_stance_thrusts_left = @close_stance.movements.all & @all_thrusts_left
  low_stance_thrusts_left = @low_stance.movements.all & @all_thrusts_left
  rear_foot_stance_thrusts_left = @rear_foot_stance.movements.all & @all_thrusts_left
  x_stance_thrusts_left = @x_stance.movements.all & @all_thrusts_left
  one_leg_stance_thrusts_left = @one_leg_stance.movements.all & @all_thrusts_left
  diagonal_stance_thrusts_left = @diagonal_stance.movements.all & @all_thrusts_left
  bending_ready_stance_b_thrusts_left = @bending_ready_stance_b.movements.all & @all_thrusts_left
  parallel_stance_thrusts_left = @parallel_stance.movements.all & @all_thrusts_left
  vertical_stance_thrusts_left = @vertical_stance.movements.all & @all_thrusts_left



  l_stance_blocks_right = @l_stance.movements.all & @all_blocks_right
  walking_stance_blocks_right = @walking_stance.movements.all & @all_blocks_right
  bending_ready_stance_a_blocks_right = @bending_ready_stance_a.movements.all & @all_blocks_right
  fixed_stance_blocks_right = @fixed_stance.movements.all & @all_blocks_right
  sitting_stance_blocks_right = @sitting_stance.movements.all & @all_blocks_right
  close_stance_blocks_right = @close_stance.movements.all & @all_blocks_right
  low_stance_blocks_right = @low_stance.movements.all & @all_blocks_right
  rear_foot_stance_blocks_right = @rear_foot_stance.movements.all & @all_blocks_right
  x_stance_blocks_right = @x_stance.movements.all & @all_blocks_right unless nil
  one_leg_stance_blocks_right = @one_leg_stance.movements.all & @all_blocks_right
  diagonal_stance_blocks_right = @diagonal_stance.movements.all & @all_blocks_right
  bending_ready_stance_b_blocks_right = @bending_ready_stance_b.movements.all & @all_blocks_right
  parallel_stance_blocks_right = @parallel_stance.movements.all & @all_blocks_right
  vertical_stance_blocks_right = @vertical_stance.movements.all & @all_blocks_right

  l_stance_punches_right = @l_stance.movements.all & @all_punches_right
  walking_stance_punches_right = @walking_stance.movements.all & @all_punches_right
  bending_ready_stance_a_punches_right = @bending_ready_stance_a.movements.all & @all_punches_right
  fixed_stance_punches_right = @fixed_stance.movements.all & @all_punches_right
  sitting_stance_punches_right = @sitting_stance.movements.all & @all_punches_right
  close_stance_punches_right = @close_stance.movements.all & @all_punches_right
  low_stance_punches_right = @low_stance.movements.all & @all_punches_right
  rear_foot_stance_punches_right = @rear_foot_stance.movements.all & @all_punches_right
  x_stance_punches_right = @x_stance.movements.all & @all_punches_right
  one_leg_stance_punches_right = @one_leg_stance.movements.all & @all_punches_right unless nil
  diagonal_stance_punches_right = @diagonal_stance.movements.all & @all_punches_right
  bending_ready_stance_b_punches_right = @bending_ready_stance_b.movements.all & @all_punches_right
  parallel_stance_punches_right = @parallel_stance.movements.all & @all_punches_right
  vertical_stance_punches_right = @vertical_stance.movements.all & @all_punches_right

  l_stance_strikes_right = @l_stance.movements.all & @all_strikes_right
  walking_stance_strikes_right = @walking_stance.movements.all & @all_strikes_right
  bending_ready_stance_a_strikes_right = @bending_ready_stance_a.movements.all & @all_strikes_right
  fixed_stance_strikes_right = @fixed_stance.movements.all & @all_strikes_right
  sitting_stance_strikes_right = @sitting_stance.movements.all & @all_strikes_right
  close_stance_strikes_right = @close_stance.movements.all & @all_strikes_right
  low_stance_strikes_right = @low_stance.movements.all & @all_strikes_right
  rear_foot_stance_strikes_right = @rear_foot_stance.movements.all & @all_strikes_right
  x_stance_strikes_right = @x_stance.movements.all & @all_strikes_right
  one_leg_stance_strikes_right = @one_leg_stance.movements.all & @all_strikes_right
  diagonal_stance_strikes_right = @diagonal_stance.movements.all & @all_strikes_right
  bending_ready_stance_b_strikes_right = @bending_ready_stance_b.movements.all & @all_strikes_right
  parallel_stance_strikes_right = @parallel_stance.movements.all & @all_strikes_right
  vertical_stance_strikes_right = @vertical_stance.movements.all & @all_strikes_right

  l_stance_thrusts_right = @l_stance.movements.all & @all_thrusts_right
  walking_stance_thrusts_right = @walking_stance.movements.all & @all_thrusts_right
  bending_ready_stance_a_thrusts_right = @bending_ready_stance_a.movements.all & @all_thrusts_right
  fixed_stance_thrusts_right = @fixed_stance.movements.all & @all_thrusts_right
  sitting_stance_thrusts_right = @sitting_stance.movements.all & @all_thrusts_right
  close_stance_thrusts_right = @close_stance.movements.all & @all_thrusts_right
  low_stance_thrusts_right = @low_stance.movements.all & @all_thrusts_right
  rear_foot_stance_thrusts_right = @rear_foot_stance.movements.all & @all_thrusts_right
  x_stance_thrusts_right = @x_stance.movements.all & @all_thrusts_right
  one_leg_stance_thrusts_right = @one_leg_stance.movements.all & @all_thrusts_right
  diagonal_stance_thrusts_right = @diagonal_stance.movements.all & @all_thrusts_right
  bending_ready_stance_b_thrusts_right = @bending_ready_stance_b.movements.all & @all_thrusts_right
  parallel_stance_thrusts_right = @parallel_stance.movements.all & @all_thrusts_right
  vertical_stance_thrusts_right = @vertical_stance.movements.all & @all_thrusts_right





  puts "---------------------------------------"
  puts "All techniques by stances"

  dataset = [
    [:l_stance,
      [
        l_stance_blocks.count,
        l_stance_punches.count,
        l_stance_strikes.count,
        l_stance_thrusts.count,
      ]
    ],
    [:walking_stance,
      [
        walking_stance_blocks.count,
        walking_stance_punches.count,
        walking_stance_strikes.count,
        walking_stance_thrusts.count,
      ]
    ],
    [:fixed_stance,
      [
        fixed_stance_blocks.count,
        fixed_stance_punches.count, 
        fixed_stance_strikes.count, 
        fixed_stance_thrusts.count,
      ]
    ],
    [:sitting_stance,
      [
        sitting_stance_blocks.count,
        sitting_stance_punches.count, 
        sitting_stance_strikes.count, 
        sitting_stance_thrusts.count,
      ]
    ],
    [:close_stance,
      [

        close_stance_blocks.count, 
        close_stance_punches.count, 
        close_stance_strikes.count, 
        close_stance_thrusts.count,
      ]
    ],
    [:low_stance,
      [
        low_stance_blocks.count, 
        low_stance_punches.count, 
        low_stance_strikes.count, 
        low_stance_thrusts.count, 
      ]
    ],
    [:rear_foot_stance,
      [
        rear_foot_stance_blocks.count, 
        rear_foot_stance_punches.count, 
        rear_foot_stance_strikes.count, 
        rear_foot_stance_thrusts.count, 
      ]
    ],
    [:x_stance,
      [
        x_stance_blocks.count, 
        x_stance_punches.count, 
        x_stance_strikes.count, 
        x_stance_thrusts.count, 
      ]
    ],
    [:one_leg,
      [

        one_leg_stance_blocks.count, 
        one_leg_stance_punches.count, 
        one_leg_stance_strikes.count, 
        one_leg_stance_thrusts.count, 
      ]
    ],
    [:diagonal_stance,
      [

        diagonal_stance_blocks.count, 
        diagonal_stance_punches.count, 
        diagonal_stance_strikes.count, 
        diagonal_stance_thrusts.count, 
      ]
    ],
    [:bending_ready_stance_b,
      [

        bending_ready_stance_b_blocks.count, 
        bending_ready_stance_b_punches.count, 
        bending_ready_stance_b_strikes.count, 
        bending_ready_stance_b_thrusts.count,
      ]
    ],
    [:bending_ready_stance_a,
      [
        bending_ready_stance_a_blocks.count,
        bending_ready_stance_a_punches.count, 
        bending_ready_stance_a_strikes.count, 
        bending_ready_stance_a_thrusts.count,
      ]
    ],
    [:parallel_stance,
      [
        parallel_stance_blocks.count, 
        parallel_stance_punches.count, 
        parallel_stance_strikes.count, 
        parallel_stance_thrusts.count, 
      ]
    ],
    [:vertical_stance,
      [
        vertical_stance_blocks.count,
        vertical_stance_punches.count,
        vertical_stance_strikes.count,
        vertical_stance_thrusts.count,
      ]
    ],
  ]

  dataset.each { |data|
    puts data[0], data[1]
  }



  puts "---------------------------------------"
  puts "Techniques by stances (-walking, sitting, L)"

  dataset_ex_w_l_s = [
    [:fixed_stance,
      [
        fixed_stance_blocks.count,
        fixed_stance_punches.count, 
        fixed_stance_strikes.count, 
        fixed_stance_thrusts.count,
      ]
    ],
    [:close_stance,
      [

        close_stance_blocks.count, 
        close_stance_punches.count, 
        close_stance_strikes.count, 
        close_stance_thrusts.count,
      ]
    ],
    [:low_stance,
      [
        low_stance_blocks.count, 
        low_stance_punches.count, 
        low_stance_strikes.count, 
        low_stance_thrusts.count, 
      ]
    ],
    [:rear_foot_stance,
      [
        rear_foot_stance_blocks.count, 
        rear_foot_stance_punches.count, 
        rear_foot_stance_strikes.count, 
        rear_foot_stance_thrusts.count, 
      ]
    ],
    [:x_stance,
      [
        x_stance_blocks.count, 
        x_stance_punches.count, 
        x_stance_strikes.count, 
        x_stance_thrusts.count, 
      ]
    ],
    [:one_leg,
      [

        one_leg_stance_blocks.count, 
        one_leg_stance_punches.count, 
        one_leg_stance_strikes.count, 
        one_leg_stance_thrusts.count, 
      ]
    ],
    [:diagonal_stance,
      [

        diagonal_stance_blocks.count, 
        diagonal_stance_punches.count, 
        diagonal_stance_strikes.count, 
        diagonal_stance_thrusts.count, 
      ]
    ],
    [:bending_ready_stance_b,
      [

        bending_ready_stance_b_blocks.count, 
        bending_ready_stance_b_punches.count, 
        bending_ready_stance_b_strikes.count, 
        bending_ready_stance_b_thrusts.count,
      ]
    ],
    [:bending_ready_stance_a,
      [
        bending_ready_stance_a_blocks.count,
        bending_ready_stance_a_punches.count, 
        bending_ready_stance_a_strikes.count, 
        bending_ready_stance_a_thrusts.count,
      ]
    ],
    [:parallel_stance,
      [
        parallel_stance_blocks.count, 
        parallel_stance_punches.count, 
        parallel_stance_strikes.count, 
        parallel_stance_thrusts.count, 
      ]
    ],
    [:vertical_stance,
      [
        vertical_stance_blocks.count,
        vertical_stance_punches.count,
        vertical_stance_strikes.count,
        vertical_stance_thrusts.count,
      ]
    ],
  ]

  dataset_ex_w_l_s.each { |data|
    puts data[0], data[1]
  }





  puts "---------------------------------------"
  puts "Left techniques by stances"

  dataset_left = [
    [:l_stance,
      [
        l_stance_blocks_left.count,
        l_stance_punches_left.count,
        l_stance_strikes_left.count,
        l_stance_thrusts_left.count,
      ]
    ],
    [:walking_stance,
      [
        walking_stance_blocks_left.count,
        walking_stance_punches_left.count,
        walking_stance_strikes_left.count,
        walking_stance_thrusts_left.count,
      ]
    ],
    [:fixed_stance,
      [
        fixed_stance_blocks_left.count,
        fixed_stance_punches_left.count, 
        fixed_stance_strikes_left.count, 
        fixed_stance_thrusts_left.count,
      ]
    ],
    [:sitting_stance,
      [
        sitting_stance_blocks_left.count,
        sitting_stance_punches_left.count, 
        sitting_stance_strikes_left.count, 
        sitting_stance_thrusts_left.count,
      ]
    ],
    [:close_stance,
      [

        close_stance_blocks_left.count, 
        close_stance_punches_left.count, 
        close_stance_strikes_left.count, 
        close_stance_thrusts_left.count,
      ]
    ],
    [:low_stance,
      [
        low_stance_blocks_left.count, 
        low_stance_punches_left.count, 
        low_stance_strikes_left.count, 
        low_stance_thrusts_left.count, 
      ]
    ],
    [:rear_foot_stance,
      [
        rear_foot_stance_blocks_left.count, 
        rear_foot_stance_punches_left.count, 
        rear_foot_stance_strikes_left.count, 
        rear_foot_stance_thrusts_left.count, 
      ]
    ],
    [:x_stance,
      [
        x_stance_blocks_left.count, 
        x_stance_punches_left.count, 
        x_stance_strikes_left.count, 
        x_stance_thrusts_left.count, 
      ]
    ],
    [:one_leg,
      [

        one_leg_stance_blocks_left.count, 
        one_leg_stance_punches_left.count, 
        one_leg_stance_strikes_left.count, 
        one_leg_stance_thrusts_left.count, 
      ]
    ],
    [:diagonal_stance,
      [

        diagonal_stance_blocks_left.count, 
        diagonal_stance_punches_left.count, 
        diagonal_stance_strikes_left.count, 
        diagonal_stance_thrusts_left.count, 
      ]
    ],
    [:bending_ready_stance_b,
      [

        bending_ready_stance_b_blocks_left.count, 
        bending_ready_stance_b_punches_left.count, 
        bending_ready_stance_b_strikes_left.count, 
        bending_ready_stance_b_thrusts_left.count,
      ]
    ],
    [:bending_ready_stance_a,
      [
        bending_ready_stance_a_blocks_left.count,
        bending_ready_stance_a_punches_left.count, 
        bending_ready_stance_a_strikes_left.count, 
        bending_ready_stance_a_thrusts_left.count,
      ]
    ],
    [:parallel_stance,
      [
        parallel_stance_blocks_left.count, 
        parallel_stance_punches_left.count, 
        parallel_stance_strikes_left.count, 
        parallel_stance_thrusts_left.count, 
      ]
    ],
    [:vertical_stance,
      [
        vertical_stance_blocks_left.count,
        vertical_stance_punches_left.count,
        vertical_stance_strikes_left.count,
        vertical_stance_thrusts_left.count,
      ]
    ],
  ]

  dataset_left.each { |data|
    puts data[0], data[1]
  }




  puts "---------------------------------------"
  puts "Right techniques by stances"

  dataset_right = [
    [:l_stance,
      [
        l_stance_blocks_right.count,
        l_stance_punches_right.count,
        l_stance_strikes_right.count,
        l_stance_thrusts_right.count,
      ]
    ],
    [:walking_stance,
      [
        walking_stance_blocks_right.count,
        walking_stance_punches_right.count,
        walking_stance_strikes_right.count,
        walking_stance_thrusts_right.count,
      ]
    ],
    [:fixed_stance,
      [
        fixed_stance_blocks_right.count,
        fixed_stance_punches_right.count, 
        fixed_stance_strikes_right.count, 
        fixed_stance_thrusts_right.count,
      ]
    ],
    [:sitting_stance,
      [
        sitting_stance_blocks_right.count,
        sitting_stance_punches_right.count, 
        sitting_stance_strikes_right.count, 
        sitting_stance_thrusts_right.count,
      ]
    ],
    [:close_stance,
      [

        close_stance_blocks_right.count, 
        close_stance_punches_right.count, 
        close_stance_strikes_right.count, 
        close_stance_thrusts_right.count,
      ]
    ],
    [:low_stance,
      [
        low_stance_blocks_right.count, 
        low_stance_punches_right.count, 
        low_stance_strikes_right.count, 
        low_stance_thrusts_right.count, 
      ]
    ],
    [:rear_foot_stance,
      [
        rear_foot_stance_blocks_right.count, 
        rear_foot_stance_punches_right.count, 
        rear_foot_stance_strikes_right.count, 
        rear_foot_stance_thrusts_right.count, 
      ]
    ],
    [:x_stance,
      [
        x_stance_blocks_right.count, 
        x_stance_punches_right.count, 
        x_stance_strikes_right.count, 
        x_stance_thrusts_right.count, 
      ]
    ],
    [:one_leg,
      [

        one_leg_stance_blocks_right.count, 
        one_leg_stance_punches_right.count, 
        one_leg_stance_strikes_right.count, 
        one_leg_stance_thrusts_right.count, 
      ]
    ],
    [:diagonal_stance,
      [

        diagonal_stance_blocks_right.count, 
        diagonal_stance_punches_right.count, 
        diagonal_stance_strikes_right.count, 
        diagonal_stance_thrusts_right.count, 
      ]
    ],
    [:bending_ready_stance_b,
      [

        bending_ready_stance_b_blocks_right.count, 
        bending_ready_stance_b_punches_right.count, 
        bending_ready_stance_b_strikes_right.count, 
        bending_ready_stance_b_thrusts_right.count,
      ]
    ],
    [:bending_ready_stance_a,
      [
        bending_ready_stance_a_blocks_right.count,
        bending_ready_stance_a_punches_right.count, 
        bending_ready_stance_a_strikes_right.count, 
        bending_ready_stance_a_thrusts_right.count,
      ]
    ],
    [:parallel_stance,
      [
        parallel_stance_blocks_right.count, 
        parallel_stance_punches_right.count, 
        parallel_stance_strikes_right.count, 
        parallel_stance_thrusts_right.count, 
      ]
    ],
    [:vertical_stance,
      [
        vertical_stance_blocks_right.count,
        vertical_stance_punches_right.count,
        vertical_stance_strikes_right.count,
        vertical_stance_thrusts_right.count,
      ]
    ],
  ]

  dataset_right.each { |data|
    puts data[0], data[1]
  }




  puts "---------------------------------------"
  puts "Left tech. by stances (-walking, sitting, L)"

  dataset_left_not_w_l_s = [
    [:fixed_stance,
      [
        fixed_stance_blocks_left.count,
        fixed_stance_punches_left.count, 
        fixed_stance_strikes_left.count, 
        fixed_stance_thrusts_left.count,
      ]
    ],
    [:close_stance,
      [

        close_stance_blocks_left.count, 
        close_stance_punches_left.count, 
        close_stance_strikes_left.count, 
        close_stance_thrusts_left.count,
      ]
    ],
    [:low_stance,
      [
        low_stance_blocks_left.count, 
        low_stance_punches_left.count, 
        low_stance_strikes_left.count, 
        low_stance_thrusts_left.count, 
      ]
    ],
    [:rear_foot_stance,
      [
        rear_foot_stance_blocks_left.count, 
        rear_foot_stance_punches_left.count, 
        rear_foot_stance_strikes_left.count, 
        rear_foot_stance_thrusts_left.count, 
      ]
    ],
    [:x_stance,
      [
        x_stance_blocks_left.count, 
        x_stance_punches_left.count, 
        x_stance_strikes_left.count, 
        x_stance_thrusts_left.count, 
      ]
    ],
    [:one_leg,
      [

        one_leg_stance_blocks_left.count, 
        one_leg_stance_punches_left.count, 
        one_leg_stance_strikes_left.count, 
        one_leg_stance_thrusts_left.count, 
      ]
    ],
    [:diagonal_stance,
      [

        diagonal_stance_blocks_left.count, 
        diagonal_stance_punches_left.count, 
        diagonal_stance_strikes_left.count, 
        diagonal_stance_thrusts_left.count, 
      ]
    ],
    [:bending_ready_stance_b,
      [

        bending_ready_stance_b_blocks_left.count, 
        bending_ready_stance_b_punches_left.count, 
        bending_ready_stance_b_strikes_left.count, 
        bending_ready_stance_b_thrusts_left.count,
      ]
    ],
    [:bending_ready_stance_a,
      [
        bending_ready_stance_a_blocks_left.count,
        bending_ready_stance_a_punches_left.count, 
        bending_ready_stance_a_strikes_left.count, 
        bending_ready_stance_a_thrusts_left.count,
      ]
    ],
    [:parallel_stance,
      [
        parallel_stance_blocks_left.count, 
        parallel_stance_punches_left.count, 
        parallel_stance_strikes_left.count, 
        parallel_stance_thrusts_left.count, 
      ]
    ],
    [:vertical_stance,
      [
        vertical_stance_blocks_left.count,
        vertical_stance_punches_left.count,
        vertical_stance_strikes_left.count,
        vertical_stance_thrusts_left.count,
      ]
    ],
  ]


  dataset_left_not_w_l_s.each { |data|
    puts data[0], data[1]
  }




  puts "---------------------------------------"
  puts "Right tech. by stances (-walking, sitting, L)"

  dataset_right_not_w_l_s = [
    [:fixed_stance,
      [
        fixed_stance_blocks_right.count,
        fixed_stance_punches_right.count, 
        fixed_stance_strikes_right.count, 
        fixed_stance_thrusts_right.count,
      ]
    ],
    [:close_stance,
      [

        close_stance_blocks_right.count, 
        close_stance_punches_right.count, 
        close_stance_strikes_right.count, 
        close_stance_thrusts_right.count,
      ]
    ],
    [:low_stance,
      [
        low_stance_blocks_right.count, 
        low_stance_punches_right.count, 
        low_stance_strikes_right.count, 
        low_stance_thrusts_right.count, 
      ]
    ],
    [:rear_foot_stance,
      [
        rear_foot_stance_blocks_right.count, 
        rear_foot_stance_punches_right.count, 
        rear_foot_stance_strikes_right.count, 
        rear_foot_stance_thrusts_right.count, 
      ]
    ],
    [:x_stance,
      [
        x_stance_blocks_right.count, 
        x_stance_punches_right.count, 
        x_stance_strikes_right.count, 
        x_stance_thrusts_right.count, 
      ]
    ],
    [:one_leg,
      [

        one_leg_stance_blocks_right.count, 
        one_leg_stance_punches_right.count, 
        one_leg_stance_strikes_right.count, 
        one_leg_stance_thrusts_right.count, 
      ]
    ],
    [:diagonal_stance,
      [

        diagonal_stance_blocks_right.count, 
        diagonal_stance_punches_right.count, 
        diagonal_stance_strikes_right.count, 
        diagonal_stance_thrusts_right.count, 
      ]
    ],
    [:bending_ready_stance_b,
      [

        bending_ready_stance_b_blocks_right.count, 
        bending_ready_stance_b_punches_right.count, 
        bending_ready_stance_b_strikes_right.count, 
        bending_ready_stance_b_thrusts_right.count,
      ]
    ],
    [:bending_ready_stance_a,
      [
        bending_ready_stance_a_blocks_right.count,
        bending_ready_stance_a_punches_right.count, 
        bending_ready_stance_a_strikes_right.count, 
        bending_ready_stance_a_thrusts_right.count,
      ]
    ],
    [:parallel_stance,
      [
        parallel_stance_blocks_right.count, 
        parallel_stance_punches_right.count, 
        parallel_stance_strikes_right.count, 
        parallel_stance_thrusts_right.count, 
      ]
    ],
    [:vertical_stance,
      [
        vertical_stance_blocks_right.count,
        vertical_stance_punches_right.count,
        vertical_stance_strikes_right.count,
        vertical_stance_thrusts_right.count,
      ]
    ],
  ]

  dataset_right_not_w_l_s.each { |data|
    puts data[0], data[1]
  }
end

# -----------------------------------------------------------------------------
# Pattern
# -----------------------------------------------------------------------------

def techniques_by_pattern
  @chon_ji = Pattern.first(:name => 'chon-ji')
  @dan_gun = Pattern.first(:name => 'dan-gun')
  @do_san = Pattern.first(:name => 'do-san')
  @won_hyo = Pattern.first(:name => 'won-hyo')
  @yul_gok = Pattern.first(:name => 'yul-gok')
  @joong_gun = Pattern.first(:name => 'joong-gun')
  @toi_gae = Pattern.first(:name => 'toi-gae')
  @hwa_rang = Pattern.first(:name => 'hwa-rang')
  @choong_moo = Pattern.first(:name => 'choong-moo')
  @kwang_gae = Pattern.first(:name => 'kwang-gae')
  @po_eun = Pattern.first(:name => 'po-eun')
  @ge_baek = Pattern.first(:name => 'ge-baek')
  @eui_am = Pattern.first(:name => 'eui-am')
  @choong_jang = Pattern.first(:name => 'choong-jang')
  @juche = Pattern.first(:name => 'juche')

  @chon_ji_blocks = @chon_ji.movements.all & @all_blocks
  @chon_ji_punches = @chon_ji.movements.all & @all_punches
  @chon_ji_strikes = @chon_ji.movements.all & @all_strikes
  @chon_ji_thrusts = @chon_ji.movements.all & @all_thrusts

  @dan_gun_blocks = @dan_gun.movements.all & @all_blocks
  @dan_gun_punches = @dan_gun.movements.all & @all_punches
  @dan_gun_strikes = @dan_gun.movements.all & @all_strikes
  @dan_gun_thrusts = @dan_gun.movements.all & @all_thrusts

  @do_san_blocks = @do_san.movements.all & @all_blocks
  @do_san_punches = @do_san.movements.all & @all_punches
  @do_san_strikes = @do_san.movements.all & @all_strikes
  @do_san_thrusts = @do_san.movements.all & @all_thrusts

  @won_hyo_blocks = @won_hyo.movements.all & @all_blocks
  @won_hyo_punches = @won_hyo.movements.all & @all_punches
  @won_hyo_strikes = @won_hyo.movements.all & @all_strikes
  @won_hyo_thrusts = @won_hyo.movements.all & @all_thrusts

  @yul_gok_blocks = @yul_gok.movements.all & @all_blocks
  @yul_gok_punches = @yul_gok.movements.all & @all_punches
  @yul_gok_strikes = @yul_gok.movements.all & @all_strikes
  @yul_gok_thrusts = @yul_gok.movements.all & @all_thrusts

  @joong_gun_blocks = @joong_gun.movements.all & @all_blocks
  @joong_gun_punches = @joong_gun.movements.all & @all_punches
  @joong_gun_strikes = @joong_gun.movements.all & @all_strikes
  @joong_gun_thrusts = @joong_gun.movements.all & @all_thrusts

  @toi_gae_blocks = @toi_gae.movements.all & @all_blocks
  @toi_gae_punches = @toi_gae.movements.all & @all_punches
  @toi_gae_strikes = @toi_gae.movements.all & @all_strikes
  @toi_gae_thrusts = @toi_gae.movements.all & @all_thrusts

  @hwa_rang_blocks = @hwa_rang.movements.all & @all_blocks
  @hwa_rang_punches = @hwa_rang.movements.all & @all_punches
  @hwa_rang_strikes = @hwa_rang.movements.all & @all_strikes
  @hwa_rang_thrusts = @hwa_rang.movements.all & @all_thrusts

  @choong_moo_blocks = @choong_moo.movements.all & @all_blocks
  @choong_moo_punches = @choong_moo.movements.all & @all_punches
  @choong_moo_strikes = @choong_moo.movements.all & @all_strikes
  @choong_moo_thrusts = @choong_moo.movements.all & @all_thrusts

  @kwang_gae_blocks = @kwang_gae.movements.all & @all_blocks
  @kwang_gae_punches = @kwang_gae.movements.all & @all_punches
  @kwang_gae_strikes = @kwang_gae.movements.all & @all_strikes
  @kwang_gae_thrusts = @kwang_gae.movements.all & @all_thrusts

  @po_eun_blocks = @po_eun.movements.all & @all_blocks
  @po_eun_punches = @po_eun.movements.all & @all_punches
  @po_eun_strikes = @po_eun.movements.all & @all_strikes
  @po_eun_thrusts = @po_eun.movements.all & @all_thrusts

  @ge_baek_blocks = @ge_baek.movements.all & @all_blocks
  @ge_baek_punches = @ge_baek.movements.all & @all_punches
  @ge_baek_strikes = @ge_baek.movements.all & @all_strikes
  @ge_baek_thrusts = @ge_baek.movements.all & @all_thrusts

  @eui_am_blocks = @eui_am.movements.all & @all_blocks
  @eui_am_punches = @eui_am.movements.all & @all_punches
  @eui_am_strikes = @eui_am.movements.all & @all_strikes
  @eui_am_thrusts = @eui_am.movements.all & @all_thrusts

  @choong_jang_blocks = @choong_jang.movements.all & @all_blocks
  @choong_jang_punches = @choong_jang.movements.all & @all_punches
  @choong_jang_strikes = @choong_jang.movements.all & @all_strikes
  @choong_jang_thrusts = @choong_jang.movements.all & @all_thrusts

  @juche_blocks = @juche.movements.all & @all_blocks
  @juche_punches = @juche.movements.all & @all_punches
  @juche_strikes = @juche.movements.all & @all_strikes
  @juche_thrusts = @juche.movements.all & @all_thrusts



  chon_ji_blocks_left = @chon_ji_blocks & @left_techniques
  chon_ji_punches_left = @chon_ji_punches & @left_techniques
  chon_ji_strikes_left = @chon_ji_strikes & @left_techniques
  chon_ji_thrusts_left = @chon_ji_thrusts & @left_techniques

  dan_gun_blocks_left = @dan_gun_blocks & @left_techniques
  dan_gun_punches_left = @dan_gun_punches & @left_techniques
  dan_gun_strikes_left = @dan_gun_strikes & @left_techniques
  dan_gun_thrusts_left = @dan_gun_thrusts & @left_techniques

  do_san_blocks_left = @do_san_blocks & @left_techniques
  do_san_punches_left = @do_san_punches & @left_techniques
  do_san_strikes_left = @do_san_strikes & @left_techniques
  do_san_thrusts_left = @do_san_thrusts & @left_techniques

  won_hyo_blocks_left = @won_hyo_blocks & @left_techniques
  won_hyo_punches_left = @won_hyo_punches & @left_techniques
  won_hyo_strikes_left = @won_hyo_strikes & @left_techniques
  won_hyo_thrusts_left = @won_hyo_thrusts & @left_techniques

  yul_gok_blocks_left = @yul_gok_blocks & @left_techniques
  yul_gok_punches_left = @yul_gok_punches & @left_techniques
  yul_gok_strikes_left = @yul_gok_strikes & @left_techniques
  yul_gok_thrusts_left = @yul_gok_thrusts & @left_techniques

  joong_gun_blocks_left = @joong_gun_blocks & @left_techniques
  joong_gun_punches_left = @joong_gun_punches & @left_techniques
  joong_gun_strikes_left = @joong_gun_strikes & @left_techniques
  joong_gun_thrusts_left = @joong_gun_thrusts & @left_techniques

  toi_gae_blocks_left = @toi_gae_blocks & @left_techniques
  toi_gae_punches_left = @toi_gae_punches & @left_techniques
  toi_gae_strikes_left = @toi_gae_strikes & @left_techniques
  toi_gae_thrusts_left = @toi_gae_thrusts & @left_techniques

  hwa_rang_blocks_left = @hwa_rang_blocks & @left_techniques
  hwa_rang_punches_left = @hwa_rang_punches & @left_techniques
  hwa_rang_strikes_left = @hwa_rang_strikes & @left_techniques
  hwa_rang_thrusts_left = @hwa_rang_thrusts & @left_techniques

  choong_moo_blocks_left = @choong_moo_blocks & @left_techniques
  choong_moo_punches_left = @choong_moo_punches & @left_techniques
  choong_moo_strikes_left = @choong_moo_strikes & @left_techniques
  choong_moo_thrusts_left = @choong_moo_thrusts & @left_techniques

  kwang_gae_blocks_left = @kwang_gae_blocks & @left_techniques
  kwang_gae_punches_left = @kwang_gae_punches & @left_techniques
  kwang_gae_strikes_left = @kwang_gae_strikes & @left_techniques
  kwang_gae_thrusts_left = @kwang_gae_thrusts & @left_techniques

  po_eun_blocks_left = @po_eun_blocks & @left_techniques
  po_eun_punches_left = @po_eun_punches & @left_techniques
  po_eun_strikes_left = @po_eun_strikes & @left_techniques
  po_eun_thrusts_left = @po_eun_thrusts & @left_techniques

  ge_baek_blocks_left = @ge_baek_blocks & @left_techniques
  ge_baek_punches_left = @ge_baek_punches & @left_techniques
  ge_baek_strikes_left = @ge_baek_strikes & @left_techniques
  ge_baek_thrusts_left = @ge_baek_thrusts & @left_techniques

  eui_am_blocks_left = @eui_am_blocks & @left_techniques
  eui_am_punches_left = @eui_am_punches & @left_techniques
  eui_am_strikes_left = @eui_am_strikes & @left_techniques
  eui_am_thrusts_left = @eui_am_thrusts & @left_techniques

  choong_jang_blocks_left = @choong_jang_blocks & @left_techniques
  choong_jang_punches_left = @choong_jang_punches & @left_techniques
  choong_jang_strikes_left = @choong_jang_strikes & @left_techniques
  choong_jang_thrusts_left = @choong_jang_thrusts & @left_techniques

  juche_blocks_left = @juche_blocks & @left_techniques
  juche_punches_left = @juche_punches & @left_techniques
  juche_strikes_left = @juche_strikes & @left_techniques
  juche_thrusts_left = @juche_thrusts & @left_techniques





  chon_ji_blocks_right = @chon_ji_blocks & @right_techniques
  chon_ji_punches_right = @chon_ji_punches & @right_techniques
  chon_ji_strikes_right = @chon_ji_strikes & @right_techniques
  chon_ji_thrusts_right = @chon_ji_thrusts & @right_techniques

  dan_gun_blocks_right = @dan_gun_blocks & @right_techniques
  dan_gun_punches_right = @dan_gun_punches & @right_techniques
  dan_gun_strikes_right = @dan_gun_strikes & @right_techniques
  dan_gun_thrusts_right = @dan_gun_thrusts & @right_techniques

  do_san_blocks_right = @do_san_blocks & @right_techniques
  do_san_punches_right = @do_san_punches & @right_techniques
  do_san_strikes_right = @do_san_strikes & @right_techniques
  do_san_thrusts_right = @do_san_thrusts & @right_techniques

  won_hyo_blocks_right = @won_hyo_blocks & @right_techniques
  won_hyo_punches_right = @won_hyo_punches & @right_techniques
  won_hyo_strikes_right = @won_hyo_strikes & @right_techniques
  won_hyo_thrusts_right = @won_hyo_thrusts & @right_techniques

  yul_gok_blocks_right = @yul_gok_blocks & @right_techniques
  yul_gok_punches_right = @yul_gok_punches & @right_techniques
  yul_gok_strikes_right = @yul_gok_strikes & @right_techniques
  yul_gok_thrusts_right = @yul_gok_thrusts & @right_techniques

  joong_gun_blocks_right = @joong_gun_blocks & @right_techniques
  joong_gun_punches_right = @joong_gun_punches & @right_techniques
  joong_gun_strikes_right = @joong_gun_strikes & @right_techniques
  joong_gun_thrusts_right = @joong_gun_thrusts & @right_techniques

  toi_gae_blocks_right = @toi_gae_blocks & @right_techniques
  toi_gae_punches_right = @toi_gae_punches & @right_techniques
  toi_gae_strikes_right = @toi_gae_strikes & @right_techniques
  toi_gae_thrusts_right = @toi_gae_thrusts & @right_techniques

  hwa_rang_blocks_right = @hwa_rang_blocks & @right_techniques
  hwa_rang_punches_right = @hwa_rang_punches & @right_techniques
  hwa_rang_strikes_right = @hwa_rang_strikes & @right_techniques
  hwa_rang_thrusts_right = @hwa_rang_thrusts & @right_techniques

  choong_moo_blocks_right = @choong_moo_blocks & @right_techniques
  choong_moo_punches_right = @choong_moo_punches & @right_techniques
  choong_moo_strikes_right = @choong_moo_strikes & @right_techniques
  choong_moo_thrusts_right = @choong_moo_thrusts & @right_techniques

  kwang_gae_blocks_right = @kwang_gae_blocks & @right_techniques
  kwang_gae_punches_right = @kwang_gae_punches & @right_techniques
  kwang_gae_strikes_right = @kwang_gae_strikes & @right_techniques
  kwang_gae_thrusts_right = @kwang_gae_thrusts & @right_techniques

  po_eun_blocks_right = @po_eun_blocks & @right_techniques
  po_eun_punches_right = @po_eun_punches & @right_techniques
  po_eun_strikes_right = @po_eun_strikes & @right_techniques
  po_eun_thrusts_right = @po_eun_thrusts & @right_techniques

  ge_baek_blocks_right = @ge_baek_blocks & @right_techniques
  ge_baek_punches_right = @ge_baek_punches & @right_techniques
  ge_baek_strikes_right = @ge_baek_strikes & @right_techniques
  ge_baek_thrusts_right = @ge_baek_thrusts & @right_techniques

  eui_am_blocks_right = @eui_am_blocks & @right_techniques
  eui_am_punches_right = @eui_am_punches & @right_techniques
  eui_am_strikes_right = @eui_am_strikes & @right_techniques
  eui_am_thrusts_right = @eui_am_thrusts & @right_techniques

  choong_jang_blocks_right = @choong_jang_blocks & @right_techniques
  choong_jang_punches_right = @choong_jang_punches & @right_techniques
  choong_jang_strikes_right = @choong_jang_strikes & @right_techniques
  choong_jang_thrusts_right = @choong_jang_thrusts & @right_techniques

  juche_blocks_right = @juche_blocks & @right_techniques
  juche_punches_right = @juche_punches & @right_techniques
  juche_strikes_right = @juche_strikes & @right_techniques
  juche_thrusts_right = @juche_thrusts & @right_techniques



  puts "---------------------------------------"
  puts "Techniques by patterns"

  dataset_all = [
    [:chon_ji,
      [
        @chon_ji_blocks.count,
        @chon_ji_punches.count,
        @chon_ji_strikes.count,
        @chon_ji_thrusts.count,
      ]
    ],
    [:dan_gun,
      [
        @dan_gun_blocks.count,
        @dan_gun_punches.count,
        @dan_gun_strikes.count,
        @dan_gun_thrusts.count,
      ]
    ],
    [:do_san,
      [
        @do_san_blocks.count,
        @do_san_punches.count,
        @do_san_strikes.count,
        @do_san_thrusts.count,
      ]
    ],
    [:won_hyo,
      [
        @won_hyo_blocks.count,
        @won_hyo_punches.count,
        @won_hyo_strikes.count,
        @won_hyo_thrusts.count,
      ]
    ],
    [:yul_gok,
      [
        @yul_gok_blocks.count,
        @yul_gok_punches.count,
        @yul_gok_strikes.count,
        @yul_gok_thrusts.count,
      ]
    ],
    [:joong_gun,
      [
        @joong_gun_blocks.count,
        @joong_gun_punches.count,
        @joong_gun_strikes.count,
        @joong_gun_thrusts.count,
      ]
    ],
    [:toi_gae,
      [
        @toi_gae_blocks.count,
        @toi_gae_punches.count,
        @toi_gae_strikes.count,
        @toi_gae_thrusts.count,
      ]
    ],
    [:hwa_rang,
      [
        @hwa_rang_blocks.count,
        @hwa_rang_punches.count,
        @hwa_rang_strikes.count,
        @hwa_rang_thrusts.count,
      ]
    ],
    [:choong_moo,
      [
        @choong_moo_blocks.count,
        @choong_moo_punches.count,
        @choong_moo_strikes.count,
        @choong_moo_thrusts.count,
      ]
    ],
    [:kwang_gae,
      [
        @kwang_gae_blocks.count,
        @kwang_gae_punches.count,
        @kwang_gae_strikes.count,
        @kwang_gae_thrusts.count,
      ]
    ],
    [:po_eun,
      [
        @po_eun_blocks.count,
        @po_eun_punches.count,
        @po_eun_strikes.count,
        @po_eun_thrusts.count,
      ]
    ],
    [:ge_baek,
      [
        @ge_baek_blocks.count,
        @ge_baek_punches.count,
        @ge_baek_strikes.count,
        @ge_baek_thrusts.count,
      ]
    ],
    [:eui_am,
      [
        @eui_am_blocks.count,
        @eui_am_punches.count,
        @eui_am_strikes.count,
        @eui_am_thrusts.count,
      ]
    ],
    [:choong_jang,
      [
        @choong_jang_blocks.count,
        @choong_jang_punches.count,
        @choong_jang_strikes.count,
        @choong_jang_thrusts.count,
      ]
    ],
    [:juche,
      [
        @juche_blocks.count,
        @juche_punches.count,
        @juche_strikes.count,
        @juche_thrusts.count,
      ]
    ]
  ]

  dataset_all.each { |data|
    puts data[0], data[1]
  }
  


  puts "---------------------------------------"
  puts "Left techniques by patterns"

  dataset_all_left = [
    [:chon_ji,
      [
        chon_ji_blocks_left.count,
        chon_ji_punches_left.count,
        chon_ji_strikes_left.count,
        chon_ji_thrusts_left.count,
      ]
    ],
    [:dan_gun,
      [
        dan_gun_blocks_left.count,
        dan_gun_punches_left.count,
        dan_gun_strikes_left.count,
        dan_gun_thrusts_left.count,
      ]
    ],
    [:do_san,
      [
        do_san_blocks_left.count,
        do_san_punches_left.count,
        do_san_strikes_left.count,
        do_san_thrusts_left.count,
      ]
    ],
    [:won_hyo,
      [
        won_hyo_blocks_left.count,
        won_hyo_punches_left.count,
        won_hyo_strikes_left.count,
        won_hyo_thrusts_left.count,
      ]
    ],
    [:yul_gok,
      [
        yul_gok_blocks_left.count,
        yul_gok_punches_left.count,
        yul_gok_strikes_left.count,
        yul_gok_thrusts_left.count,
      ]
    ],
    [:joong_gun,
      [
        joong_gun_blocks_left.count,
        joong_gun_punches_left.count,
        joong_gun_strikes_left.count,
        joong_gun_thrusts_left.count,
      ]
    ],
    [:toi_gae,
      [
        toi_gae_blocks_left.count,
        toi_gae_punches_left.count,
        toi_gae_strikes_left.count,
        toi_gae_thrusts_left.count,
      ]
    ],
    [:hwa_rang,
      [
        hwa_rang_blocks_left.count,
        hwa_rang_punches_left.count,
        hwa_rang_strikes_left.count,
        hwa_rang_thrusts_left.count,
      ]
    ],
    [:choong_moo,
      [
        choong_moo_blocks_left.count,
        choong_moo_punches_left.count,
        choong_moo_strikes_left.count,
        choong_moo_thrusts_left.count,
      ]
    ],
    [:kwang_gae,
      [
        kwang_gae_blocks_left.count,
        kwang_gae_punches_left.count,
        kwang_gae_strikes_left.count,
        kwang_gae_thrusts_left.count,
      ]
    ],
    [:po_eun,
      [
        po_eun_blocks_left.count,
        po_eun_punches_left.count,
        po_eun_strikes_left.count,
        po_eun_thrusts_left.count,
      ]
    ],
    [:ge_baek,
      [
        ge_baek_blocks_left.count,
        ge_baek_punches_left.count,
        ge_baek_strikes_left.count,
        ge_baek_thrusts_left.count,
      ]
    ],
    [:eui_am,
      [
        eui_am_blocks_left.count,
        eui_am_punches_left.count,
        eui_am_strikes_left.count,
        eui_am_thrusts_left.count,
      ]
    ],
    [:choong_jang,
      [
        choong_jang_blocks_left.count,
        choong_jang_punches_left.count,
        choong_jang_strikes_left.count,
        choong_jang_thrusts_left.count,
      ]
    ],
    [:juche,
      [
        juche_blocks_left.count,
        juche_punches_left.count,
        juche_strikes_left.count,
        juche_thrusts_left.count,
      ]
    ]
  ]

  dataset_all_left.each { |data|
    puts data[0], data[1]
  }
  




  puts "---------------------------------------"
  puts "Right techniques by patterns"

  dataset_all_right = [
    [:chon_ji,
      [
        chon_ji_blocks_right.count,
        chon_ji_punches_right.count,
        chon_ji_strikes_right.count,
        chon_ji_thrusts_right.count,
      ]
    ],
    [:dan_gun,
      [
        dan_gun_blocks_right.count,
        dan_gun_punches_right.count,
        dan_gun_strikes_right.count,
        dan_gun_thrusts_right.count,
      ]
    ],
    [:do_san,
      [
        do_san_blocks_right.count,
        do_san_punches_right.count,
        do_san_strikes_right.count,
        do_san_thrusts_right.count,
      ]
    ],
    [:won_hyo,
      [
        won_hyo_blocks_right.count,
        won_hyo_punches_right.count,
        won_hyo_strikes_right.count,
        won_hyo_thrusts_right.count,
      ]
    ],
    [:yul_gok,
      [
        yul_gok_blocks_right.count,
        yul_gok_punches_right.count,
        yul_gok_strikes_right.count,
        yul_gok_thrusts_right.count,
      ]
    ],
    [:joong_gun,
      [
        joong_gun_blocks_right.count,
        joong_gun_punches_right.count,
        joong_gun_strikes_right.count,
        joong_gun_thrusts_right.count,
      ]
    ],
    [:toi_gae,
      [
        toi_gae_blocks_right.count,
        toi_gae_punches_right.count,
        toi_gae_strikes_right.count,
        toi_gae_thrusts_right.count,
      ]
    ],
    [:hwa_rang,
      [
        hwa_rang_blocks_right.count,
        hwa_rang_punches_right.count,
        hwa_rang_strikes_right.count,
        hwa_rang_thrusts_right.count,
      ]
    ],
    [:choong_moo,
      [
        choong_moo_blocks_right.count,
        choong_moo_punches_right.count,
        choong_moo_strikes_right.count,
        choong_moo_thrusts_right.count,
      ]
    ],
    [:kwang_gae,
      [
        kwang_gae_blocks_right.count,
        kwang_gae_punches_right.count,
        kwang_gae_strikes_right.count,
        kwang_gae_thrusts_right.count,
      ]
    ],
    [:po_eun,
      [
        po_eun_blocks_right.count,
        po_eun_punches_right.count,
        po_eun_strikes_right.count,
        po_eun_thrusts_right.count,
      ]
    ],
    [:ge_baek,
      [
        ge_baek_blocks_right.count,
        ge_baek_punches_right.count,
        ge_baek_strikes_right.count,
        ge_baek_thrusts_right.count,
      ]
    ],
    [:eui_am,
      [
        eui_am_blocks_right.count,
        eui_am_punches_right.count,
        eui_am_strikes_right.count,
        eui_am_thrusts_right.count,
      ]
    ],
    [:choong_jang,
      [
        choong_jang_blocks_right.count,
        choong_jang_punches_right.count,
        choong_jang_strikes_right.count,
        choong_jang_thrusts_right.count,
      ]
    ],
    [:juche,
      [
        juche_blocks_right.count,
        juche_punches_right.count,
        juche_strikes_right.count,
        juche_thrusts_right.count,
      ]
    ]
  ]

  dataset_all_right.each { |data|
    puts data[0], data[1]
  }
  




  puts "---------------------------------------"
  puts "Techniques by color belt patterns"

  dataset_color = [
    [:chon_ji,
      [
        @chon_ji_blocks.count,
        @chon_ji_punches.count,
        @chon_ji_strikes.count,
        @chon_ji_thrusts.count,
      ]
    ],
    [:dan_gun,
      [
        @dan_gun_blocks.count,
        @dan_gun_punches.count,
        @dan_gun_strikes.count,
        @dan_gun_thrusts.count,
      ]
    ],
    [:do_san,
      [
        @do_san_blocks.count,
        @do_san_punches.count,
        @do_san_strikes.count,
        @do_san_thrusts.count,
      ]
    ],
    [:won_hyo,
      [
        @won_hyo_blocks.count,
        @won_hyo_punches.count,
        @won_hyo_strikes.count,
        @won_hyo_thrusts.count,
      ]
    ],
    [:yul_gok,
      [
        @yul_gok_blocks.count,
        @yul_gok_punches.count,
        @yul_gok_strikes.count,
        @yul_gok_thrusts.count,
      ]
    ],
    [:joong_gun,
      [
        @joong_gun_blocks.count,
        @joong_gun_punches.count,
        @joong_gun_strikes.count,
        @joong_gun_thrusts.count,
      ]
    ],
    [:toi_gae,
      [
        @toi_gae_blocks.count,
        @toi_gae_punches.count,
        @toi_gae_strikes.count,
        @toi_gae_thrusts.count,
      ]
    ],
    [:hwa_rang,
      [
        @hwa_rang_blocks.count,
        @hwa_rang_punches.count,
        @hwa_rang_strikes.count,
        @hwa_rang_thrusts.count,
      ]
    ],
    [:choong_moo,
      [
        @choong_moo_blocks.count,
        @choong_moo_punches.count,
        @choong_moo_strikes.count,
        @choong_moo_thrusts.count,
      ]
    ]
  ]

  dataset_color.each { |data|
    puts data[0], data[1]
  }
  


  puts "---------------------------------------"
  puts "Left techniques by color belt patterns"

  dataset_color_left = [
    [:chon_ji,
      [
        chon_ji_blocks_left.count,
        chon_ji_punches_left.count,
        chon_ji_strikes_left.count,
        chon_ji_thrusts_left.count,
      ]
    ],
    [:dan_gun,
      [
        dan_gun_blocks_left.count,
        dan_gun_punches_left.count,
        dan_gun_strikes_left.count,
        dan_gun_thrusts_left.count,
      ]
    ],
    [:do_san,
      [
        do_san_blocks_left.count,
        do_san_punches_left.count,
        do_san_strikes_left.count,
        do_san_thrusts_left.count,
      ]
    ],
    [:won_hyo,
      [
        won_hyo_blocks_left.count,
        won_hyo_punches_left.count,
        won_hyo_strikes_left.count,
        won_hyo_thrusts_left.count,
      ]
    ],
    [:yul_gok,
      [
        yul_gok_blocks_left.count,
        yul_gok_punches_left.count,
        yul_gok_strikes_left.count,
        yul_gok_thrusts_left.count,
      ]
    ],
    [:joong_gun,
      [
        joong_gun_blocks_left.count,
        joong_gun_punches_left.count,
        joong_gun_strikes_left.count,
        joong_gun_thrusts_left.count,
      ]
    ],
    [:toi_gae,
      [
        toi_gae_blocks_left.count,
        toi_gae_punches_left.count,
        toi_gae_strikes_left.count,
        toi_gae_thrusts_left.count,
      ]
    ],
    [:hwa_rang,
      [
        hwa_rang_blocks_left.count,
        hwa_rang_punches_left.count,
        hwa_rang_strikes_left.count,
        hwa_rang_thrusts_left.count,
      ]
    ],
    [:choong_moo,
      [
        choong_moo_blocks_left.count,
        choong_moo_punches_left.count,
        choong_moo_strikes_left.count,
        choong_moo_thrusts_left.count,
      ]
    ]
  ]

  dataset_color_left.each { |data|
    puts data[0], data[1]
  }
  



  puts "---------------------------------------"
  puts "Right techniques by color belt patterns"

  dataset_color_right = [
    [:chon_ji,
      [
        chon_ji_blocks_right.count,
        chon_ji_punches_right.count,
        chon_ji_strikes_right.count,
        chon_ji_thrusts_right.count,
      ]
    ],
    [:dan_gun,
      [
        dan_gun_blocks_right.count,
        dan_gun_punches_right.count,
        dan_gun_strikes_right.count,
        dan_gun_thrusts_right.count,
      ]
    ],
    [:do_san,
      [
        do_san_blocks_right.count,
        do_san_punches_right.count,
        do_san_strikes_right.count,
        do_san_thrusts_right.count,
      ]
    ],
    [:won_hyo,
      [
        won_hyo_blocks_right.count,
        won_hyo_punches_right.count,
        won_hyo_strikes_right.count,
        won_hyo_thrusts_right.count,
      ]
    ],
    [:yul_gok,
      [
        yul_gok_blocks_right.count,
        yul_gok_punches_right.count,
        yul_gok_strikes_right.count,
        yul_gok_thrusts_right.count,
      ]
    ],
    [:joong_gun,
      [
        joong_gun_blocks_right.count,
        joong_gun_punches_right.count,
        joong_gun_strikes_right.count,
        joong_gun_thrusts_right.count,
      ]
    ],
    [:toi_gae,
      [
        toi_gae_blocks_right.count,
        toi_gae_punches_right.count,
        toi_gae_strikes_right.count,
        toi_gae_thrusts_right.count,
      ]
    ],
    [:hwa_rang,
      [
        hwa_rang_blocks_right.count,
        hwa_rang_punches_right.count,
        hwa_rang_strikes_right.count,
        hwa_rang_thrusts_right.count,
      ]
    ],
    [:choong_moo,
      [
        choong_moo_blocks_right.count,
        choong_moo_punches_right.count,
        choong_moo_strikes_right.count,
        choong_moo_thrusts_right.count,
      ]
    ]
  ]

  dataset_color_right.each { |data|
    puts data[0], data[1]
  }
  




  puts "---------------------------------------"
  puts "Techniques by black belt patterns"

  dataset_black = [
    [:kwang_gae,
      [
        @kwang_gae_blocks.count,
        @kwang_gae_punches.count,
        @kwang_gae_strikes.count,
        @kwang_gae_thrusts.count,
      ]
    ],
    [:po_eun,
      [
        @po_eun_blocks.count,
        @po_eun_punches.count,
        @po_eun_strikes.count,
        @po_eun_thrusts.count,
      ]
    ],
    [:ge_baek,
      [
        @ge_baek_blocks.count,
        @ge_baek_punches.count,
        @ge_baek_strikes.count,
        @ge_baek_thrusts.count,
      ]
    ],
    [:eui_am,
      [
        @eui_am_blocks.count,
        @eui_am_punches.count,
        @eui_am_strikes.count,
        @eui_am_thrusts.count,
      ]
    ],
    [:choong_jang,
      [
        @choong_jang_blocks.count,
        @choong_jang_punches.count,
        @choong_jang_strikes.count,
        @choong_jang_thrusts.count,
      ]
    ],
    [:juche,
      [
        @juche_blocks.count,
        @juche_punches.count,
        @juche_strikes.count,
        @juche_thrusts.count,
      ]
    ]
  ]

  dataset_black.each { |data|
   puts  data[0], data[1]
  }
  



  puts "---------------------------------------"
  puts "Left techniques by black belt patterns"

  dataset_black_left = [
    [:kwang_gae,
      [
        kwang_gae_blocks_left.count,
        kwang_gae_punches_left.count,
        kwang_gae_strikes_left.count,
        kwang_gae_thrusts_left.count,
      ]
    ],
    [:po_eun,
      [
        po_eun_blocks_left.count,
        po_eun_punches_left.count,
        po_eun_strikes_left.count,
        po_eun_thrusts_left.count,
      ]
    ],
    [:ge_baek,
      [
        ge_baek_blocks_left.count,
        ge_baek_punches_left.count,
        ge_baek_strikes_left.count,
        ge_baek_thrusts_left.count,
      ]
    ],
    [:eui_am,
      [
        eui_am_blocks_left.count,
        eui_am_punches_left.count,
        eui_am_strikes_left.count,
        eui_am_thrusts_left.count,
      ]
    ],
    [:choong_jang,
      [
        choong_jang_blocks_left.count,
        choong_jang_punches_left.count,
        choong_jang_strikes_left.count,
        choong_jang_thrusts_left.count,
      ]
    ],
    [:juche,
      [
        juche_blocks_left.count,
        juche_punches_left.count,
        juche_strikes_left.count,
        juche_thrusts_left.count,
      ]
    ]
  ]

  dataset_black_left.each { |data|
    puts data[0], data[1]
  }
  




  puts "---------------------------------------"
  puts "Right techniques by black belt patterns"

  dataset_black_right = [
    [:kwang_gae,
      [
        kwang_gae_blocks_right.count,
        kwang_gae_punches_right.count,
        kwang_gae_strikes_right.count,
        kwang_gae_thrusts_right.count,
      ]
    ],
    [:po_eun,
      [
        po_eun_blocks_right.count,
        po_eun_punches_right.count,
        po_eun_strikes_right.count,
        po_eun_thrusts_right.count,
      ]
    ],
    [:ge_baek,
      [
        ge_baek_blocks_right.count,
        ge_baek_punches_right.count,
        ge_baek_strikes_right.count,
        ge_baek_thrusts_right.count,
      ]
    ],
    [:eui_am,
      [
        eui_am_blocks_right.count,
        eui_am_punches_right.count,
        eui_am_strikes_right.count,
        eui_am_thrusts_right.count,
      ]
    ],
    [:choong_jang,
      [
        choong_jang_blocks_right.count,
        choong_jang_punches_right.count,
        choong_jang_strikes_right.count,
        choong_jang_thrusts_right.count,
      ]
    ],
    [:juche,
      [
        juche_blocks_right.count,
        juche_punches_right.count,
        juche_strikes_right.count,
        juche_thrusts_right.count,
      ]
    ]
  ]

  dataset_black_right.each { |data|
    puts data[0], data[1]
  }
end


def techniques_by_motion_type
  @normal_motion = Tag.first(:name => 'normal_motion')
  @flying_motion = Tag.first(:name => 'flying_motion')
  @fast_motion = Tag.first(:name => 'fast_motion')
  @slow_motion = Tag.first(:name => 'slow_motion')
  @sliding_motion = Tag.first(:name => 'sliding_motion')
  @stamping_motion = Tag.first(:name => 'stamping_motion')
  @continuous_motion = Tag.first(:name => 'continuous_motion')
  @jumping_motion = Tag.first(:name => 'jumping_motion')
  @consecutive_motion = Tag.first(:name => 'consecutive_motion')
  @connecting_motion = Tag.first(:name => 'connecting_motion')
  @skipping_motion = Tag.first(:name => 'skipping_motion')
  @dodging_motion = Tag.first(:name => 'dodging_motion')
  @double_stepping_motion = Tag.first(:name => 'double_stepping_motion')
  @shifting_motion = Tag.first(:name => 'shifting_motion')

  @normal_motion_blocks = @normal_motion.movements.all & @all_blocks unless nil
  @flying_motion_blocks = @flying_motion.movements.all & @all_blocks unless nil
  @fast_motion_blocks = @fast_motion.movements.all & @all_blocks unless nil
  @slow_motion_blocks = @slow_motion.movements.all & @all_blocks unless nil
  @sliding_motion_blocks = @sliding_motion.movements.all & @all_blocks unless nil
  @stamping_motion_blocks = @stamping_motion.movements.all & @all_blocks unless nil
  @continuous_motion_blocks = @continuous_motion.movements.all & @all_blocks unless nil
  @jumping_motion_blocks = @jumping_motion.movements.all & @all_blocks unless nil
  @consecutive_motion_blocks = @consecutive_motion.movements.all & @all_blocks unless nil
  @connecting_motion_blocks = @connecting_motion.movements.all & @all_blocks unless nil
  @skipping_motion_blocks = @skipping_motion.movements.all & @all_blocks unless nil
  @dodging_motion_blocks = @dodging_motion.movements.all & @all_blocks unless nil
  @double_stepping_motion_blocks = @double_stepping_motion.movements.all & @all_blocks unless nil
  @shifting_motion_blocks = @shifting_motion.movements.all & @all_blocks unless nil

  @normal_motion_punches = @normal_motion.movements.all & @all_punches unless nil
  @flying_motion_punches = @flying_motion.movements.all & @all_punches unless nil
  @fast_motion_punches =  @fast_motion.movements.all & @all_punches unless nil
  @slow_motion_punches = @slow_motion.movements.all & @all_punches unless nil
  @sliding_motion_punches = @sliding_motion.movements.all & @all_punches unless nil
  @stamping_motion_punches = @stamping_motion.movements.all & @all_punches unless nil
  @continuous_motion_punches = @continuous_motion.movements.all & @all_punches unless nil
  @jumping_motion_punches = @jumping_motion.movements.all & @all_punches unless nil
  @consecutive_motion_punches = @consecutive_motion.movements.all & @all_punches unless nil
  @connecting_motion_punches = @connecting_motion.movements.all & @all_punches unless nil
  @skipping_motion_punches = @skipping_motion.movements.all & @all_punches unless nil
  @dodging_motion_punches = @dodging_motion.movements.all & @all_punches unless nil
  @double_stepping_motion_punches = @double_stepping_motion.movements.all & @all_punches unless nil
  @shifting_motion_punches = @shifting_motion.movements.all & @all_punches unless nil

  @normal_motion_strikes = @normal_motion.movements.all & @all_strikes unless nil
  @flying_motion_strikes = @flying_motion.movements.all & @all_strikes unless nil
  @fast_motion_strikes = @fast_motion.movements.all & @all_strikes unless nil
  @slow_motion_strikes = @slow_motion.movements.all & @all_strikes unless nil
  @sliding_motion_strikes = @sliding_motion.movements.all & @all_strikes unless nil
  @stamping_motion_strikes = @stamping_motion.movements.all & @all_strikes unless nil
  @continuous_motion_strikes = @continuous_motion.movements.all & @all_strikes unless nil
  @jumping_motion_strikes = @jumping_motion.movements.all & @all_strikes unless nil
  @consecutive_motion_strikes = @consecutive_motion.movements.all & @all_strikes unless nil
  @connecting_motion_strikes = @connecting_motion.movements.all & @all_strikes unless nil
  @skipping_motion_strikes = @skipping_motion.movements.all & @all_strikes unless nil
  @dodging_motion_strikes = @dodging_motion.movements.all & @all_strikes unless nil
  @double_stepping_motion_strikes = @double_stepping_motion.movements.all & @all_strikes unless nil
  @shifting_motion_strikes = @shifting_motion.movements.all & @all_strikes unless nil

  @normal_motion_thrusts = @normal_motion.movements.all & @all_thrusts unless nil
  @flying_motion_thrusts = @flying_motion.movements.all & @all_thrusts unless nil
  @fast_motion_thrusts = @fast_motion.movements.all & @all_thrusts unless nil
  @slow_motion_thrusts = @slow_motion.movements.all & @all_thrusts unless nil
  @sliding_motion_thrusts = @sliding_motion.movements.all & @all_thrusts unless nil
  @stamping_motion_thrusts = @stamping_motion.movements.all & @all_thrusts unless nil
  @continuous_motion_thrusts = @continuous_motion.movements.all & @all_thrusts unless nil
  @jumping_motion_thrusts = @jumping_motion.movements.all & @all_thrusts unless nil
  @consecutive_motion_thrusts = @consecutive_motion.movements.all & @all_thrusts unless nil
  @connecting_motion_thrusts = @connecting_motion.movements.all & @all_thrusts unless nil
  @skipping_motion_thrusts = @skipping_motion.movements.all & @all_thrusts unless nil
  @dodging_motion_thrusts = @dodging_motion.movements.all & @all_thrusts unless nil
  @double_stepping_motion_thrusts = @double_stepping_motion.movements.all & @all_thrusts unless nil
  @shifting_motion_thrusts = @shifting_motion.movements.all & @all_thrusts unless nil

  @normal_motion_blocks_left = @normal_motion_blocks & @left_techniques unless nil
  @flying_motion_blocks_left = @flying_motion_blocks & @left_techniques unless nil
  @fast_motion_blocks_left = @fast_motion_blocks & @left_techniques unless nil
  @slow_motion_blocks_left = @slow_motion_blocks & @left_techniques unless nil
  @sliding_motion_blocks_left = @sliding_motion_blocks & @left_techniques unless nil
  @stamping_motion_blocks_left = @stamping_motion_blocks & @left_techniques unless nil
  @continuous_motion_blocks_left = @continuous_motion_blocks & @left_techniques unless nil
  @jumping_motion_blocks_left = @jumping_motion_blocks & @left_techniques unless nil
  @consecutive_motion_blocks_left = @consecutive_motion_blocks & @left_techniques unless nil
  @connecting_motion_blocks_left = @connecting_motion_blocks & @left_techniques unless nil
  @skipping_motion_blocks_left = @skipping_motion_blocks & @left_techniques unless nil
  @dodging_motion_blocks_left = @dodging_motion_blocks & @left_techniques unless nil
  @double_stepping_motion_blocks_left = @double_stepping_motion_blocks & @left_techniques unless nil
  @shifting_motion_blocks_left = @shifting_motion_blocks & @left_techniques unless nil

  @normal_motion_punches_left = @normal_motion_punches & @left_techniques unless nil
  @flying_motion_punches_left = @flying_motion_punches & @left_techniques unless nil
  @fast_motion_punches_left = @fast_motion_punches & @left_techniques unless nil
  @slow_motion_punches_left = @slow_motion_punches & @left_techniques unless nil
  @sliding_motion_punches_left = @sliding_motion_punches & @left_techniques unless nil
  @stamping_motion_punches_left = @stamping_motion_punches & @left_techniques unless nil
  @continuous_motion_punches_left = @continuous_motion_punches & @left_techniques unless nil
  @jumping_motion_punches_left = @jumping_motion_punches & @left_techniques unless nil
  @consecutive_motion_punches_left = @consecutive_motion_punches & @left_techniques unless nil
  @connecting_motion_punches_left = @connecting_motion_punches & @left_techniques unless nil
  @skipping_motion_punches_left = @skipping_motion_punches & @left_techniques unless nil
  @dodging_motion_punches_left = @dodging_motion_punches & @left_techniques unless nil
  @double_stepping_motion_punches_left = @double_stepping_motion_punches & @left_techniques unless nil
  @shifting_motion_punches_left = @shifting_motion_punches & @left_techniques unless nil

  @normal_motion_strikes_left = @normal_motion_strikes & @left_techniques unless nil
  @flying_motion_strikes_left = @flying_motion_strikes & @left_techniques unless nil
  @fast_motion_strikes_left = @fast_motion_strikes & @left_techniques unless nil
  @slow_motion_strikes_left = @slow_motion_strikes & @left_techniques unless nil
  @sliding_motion_strikes_left = @sliding_motion_strikes & @left_techniques unless nil
  @stamping_motion_strikes_left = @stamping_motion_strikes & @left_techniques unless nil
  @continuous_motion_strikes_left = @continuous_motion_strikes & @left_techniques unless nil
  @jumping_motion_strikes_left = @jumping_motion_strikes & @left_techniques unless nil
  @consecutive_motion_strikes_left = @consecutive_motion_strikes & @left_techniques unless nil
  @connecting_motion_strikes_left = @connecting_motion_strikes & @left_techniques unless nil
  @skipping_motion_strikes_left = @skipping_motion_strikes & @left_techniques unless nil
  @dodging_motion_strikes_left = @dodging_motion_strikes & @left_techniques unless nil
  @double_stepping_motion_strikes_left = @double_stepping_motion_strikes & @left_techniques unless nil
  @shifting_motion_strikes_left = @shifting_motion_strikes & @left_techniques unless nil

  @normal_motion_thrusts_left = @normal_motion_thrusts & @left_techniques unless nil
  @flying_motion_thrusts_left = @flying_motion_thrusts & @left_techniques unless nil
  @fast_motion_thrusts_left = @fast_motion_thrusts & @left_techniques unless nil
  @slow_motion_thrusts_left = @slow_motion_thrusts & @left_techniques unless nil
  @sliding_motion_thrusts_left = @sliding_motion_thrusts & @left_techniques unless nil
  @stamping_motion_thrusts_left = @stamping_motion_thrusts & @left_techniques unless nil
  @continuous_motion_thrusts_left = @continuous_motion_thrusts & @left_techniques unless nil
  @jumping_motion_thrusts_left = @jumping_motion_thrusts & @left_techniques unless nil
  @consecutive_motion_thrusts_left = @consecutive_motion_thrusts & @left_techniques unless nil
  @connecting_motion_thrusts_left = @connecting_motion_thrusts & @left_techniques unless nil
  @skipping_motion_thrusts_left = @skipping_motion_thrusts & @left_techniques unless nil
  @dodging_motion_thrusts_left = @dodging_motion_thrusts & @left_techniques unless nil
  @double_stepping_motion_thrusts_left = @double_stepping_motion_thrusts & @left_techniques unless nil
  @shifting_motion_thrusts_left = @shifting_motion_thrusts & @left_techniques unless nil

  @normal_motion_blocks_right = @normal_motion_blocks & @right_techniques unless nil
  @flying_motion_blocks_right = @flying_motion_blocks & @right_techniques unless nil
  @fast_motion_blocks_right = @fast_motion_blocks & @right_techniques unless nil
  @slow_motion_blocks_right = @slow_motion_blocks & @right_techniques unless nil
  @sliding_motion_blocks_right = @sliding_motion_blocks & @right_techniques unless nil
  @stamping_motion_blocks_right = @stamping_motion_blocks & @right_techniques unless nil
  @continuous_motion_blocks_right = @continuous_motion_blocks & @right_techniques unless nil
  @jumping_motion_blocks_right = @jumping_motion_blocks & @right_techniques unless nil
  @consecutive_motion_blocks_right = @consecutive_motion_blocks & @right_techniques unless nil
  @connecting_motion_blocks_right = @connecting_motion_blocks & @right_techniques unless nil
  @skipping_motion_blocks_right = @skipping_motion_blocks & @right_techniques unless nil
  @dodging_motion_blocks_right = @dodging_motion_blocks & @right_techniques unless nil
  @double_stepping_motion_blocks_right = @double_stepping_motion_blocks & @right_techniques unless nil
  @shifting_motion_blocks_right = @shifting_motion_blocks & @right_techniques unless nil

  @normal_motion_punches_right = @normal_motion_punches & @right_techniques unless nil
  @flying_motion_punches_right = @flying_motion_punches & @right_techniques unless nil
  @fast_motion_punches_right = @fast_motion_punches & @right_techniques unless nil
  @slow_motion_punches_right = @slow_motion_punches & @right_techniques unless nil
  @sliding_motion_punches_right = @sliding_motion_punches & @right_techniques unless nil
  @stamping_motion_punches_right = @stamping_motion_punches & @right_techniques unless nil
  @continuous_motion_punches_right = @continuous_motion_punches & @right_techniques unless nil
  @jumping_motion_punches_right = @jumping_motion_punches & @right_techniques unless nil
  @consecutive_motion_punches_right = @consecutive_motion_punches & @right_techniques unless nil
  @connecting_motion_punches_right = @connecting_motion_punches & @right_techniques unless nil
  @skipping_motion_punches_right = @skipping_motion_punches & @right_techniques unless nil
  @dodging_motion_punches_right = @dodging_motion_punches & @right_techniques unless nil
  @double_stepping_motion_punches_right = @double_stepping_motion_punches & @right_techniques unless nil
  @shifting_motion_punches_right = @shifting_motion_punches & @right_techniques unless nil

  @normal_motion_strikes_right = @normal_motion_strikes & @right_techniques unless nil
  @flying_motion_strikes_right = @flying_motion_strikes & @right_techniques unless nil
  @fast_motion_strikes_right = @fast_motion_strikes & @right_techniques unless nil
  @slow_motion_strikes_right = @slow_motion_strikes & @right_techniques unless nil
  @sliding_motion_strikes_right = @sliding_motion_strikes & @right_techniques unless nil
  @stamping_motion_strikes_right = @stamping_motion_strikes & @right_techniques unless nil
  @continuous_motion_strikes_right = @continuous_motion_strikes & @right_techniques unless nil
  @jumping_motion_strikes_right = @jumping_motion_strikes & @right_techniques unless nil
  @consecutive_motion_strikes_right = @consecutive_motion_strikes & @right_techniques unless nil
  @connecting_motion_strikes_right = @connecting_motion_strikes & @right_techniques unless nil
  @skipping_motion_strikes_right = @skipping_motion_strikes & @right_techniques unless nil
  @dodging_motion_strikes_right = @dodging_motion_strikes & @right_techniques unless nil
  @double_stepping_motion_strikes_right = @double_stepping_motion_strikes & @right_techniques unless nil
  @shifting_motion_strikes_right = @shifting_motion_strikes & @right_techniques unless nil

  @normal_motion_thrusts_right = @normal_motion_thrusts & @right_techniques unless nil
  @flying_motion_thrusts_right = @flying_motion_thrusts & @right_techniques unless nil
  @fast_motion_thrusts_right = @fast_motion_thrusts & @right_techniques unless nil
  @slow_motion_thrusts_right = @slow_motion_thrusts & @right_techniques unless nil
  @sliding_motion_thrusts_right = @sliding_motion_thrusts & @right_techniques unless nil
  @stamping_motion_thrusts_right = @stamping_motion_thrusts & @right_techniques unless nil
  @continuous_motion_thrusts_right = @continuous_motion_thrusts & @right_techniques unless nil
  @jumping_motion_thrusts_right = @jumping_motion_thrusts & @right_techniques unless nil
  @consecutive_motion_thrusts_right = @consecutive_motion_thrusts & @right_techniques unless nil
  @connecting_motion_thrusts_right = @connecting_motion_thrusts & @right_techniques unless nil
  @skipping_motion_thrusts_right = @skipping_motion_thrusts & @right_techniques unless nil
  @dodging_motion_thrusts_right = @dodging_motion_thrusts & @right_techniques unless nil
  @double_stepping_motion_thrusts_right = @double_stepping_motion_thrusts & @right_techniques unless nil
  @shifting_motion_thrusts_right = @shifting_motion_thrusts & @right_techniques unless nil


  puts "---------------------------------------"
  puts "Techniques by motion type"

  dataset = [
    [:normal,
      [
        @normal_motion_blocks.count,
        @normal_motion_punches.count,
        @normal_motion_strikes.count,
        @normal_motion_thrusts.count,
      ]
    ],
    [:flying,
      [
        @flying_motion_blocks.count,
        @flying_motion_punches.count,
        @flying_motion_strikes.count,
        @flying_motion_thrusts.count,
      ]
    ],
    [:fast,
      [
        @fast_motion_blocks.count,
        @fast_motion_punches.count,
        @fast_motion_strikes.count,
        @fast_motion_thrusts.count,
      ]
    ],
    [:slow,
      [
        @slow_motion_blocks.count,
        @slow_motion_punches.count,
        @slow_motion_strikes.count,
        @slow_motion_thrusts.count,
      ]
    ],
    [:sliding,
      [
        @sliding_motion_blocks.count,
        @sliding_motion_punches.count,
        @sliding_motion_strikes.count,
        @sliding_motion_thrusts.count,
      ]
    ],
    [:stamping,
      [
        @stamping_motion_blocks.count,
        @stamping_motion_punches.count,
        @stamping_motion_strikes.count,
        @stamping_motion_thrusts.count,
      ]
    ],
    [:continuous,
      [
        @continuous_motion_blocks.count,
        @continuous_motion_punches.count,
        @continuous_motion_strikes.count,
        @continuous_motion_thrusts.count,
      ]
    ],
    [:jumping,
      [
        @jumping_motion_blocks.count,
        @jumping_motion_punches.count,
        @jumping_motion_strikes.count,
        @jumping_motion_thrusts.count,
      ]
    ],
    [:consecutive,
      [
        @consecutive_motion_blocks.count,
        @consecutive_motion_punches.count,
        @consecutive_motion_strikes.count,
        @consecutive_motion_thrusts.count,
      ]
    ],
    [:connecting,
      [
        @connecting_motion_blocks.count,
        @connecting_motion_punches.count,
        @connecting_motion_strikes.count,
        @connecting_motion_thrusts.count,
      ]
    ],
    [:skipping,
      [
        @skipping_motion_blocks.count,
        @skipping_motion_punches.count,
        @skipping_motion_strikes.count,
        @skipping_motion_thrusts.count,
      ]
    ],
    [:dodging,
      [
        @dodging_motion_blocks.count,
        @dodging_motion_punches.count,
        @dodging_motion_strikes.count,
        @dodging_motion_thrusts.count,
      ]
    ],
    [:double_stepping,
      [
        @double_stepping_motion_blocks.count,
        @double_stepping_motion_punches.count,
        @double_stepping_motion_strikes.count,
        @double_stepping_motion_thrusts.count,
      ]
    ],
    [:shifting,
      [
        @shifting_motion_blocks.count,
        @shifting_motion_punches.count,
        @shifting_motion_strikes.count,
        @shifting_motion_thrusts.count,
      ]
    ],
  ]

  dataset.each { |data|
    puts data[0], data[1]
  }
  


  puts "---------------------------------------"
  puts "Left techniques by motion type"

  dataset_left = [
    [:normal,
      [
        @normal_motion_blocks_left.count,
        @normal_motion_punches_left.count,
        @normal_motion_strikes_left.count,
        @normal_motion_thrusts_left.count,
      ]
    ],
    [:flying,
      [
        @flying_motion_blocks_left.count,
        @flying_motion_punches_left.count,
        @flying_motion_strikes_left.count,
        @flying_motion_thrusts_left.count,
      ]
    ],
    [:fast,
      [
        @fast_motion_blocks_left.count,
        @fast_motion_punches_left.count,
        @fast_motion_strikes_left.count,
        @fast_motion_thrusts_left.count,
      ]
    ],
    [:slow,
      [
        @slow_motion_blocks_left.count,
        @slow_motion_punches_left.count,
        @slow_motion_strikes_left.count,
        @slow_motion_thrusts_left.count,
      ]
    ],
    [:sliding,
      [
        @sliding_motion_blocks_left.count,
        @sliding_motion_punches_left.count,
        @sliding_motion_strikes_left.count,
        @sliding_motion_thrusts_left.count,
      ]
    ],
    [:stamping,
      [
        @stamping_motion_blocks_left.count,
        @stamping_motion_punches_left.count,
        @stamping_motion_strikes_left.count,
        @stamping_motion_thrusts_left.count,
      ]
    ],
    [:continuous,
      [
        @continuous_motion_blocks_left.count,
        @continuous_motion_punches_left.count,
        @continuous_motion_strikes_left.count,
        @continuous_motion_thrusts_left.count,
      ]
    ],
    [:jumping,
      [
        @jumping_motion_blocks_left.count,
        @jumping_motion_punches_left.count,
        @jumping_motion_strikes_left.count,
        @jumping_motion_thrusts_left.count,
      ]
    ],
    [:consecutive,
      [
        @consecutive_motion_blocks_left.count,
        @consecutive_motion_punches_left.count,
        @consecutive_motion_strikes_left.count,
        @consecutive_motion_thrusts_left.count,
      ]
    ],
    [:connecting,
      [
        @connecting_motion_blocks_left.count,
        @connecting_motion_punches_left.count,
        @connecting_motion_strikes_left.count,
        @connecting_motion_thrusts_left.count,
      ]
    ],
    [:skipping,
      [
        @skipping_motion_blocks_left.count,
        @skipping_motion_punches_left.count,
        @skipping_motion_strikes_left.count,
        @skipping_motion_thrusts_left.count,
      ]
    ],
    [:dodging,
      [
        @dodging_motion_blocks_left.count,
        @dodging_motion_punches_left.count,
        @dodging_motion_strikes_left.count,
        @dodging_motion_thrusts_left.count,
      ]
    ],
    [:double_stepping,
      [
        @double_stepping_motion_blocks_left.count,
        @double_stepping_motion_punches_left.count,
        @double_stepping_motion_strikes_left.count,
        @double_stepping_motion_thrusts_left.count,
      ]
    ],
    [:shifting,
      [
        @shifting_motion_blocks_left.count,
        @shifting_motion_punches_left.count,
        @shifting_motion_strikes_left.count,
        @shifting_motion_thrusts_left.count,
      ]
    ],
  ]

  dataset_left.each { |data|
    puts data[0], data[1]
  }
  


  puts "---------------------------------------"
  puts "Right techniques by motion type"

  dataset_right = [
    [:normal,
      [
        @normal_motion_blocks_right.count,
        @normal_motion_punches_right.count,
        @normal_motion_strikes_right.count,
        @normal_motion_thrusts_right.count,
      ]
    ],
    [:flying,
      [
        @flying_motion_blocks_right.count,
        @flying_motion_punches_right.count,
        @flying_motion_strikes_right.count,
        @flying_motion_thrusts_right.count,
      ]
    ],
    [:fast,
      [
        @fast_motion_blocks_right.count,
        @fast_motion_punches_right.count,
        @fast_motion_strikes_right.count,
        @fast_motion_thrusts_right.count,
      ]
    ],
    [:slow,
      [
        @slow_motion_blocks_right.count,
        @slow_motion_punches_right.count,
        @slow_motion_strikes_right.count,
        @slow_motion_thrusts_right.count,
      ]
    ],
    [:sliding,
      [
        @sliding_motion_blocks_right.count,
        @sliding_motion_punches_right.count,
        @sliding_motion_strikes_right.count,
        @sliding_motion_thrusts_right.count,
      ]
    ],
    [:stamping,
      [
        @stamping_motion_blocks_right.count,
        @stamping_motion_punches_right.count,
        @stamping_motion_strikes_right.count,
        @stamping_motion_thrusts_right.count,
      ]
    ],
    [:continuous,
      [
        @continuous_motion_blocks_right.count,
        @continuous_motion_punches_right.count,
        @continuous_motion_strikes_right.count,
        @continuous_motion_thrusts_right.count,
      ]
    ],
    [:jumping,
      [
        @jumping_motion_blocks_right.count,
        @jumping_motion_punches_right.count,
        @jumping_motion_strikes_right.count,
        @jumping_motion_thrusts_right.count,
      ]
    ],
    [:consecutive,
      [
        @consecutive_motion_blocks_right.count,
        @consecutive_motion_punches_right.count,
        @consecutive_motion_strikes_right.count,
        @consecutive_motion_thrusts_right.count,
      ]
    ],
    [:connecting,
      [
        @connecting_motion_blocks_right.count,
        @connecting_motion_punches_right.count,
        @connecting_motion_strikes_right.count,
        @connecting_motion_thrusts_right.count,
      ]
    ],
    [:skipping,
      [
        @skipping_motion_blocks_right.count,
        @skipping_motion_punches_right.count,
        @skipping_motion_strikes_right.count,
        @skipping_motion_thrusts_right.count,
      ]
    ],
    [:dodging,
      [
        @dodging_motion_blocks_right.count,
        @dodging_motion_punches_right.count,
        @dodging_motion_strikes_right.count,
        @dodging_motion_thrusts_right.count,
      ]
    ],
    [:double_stepping,
      [
        @double_stepping_motion_blocks_right.count,
        @double_stepping_motion_punches_right.count,
        @double_stepping_motion_strikes_right.count,
        @double_stepping_motion_thrusts_right.count,
      ]
    ],
    [:shifting,
      [
        @shifting_motion_blocks_right.count,
        @shifting_motion_punches_right.count,
        @shifting_motion_strikes_right.count,
        @shifting_motion_thrusts_right.count,
      ]
    ],
  ]

  dataset_right.each { |data|
    puts data[0], data[1]
  }
  


  puts "---------------------------------------"
  puts "Techniques by motion type ex. normal motion"


  dataset_ex_normal = [
    [:flying,
      [
        @flying_motion_blocks.count,
        @flying_motion_punches.count,
        @flying_motion_strikes.count,
        @flying_motion_thrusts.count,
      ]
    ],
    [:fast,
      [
        @fast_motion_blocks.count,
        @fast_motion_punches.count,
        @fast_motion_strikes.count,
        @fast_motion_thrusts.count,
      ]
    ],
    [:slow,
      [
        @slow_motion_blocks.count,
        @slow_motion_punches.count,
        @slow_motion_strikes.count,
        @slow_motion_thrusts.count,
      ]
    ],
    [:sliding,
      [
        @sliding_motion_blocks.count,
        @sliding_motion_punches.count,
        @sliding_motion_strikes.count,
        @sliding_motion_thrusts.count,
      ]
    ],
    [:stamping,
      [
        @stamping_motion_blocks.count,
        @stamping_motion_punches.count,
        @stamping_motion_strikes.count,
        @stamping_motion_thrusts.count,
      ]
    ],
    [:continuous,
      [
        @continuous_motion_blocks.count,
        @continuous_motion_punches.count,
        @continuous_motion_strikes.count,
        @continuous_motion_thrusts.count,
      ]
    ],
    [:jumping,
      [
        @jumping_motion_blocks.count,
        @jumping_motion_punches.count,
        @jumping_motion_strikes.count,
        @jumping_motion_thrusts.count,
      ]
    ],
    [:consecutive,
      [
        @consecutive_motion_blocks.count,
        @consecutive_motion_punches.count,
        @consecutive_motion_strikes.count,
        @consecutive_motion_thrusts.count,
      ]
    ],
    [:connecting,
      [
        @connecting_motion_blocks.count,
        @connecting_motion_punches.count,
        @connecting_motion_strikes.count,
        @connecting_motion_thrusts.count,
      ]
    ],
    [:skipping,
      [
        @skipping_motion_blocks.count,
        @skipping_motion_punches.count,
        @skipping_motion_strikes.count,
        @skipping_motion_thrusts.count,
      ]
    ],
    [:dodging,
      [
        @dodging_motion_blocks.count,
        @dodging_motion_punches.count,
        @dodging_motion_strikes.count,
        @dodging_motion_thrusts.count,
      ]
    ],
    [:double_stepping,
      [
        @double_stepping_motion_blocks.count,
        @double_stepping_motion_punches.count,
        @double_stepping_motion_strikes.count,
        @double_stepping_motion_thrusts.count,
      ]
    ],
    [:shifting,
      [
        @shifting_motion_blocks.count,
        @shifting_motion_punches.count,
        @shifting_motion_strikes.count,
        @shifting_motion_thrusts.count,
      ]
    ],
  ]

  dataset_ex_normal.each { |data|
    puts data[0], data[1]
  }
  


  puts "---------------------------------------"
  puts "Left techniques by motion type ex. normal motion"

  dataset_left_ex_normal = [
    [:flying,
      [
        @flying_motion_blocks_left.count,
        @flying_motion_punches_left.count,
        @flying_motion_strikes_left.count,
        @flying_motion_thrusts_left.count,
      ]
    ],
    [:fast,
      [
        @fast_motion_blocks_left.count,
        @fast_motion_punches_left.count,
        @fast_motion_strikes_left.count,
        @fast_motion_thrusts_left.count,
      ]
    ],
    [:slow,
      [
        @slow_motion_blocks_left.count,
        @slow_motion_punches_left.count,
        @slow_motion_strikes_left.count,
        @slow_motion_thrusts_left.count,
      ]
    ],
    [:sliding,
      [
        @sliding_motion_blocks_left.count,
        @sliding_motion_punches_left.count,
        @sliding_motion_strikes_left.count,
        @sliding_motion_thrusts_left.count,
      ]
    ],
    [:stamping,
      [
        @stamping_motion_blocks_left.count,
        @stamping_motion_punches_left.count,
        @stamping_motion_strikes_left.count,
        @stamping_motion_thrusts_left.count,
      ]
    ],
    [:continuous,
      [
        @continuous_motion_blocks_left.count,
        @continuous_motion_punches_left.count,
        @continuous_motion_strikes_left.count,
        @continuous_motion_thrusts_left.count,
      ]
    ],
    [:jumping,
      [
        @jumping_motion_blocks_left.count,
        @jumping_motion_punches_left.count,
        @jumping_motion_strikes_left.count,
        @jumping_motion_thrusts_left.count,
      ]
    ],
    [:consecutive,
      [
        @consecutive_motion_blocks_left.count,
        @consecutive_motion_punches_left.count,
        @consecutive_motion_strikes_left.count,
        @consecutive_motion_thrusts_left.count,
      ]
    ],
    [:connecting,
      [
        @connecting_motion_blocks_left.count,
        @connecting_motion_punches_left.count,
        @connecting_motion_strikes_left.count,
        @connecting_motion_thrusts_left.count,
      ]
    ],
    [:skipping,
      [
        @skipping_motion_blocks_left.count,
        @skipping_motion_punches_left.count,
        @skipping_motion_strikes_left.count,
        @skipping_motion_thrusts_left.count,
      ]
    ],
    [:dodging,
      [
        @dodging_motion_blocks_left.count,
        @dodging_motion_punches_left.count,
        @dodging_motion_strikes_left.count,
        @dodging_motion_thrusts_left.count,
      ]
    ],
    [:double_stepping,
      [
        @double_stepping_motion_blocks_left.count,
        @double_stepping_motion_punches_left.count,
        @double_stepping_motion_strikes_left.count,
        @double_stepping_motion_thrusts_left.count,
      ]
    ],
    [:shifting,
      [
        @shifting_motion_blocks_left.count,
        @shifting_motion_punches_left.count,
        @shifting_motion_strikes_left.count,
        @shifting_motion_thrusts_left.count,
      ]
    ],
  ]

  dataset_left_ex_normal.each { |data|
    puts data[0], data[1]
  }
  


  puts "---------------------------------------"
  puts "Right techniques by motion type ex. normal motion"

  dataset_right_ex_normal = [
    [:flying,
      [
        @flying_motion_blocks_right.count,
        @flying_motion_punches_right.count,
        @flying_motion_strikes_right.count,
        @flying_motion_thrusts_right.count,
      ]
    ],
    [:fast,
      [
        @fast_motion_blocks_right.count,
        @fast_motion_punches_right.count,
        @fast_motion_strikes_right.count,
        @fast_motion_thrusts_right.count,
      ]
    ],
    [:slow,
      [
        @slow_motion_blocks_right.count,
        @slow_motion_punches_right.count,
        @slow_motion_strikes_right.count,
        @slow_motion_thrusts_right.count,
      ]
    ],
    [:sliding,
      [
        @sliding_motion_blocks_right.count,
        @sliding_motion_punches_right.count,
        @sliding_motion_strikes_right.count,
        @sliding_motion_thrusts_right.count,
      ]
    ],
    [:stamping,
      [
        @stamping_motion_blocks_right.count,
        @stamping_motion_punches_right.count,
        @stamping_motion_strikes_right.count,
        @stamping_motion_thrusts_right.count,
      ]
    ],
    [:continuous,
      [
        @continuous_motion_blocks_right.count,
        @continuous_motion_punches_right.count,
        @continuous_motion_strikes_right.count,
        @continuous_motion_thrusts_right.count,
      ]
    ],
    [:jumping,
      [
        @jumping_motion_blocks_right.count,
        @jumping_motion_punches_right.count,
        @jumping_motion_strikes_right.count,
        @jumping_motion_thrusts_right.count,
      ]
    ],
    [:consecutive,
      [
        @consecutive_motion_blocks_right.count,
        @consecutive_motion_punches_right.count,
        @consecutive_motion_strikes_right.count,
        @consecutive_motion_thrusts_right.count,
      ]
    ],
    [:connecting,
      [
        @connecting_motion_blocks_right.count,
        @connecting_motion_punches_right.count,
        @connecting_motion_strikes_right.count,
        @connecting_motion_thrusts_right.count,
      ]
    ],
    [:skipping,
      [
        @skipping_motion_blocks_right.count,
        @skipping_motion_punches_right.count,
        @skipping_motion_strikes_right.count,
        @skipping_motion_thrusts_right.count,
      ]
    ],
    [:dodging,
      [
        @dodging_motion_blocks_right.count,
        @dodging_motion_punches_right.count,
        @dodging_motion_strikes_right.count,
        @dodging_motion_thrusts_right.count,
      ]
    ],
    [:double_stepping,
      [
        @double_stepping_motion_blocks_right.count,
        @double_stepping_motion_punches_right.count,
        @double_stepping_motion_strikes_right.count,
        @double_stepping_motion_thrusts_right.count,
      ]
    ],
    [:shifting,
      [
        @shifting_motion_blocks_right.count,
        @shifting_motion_punches_right.count,
        @shifting_motion_strikes_right.count,
        @shifting_motion_thrusts_right.count,
      ]
    ],
  ]

  dataset_right_ex_normal.each { |data|
    puts data[0], data[1]
  }
end




all_techniques
techniques_by_height
techniques_by_stances
techniques_by_pattern
techniques_by_motion_type
