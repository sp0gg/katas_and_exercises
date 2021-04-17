require 'rspec'

def format_duration(seconds)
  return 'now' if seconds == 0
  durations = {years: 31536000, days: 86400, hours: 3600, minutes: 60, seconds: 1}
  seconds_dup = seconds
  unit_counts = {years: 0, days: 0, hours: 0, minutes: 0, seconds: 0}

  durations.each_pair do |duration, secs|
    until seconds_dup < secs
      unit_counts[duration] += 1
      seconds_dup -= secs
    end
  end

  result_durations = []
  unit_counts.to_a.keep_if{|element| element[1] > 0}.map do |pair|
    str = "#{pair[1]} #{pair[0]}"
    str.chop! if pair[1] == 1
    result_durations << str
  end

  return result_durations[0] if result_durations.size == 1
  result_string = result_durations[0...-1].join(', ')
  result_string << " and #{result_durations[-1]}"
end

describe 'readable_time_formatter' do
  it 'should format time integers as readable text' do
    expect(format_duration(62)).to eq '1 minute and 2 seconds'
    expect(format_duration(31536000)).to eq '1 year'
    expect(format_duration(63072000)).to eq '2 years'
    expect(format_duration(1)).to eq '1 second'
    expect(format_duration(120)).to eq '2 minutes'
    expect(format_duration(3600)).to eq '1 hour'
    expect(format_duration(3662)).to eq '1 hour, 1 minute and 2 seconds'
  end
end
