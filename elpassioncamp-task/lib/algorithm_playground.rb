
  def accum(sth)
    count = sth.length
    sth.chars.each_with_index.map { |v, i| (v * (count - i)).capitalize }.join('-')
  end

puts accum("abcd")
puts accum("RqaEzty")
puts accum("cwAt")
puts accum("EvidjUnokmM")
