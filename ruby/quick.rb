
def quickSort list
  return list if list.length <= 1

  x     = list.pop
  left  = quickSort list.find_all{|n| n <= x }
  right = quickSort list.find_all{|n| n  > x }

  left + [x] + right
end

p src = [6,3,1,2,7]
p quickSort src
