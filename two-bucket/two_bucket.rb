class TwoBucket
  attr_reader :moves, :goal_bucket, :other_bucket

  def initialize(bucket1_size, bucket2_size, goal, start_bucket)
    @bucket1_size = bucket1_size
    @bucket2_size = bucket2_size
    @goal = goal
    @start_bucket = start_bucket

    @bucket1 = 0
    @bucket2 = 0
    @moves = 0

    simulate
  end

  def simulate
    if @start_bucket == "one"
      fill("one")
    else
      fill("two")
    end

    until @bucket1 == @goal || @bucket2 == @goal
      if @bucket1 == 0
        fill("one")
      elsif @bucket2 == @bucket2_size
        empty("two")
      else
        pour("one", "two")
      end
    end

    set_results
  end

  def fill(bucket)
    if bucket == "one"
      @bucket1 = @bucket1_size
    else
      @bucket2 = @bucket2_size
    end
    @moves += 1
  end

  def empty(bucket)
    if bucket == "one"
      @bucket1 = 0
    else
      @bucket2 = 0
    end
    @moves += 1
  end

  def pour(from, to)
    if from == "one"
      transfer = [@bucket1, @bucket2_size - @bucket2].min
      @bucket1 -= transfer
      @bucket2 += transfer
    else
      transfer = [@bucket2, @bucket1_size - @bucket1].min
      @bucket2 -= transfer
      @bucket1 += transfer
    end
    @moves += 1
  end

  def set_results
    if @bucket1 == @goal
      @goal_bucket = "one"
      @other_bucket = @bucket2
    else
      @goal_bucket = "two"
      @other_bucket = @bucket1
    end
  end
end
