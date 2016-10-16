module Commentable

  def comments
    @comments ||= []
  end

  def add_comment comment
    comments << comment
  end
end

module Visualizable
  attr_writer :resolution

  def resolution
    @resolution ||= '0x0'
  end
end

class Clip
  include Commentable

  def play
    puts "Playing #{object_id}..."
  end
end

class Video < Clip
  include Visualizable
end

class Song < Clip
  attr_accessor :beats_per_minute
end

class Photo
  include Commentable
  include Visualizable

  def show
    puts "look at this photograph. res is #{resolution}"
  end
end

video = Video.new
video.add_comment("Cool")
video.add_comment("Awesome2")
video.resolution = '1920x1080'
song = Song.new
song.add_comment("Musical niceties")
photo = Photo.new
photo.add_comment("Photorealistic")
# photo.resolution = '1440x900'


p video, song, photo
video.play
song.play
photo.show
