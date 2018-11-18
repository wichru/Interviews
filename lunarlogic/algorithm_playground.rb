def playground(string)
  array = string.chars
  loop do
    a = array.slice_when { |a,b| a.downcase != b.downcase }.to_a
    b = a.reject! { |e| e.size > 2 }
    array = a.flatten
    break array.join if b.nil?
  end
end

puts playground('AABBCCCCBDDDADB')
puts '----------------'
puts playground('abbbaaccada')
puts '----------------'
puts playground('bbccdddcb')
puts '----------------'
