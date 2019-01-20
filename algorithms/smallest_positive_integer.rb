def solution(array)
  arr = []
  result = array.uniq.sort.each_with_index do |v, i|
    if v+1 < v[i+1]
      puts v+1
    else
      i++
    end
  end
end

p solution([1,2,3])
p solution([4,5,2])
