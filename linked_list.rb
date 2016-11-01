require_relative "node"

class LinkedList
  attr_reader :count, :first, :last_node

  def initialize
    @count = 0
  end

  def insert_first(element)
    increment_count
    new_node = Node.new(element)
    if @first == nil
      @first = new_node
      @last_node = new_node
    else
      set_links(@first, new_node)
      @first = new_node
    end
  end

  def remove_first
    return nil unless @first
    decriment_count
    whole_list = @first
    @first = whole_list.reference
  end

  def insert_last(element)
    return insert_first(element) if @first == nil
    increment_count
    new_node = Node.new(element)
    @last_node.insert_after(new_node)
    new_node.insert_before(@last_node)
    @last_node = new_node
  end

  def remove_last
    return nil unless @first || @count == 1
    decriment_count
    second_to_last = @last_node.link_back
    second_to_last.remove_after
    @last_node.remove_before
    @last_node = second_to_last
  end

  def get(index)
    return @last_node if index == count - 1
    nodes = @first
    index.times do
      nodes = nodes.reference
    end
    nodes
  end

  def set(index, element)
    node = get(index)
    node.element = element
    node
  end

  def insert(index, element)
    return insert_first(element) if index == 0
    return insert_last(element) if index == count - 1
    increment_count
    nodes = @first
    before = nil
    (index).times do
      before = nodes
      nodes = nodes.reference
    end
    new_node = Node.new(element)
    before.remove_after
    set_links(new_node, before)
    set_links(nodes, before.reference)
  end

  def size(i = 0, nodes = @first)
    return @count = i if nodes == nil
    size(i += 1, nodes.reference)
  end

  private

  def set_links(first_node, second_node)
    second_node.insert_after(first_node)
    first_node.insert_before(second_node)
  end

  def increment_count
    @count += 1
  end

  def decriment_count
    @count -= 1
  end

end
