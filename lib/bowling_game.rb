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
      score += get_frame_score(frame, i)
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

  def get_next_roll(frame_index, num_rolls)
    completed_frames[frame_index+1].pins_dropped[num_rolls - 1] || completed_frames[frame_index+2].pins_dropped[0]
  end

  def get_frame_score(frame, frame_index)
    frame_score = frame.value
    frame_score += get_next_roll(frame_index, 1) if [:strike, :spare].include?(frame.outcome)
    frame_score += get_next_roll(frame_index, 2) if frame.outcome == :strike
    frame_score
  end
end

class Frame
  attr_reader :pins_dropped

  def initialize
    @pins_dropped = []
  end

  def drop_pins(pins)
    raise 'Frame is complete!' if complete?
    @pins_dropped << pins
  end

  def value
    @pins_dropped.inject(:+)
  end

  def complete?
    @pins_dropped.size == 2 || value == 10
  end

  def outcome
    raise 'Frame is not complete!' unless complete?
    return :strike if @pins_dropped[0] == 10
    return :spare if value == 10
    :open
  end
end
