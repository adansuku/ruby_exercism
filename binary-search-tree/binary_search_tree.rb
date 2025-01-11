# require 'tty-tree'

class Bst
  include Enumerable

  attr_accessor :data, :left, :right

  def initialize(value)
    @data = value
    @left = nil
    @right = nil
  end

  def insert(value)
    value <= @data ? go_left(value) : go_right(value)
  end

  def go_left(value)
    @left ? @left.insert(value) : @left = Bst.new(value)
  end

  def go_right(value)
    @right ? @right.insert(value) : @right = Bst.new(value)
  end

  def each(&block)
    return to_enum(:each) unless block_given?

    @left.each(&block) if @left
    block.call(@data)
    @right.each(&block) if @right
  end

  # Just to view the tree on irb
  def to_tree
    tree = { "#{@data}" => {} }
    tree["#{@data}"]["L: #{@left.data}"] = @left.to_tree if @left
    tree["#{@data}"]["R: #{@right.data}"] = @right.to_tree if @right
    tree
  end
end

# # Test a tree
# puts "this is an example of a tree"
# tree = Bst.new(4)
# tree.insert(2)
# tree.insert(6)
# tree.insert(1)
# tree.insert(3)
# tree.insert(5)
# tree.insert(7)

# # print the
# tty_tree = TTY::Tree.new(tree.to_tree)
# puts tty_tree.render
