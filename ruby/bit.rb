class Bits
  include Enumerable
  UNIT_BIT = 32

  def initialize size
    @size  = size
    @array = Array.new((size / UNIT_BIT) + 1, 0)
  end

  def [] position
    @array[position / UNIT_BIT][position % UNIT_BIT]
  end

  def []= position, up
    if up == 1
      @array[position / UNIT_BIT] |= (1 << (position % UNIT_BIT))
    else
      @array[position / UNIT_BIT] &= ~(1 << (position % UNIT_BIT))
    end
  end

  def set position
    self[position] = 1
  end

  def each
    @size.times do |index|
      yield self[index]
    end
  end

  def print
    self.map{|bit| bit }.reverse.each_with_index do |x, idx|
      Kernel.print x
      Kernel.print ' | ' if idx % 10 == 9
    end
    Kernel.puts ''
  end
end

if __FILE__ == $0
  bt = Bits.new 10
  bt.print

  bt[2] = 1
  bt[4] = 1
  bt.print

  bt[2] = 0
  bt.print

  bt[4] = 0
  bt.print
end
