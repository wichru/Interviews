def solution(a, b)
  range = (a..b).to_a
  result = []

  range.each do |number|
    value = Math.sqrt(number) % 1
    if value == 0
      result << value
    end
  end
  puts result.length
end

solution(4, 17)
