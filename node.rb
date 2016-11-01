class Node
  attr_accessor :element
  attr_reader :reference, :link_back

  def initialize(element)
    @element = element
    @reference = nil
    @link_back = nil
  end

  def insert_after(other_node)
    @reference = other_node
  end

  def insert_before(other_node)
    @link_back = other_node
  end


  def remove_after
    @reference = nil
  end

  def remove_before
    @link_back = nil
  end

end
