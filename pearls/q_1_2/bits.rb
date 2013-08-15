require 'benchmark'
require 'benchmark/ips'

def print_bit x
  res = []
  begin
    res << (x & 1)
  end while (x = x >> 1) > 0
  res.reverse.join('')
end

def bit_to_array x
  res = []
  current = 1
  while (x = x >> 1) > 0
    if (x & 1) == 1
      res << current
    end
    current += 1
  end
  res
end

# quick sort ----------------------------
def qsort list
  return [] if list.empty?

  middle = list.pop
  low    = qsort(list.select{|x| x < middle })
  high   = qsort(list.select{|x| x > middle })

  return low + [middle] + high
end

# bit sort ------------------------------
def bitsort list
  result = 0

  list.each do |num|
    result = result | (1 << num)
  end

  bit_to_array result
end

# main ------------------------------------
if __FILE__ == $0
  list = open('./q_1_1.data').map do |line|
    line.chomp.to_i
  end

  result = {}

  Benchmark.bm do |r|
    r.report("qsort  "){ result[:qsort]   = qsort list.dup   }
    r.report("bitsort"){ result[:bitsort] = bitsort list.dup }
  end

  open('./q_1_1.qsort_out', 'w') do |file|
    file.write result[:qsort].join("\n")
  end

  open('./q_1_1.bitsort_out', 'w') do |file|
    file.write result[:bitsort].join("\n")
  end
end
