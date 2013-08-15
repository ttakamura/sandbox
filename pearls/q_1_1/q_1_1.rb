
def qsort list
  return [] if list.empty?

  middle = list.pop
  low    = qsort(list.select{|x| x < middle })
  high   = qsort(list.select{|x| x > middle })

  return low + [middle] + high
end

if __FILE__ == $0
  list = open('./q_1_1.data').map do |line|
    line.chomp.to_i
  end

  result = qsort list

  open('./q_1_1.out', 'w') do |file|
    file.write result.join("\n")
  end
end
