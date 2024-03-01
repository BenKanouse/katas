class BinaryTree

  def initialize(root_node)
    @root_node = root_node
    @data = Hash.new([])
  end

  def vertical_traversal
    paths root_node, 0, 0

    data.sort.each_with_object(Hash.new([])) do |(point, value), hash|
      hash[point.x] = hash[point.x] + value
    end.values
  end

  private

  attr_reader :data, :root_node

  def paths(node, x, y)
    return unless node

    point = Point.new(x, y)
    data[point] = data[point] + [node.value]

    paths(node.left, x - 1, y + 1)
    paths(node.right, x + 1, y + 1)
  end

end

class Point
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def ==(other)
    x == other.x && y == other.y
  end

  def <=>(other)
    return y <=> other.y if x == other.x

    x <=> other.x
  end
end
