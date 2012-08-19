def generate_keypresses_for_seconds(seconds)
  decomp_minutes, decomp_seconds = seconds.divmod(60)

  return [seconds, decomp_minutes*100 + decomp_seconds].map do |e|
    e.to_s + '*'
  end.uniq
end

class UnknownKey < Exception; end

def calculate_travel_distance(str)
  positions = {
    '1' => [0, 0],
    '2' => [0, 1],
    '3' => [0, 2],
    '4' => [1, 0],
    '5' => [1, 1],
    '6' => [1, 2],
    '7' => [2, 0],
    '8' => [2, 1],
    '9' => [2, 2],
    '0' => [3, 1],
    '*' => [3, 2],
  }

  previous_position = nil

  str.chars.reduce(0) do |memo, c|
    begin
      current_position = positions.fetch(c)
    rescue KeyError
      raise UnknownKey.new(c)
    end

    result = 0
    if !previous_position.nil?
      result = memo + Math.sqrt(
        (current_position[0] - previous_position[0])**2 +
        (current_position[1] - previous_position[1])**2
      )
    end
    previous_position = current_position

    result
  end
end

def microwave(seconds, opts={})
  skew = opts[:skew] || 0

  Range.new(-skew, +skew).to_a.map do |d|
    generate_keypresses_for_seconds(seconds + d)
  end.reduce(:+).sort_by! do |e|
    calculate_travel_distance(e)
  end[0].chomp('*').to_i
end
