require File.expand_path('../bit', __FILE__)

class TreePrinter
  def initialize
  end

  def print node, space = ''
    line = "#{space}#{node.name}"
    puts line
    node.children.each do |node|
      self.print node, (' ' * line.size) + '\\-'
    end
  end
end

class NormalNode
  attr_reader :parent, :children, :name

  def initialize parent, num
    @parent   = parent
    @children = []
    @name     = num
    parent.push(self) if parent
  end

  def push child
    @children << child
  end
end

class LoudsTree
  attr_reader :node

  def initialize source_node, size
    @node        = Bits.new(size)
    @queue       = [source_node]
    @position    = 0

    set1_and_shift
    set0_and_shift

    while n = @queue.shift
      build n
    end
  end

  def build node
    node.children.each do |n|
      set1_and_shift
      @queue.push n
    end
    set0_and_shift
  end

  def set1_and_shift
    @node[@position] = 1
    @position += 1
  end

  def set0_and_shift
    @node[@position] = 0
    @position += 1
  end

  def rank pos, bit
    count = 0
    (pos - 1).times do |index|
      count += 1 if @node[index] == bit
    end
    count
  end

  def select num, bit
    count = 0
    @node.each_with_index do |node, index|
      count += 1   if node == bit
      return index if count == num
    end
  end
end

nodes = { a: NormalNode.new(nil, :a) }

{
  a:  [:b, :c, :d],
  b:  [:e, :f],
  d:  [:g, :h, :i],
  e:  [:j],
  j:  [:k, :l, :m],
  h:  [:n, :o]
}.each do |k, children|
  children.each do |x|
    nodes[x] = NormalNode.new(nodes[k], x)
  end
end

TreePrinter.new.print(nodes[:a])

louds = LoudsTree.new nodes[:a], 50
louds.node.print

puts "louds.rank(10, 0) ... #{ louds.rank(10, 0) }"
puts "louds.rank(10, 1) ... #{ louds.rank(10, 1) }"
puts "louds.select(6, 0) ... #{ louds.select(6, 0) }"
puts "louds.select(6, 1) ... #{ louds.select(6, 1) }"
puts "louds.select(louds.rank(26, 0), 1) ... #{ louds.select(louds.rank(26, 0), 1) } "
