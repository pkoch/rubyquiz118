def generate_keypresses_for_seconds(seconds)
  decomp_minutes, decomp_seconds = seconds.divmod(60)

  return [seconds, decomp_minutes*100 + decomp_seconds].map do |e|
    e.to_s + '*'
  end.uniq
end

def microwave(seconds, opts={})
  skew = opts[:skew] || 0

  options = generate_keypresses_for_seconds(seconds)

  return options[0]
end
