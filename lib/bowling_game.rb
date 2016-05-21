class BowlingGame

  attr_reader :completed_frames, :current_frame

  def initialize
    @completed_frames = []
    @current_frame = Frame.new
  end

  def roll(pins_dropped)

    current_frame.drop_pins(pins_dropped)
    if current_frame.complete?
      completed_frames << current_frame
      @current_frame = Frame.new
    end
  end

  def score
    completed_frames << @current_frame
    score = 0
    completed_frames[0..9].each_with_index do |frame, i|
      case frame.outcome
        when :open
          score += frame.value
        when :spare
          score += frame.value + completed_frames[i+1].pins_dropped[0]
        when :strike
          extra_roll = completed_frames[i+1].pins_dropped[0]
          second_extra_roll = 0
          if extra_roll == 10
            second_extra_roll = completed_frames[i+2].pins_dropped[0]
          else
            second_extra_roll = completed_frames[i+1].pins_dropped[1]
          end
          score += (frame.value + extra_roll + second_extra_roll)
      end
    end
    score
  end

  private

  def completed_frames=
    @completed_frames
  end

  def current_frame=
    @current_frame
  end
end

class Frame

  attr_reader :pins_dropped

  def initialize
    @pins_dropped = []
  end

  def drop_pins(pins)
    raise "Frame is complete!" if complete?
    @pins_dropped << pins
  end

  def value
    @pins_dropped.inject(:+)
  end

  def complete?
    @pins_dropped.size == 2 || value == 10
  end

  def outcome
    raise "Frame is not complete!" unless complete?
    return :strike if @pins_dropped[0] == 10
    return :spare if value == 10
    :open
  end
end
