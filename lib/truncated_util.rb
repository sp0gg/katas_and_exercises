class TruncatedUtil

  def get_lines_by_movie_name movie
    File.open('lib/reviews.txt') do |file|
      lines = file.readlines.select {|line| line.include?(movie) }
      lines.reject {|line| line.start_with?('--')}
    end
  end

  def filter_adjectives_from_content reviews
    reviews.collect {|line| "\"#{line.match(/(?<=\bTruncated is\s)(\w+)/).to_s.capitalize}\""}
  end
end