class Node

  attr_accessor :value, :parent, :left_child, :right_child
  def initialize(value)
    @value = value
    @parent = nil
    @left_child = nil
    @right_child = nil
  end

end

class BinaryTree

  attr_accessor :root

  public

  def initialize
    @root = Node.new(nil)
  end

  def build_tree(arr)
    @root.value = arr[0] unless arr.empty?

    arr[1..-1].each_with_index do |x, i|
      new_node = Node.new(x)
      current_node = @root
      found_it = false
      until found_it
        if x >= current_node.value && current_node.right_child == nil
          current_node.right_child = new_node
          # p "new right child! #{x} is greater than parent #{current_node.value}"
          found_it = true
        elsif x < current_node.value && current_node.left_child == nil
          current_node.left_child = new_node
          found_it = true
        elsif x >= current_node.value
          current_node = current_node.right_child
        else
          current_node = current_node.left_child
        end
      end
    end

  end

  def breadth_first_search(value)
    queue = [@root]
    until queue.empty?
      node = queue.shift
      if node.value == value
        return node
      end
      left = node.left_child
      right = node.right_child
      queue << left unless left.nil?
      queue << right unless right.nil?
    end
    nil
  end

  def depth_first_search(value)
    stack = [@root]
    until stack.empty?
      node = stack.pop
      return node if node.value == value
      left = node.left_child
      right = node.right_child
      stack << right unless right.nil?
      stack << left unless left.nil?
    end
    nil
  end

  def dfs_rec(value, node=@root)
    return if node.nil?
    return node if node.value == value
    def_rec(value, node.left_child) || def_rec(value, node.right_child)
  end



end
