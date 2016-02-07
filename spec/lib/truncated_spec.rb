require 'rspec'
require 'truncated_util'

describe TruncatedUtil do
  let(:trunc_util) { TruncatedUtil.new }
  let(:movie_name) { 'Truncated' }
  let(:filtered_movie_lines) { trunc_util.get_lines_by_movie_name(movie_name) }

  describe '#get_lines_by_movie_name' do
    context "the loaded movie review file" do
      it "contains our movie name in each line" do
        trunc_util.get_lines_by_movie_name(movie_name).each do |line|
          expect(line).to include movie_name
        end
      end
      it "does not contain reviewer bylines" do
        trunc_util.get_lines_by_movie_name(movie_name).each do |line|
          expect(line).not_to start_with '--'
        end
      end
    end
  end

  describe '#get_adjectives_by_movie_name' do
    context "the filtered lines for our movie" do
      it "contains only capitalized adjectives surrounded by quotes" do
        adjectives = trunc_util.filter_adjectives_from_content(filtered_movie_lines)
        p adjectives
        expect(adjectives).to include '"Amazing"'
        expect(adjectives).to include '"Funny"'
        expect(adjectives).to include '"Astounding"'
      end
    end
  end
end