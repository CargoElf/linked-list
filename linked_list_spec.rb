require_relative "linked_list"

describe "Linked List" do

  let(:l) {LinkedList.new}

  def set_nodes
    l.insert_first(4)
    l.insert_first(3)
    l.insert_first(2)
    l.insert_first(1)
    l.insert_first(0)
  end

  def list_elements(nodes, node_elements = [])
    return node_elements if nodes == nil
    node_elements << nodes.element
    list_elements(nodes.reference, node_elements)
  end

  def list_elements_backwards(nodes, node_elements = [])
    return node_elements if nodes == nil
    node_elements << nodes.element
    list_elements_backwards(nodes.link_back, node_elements)
  end

  it "Inserts at the begining of the list" do
    set_nodes
    l.insert_first(-1)
    expect(l.first.element).to eq(-1)
  end

  it "Removes the first node from the list" do
    set_nodes
    l.remove_first
    expect(l.first.element).to eq 1
  end

  it "Returns nil if there are no nodes" do
    expect(l.remove_first).to eq nil
  end

  it "Inserts at end of list" do
    set_nodes
    l.insert_last(5)
    new_list = list_elements(l.first)
    expect(new_list).to eq [0,1,2,3,4,5]
  end

  it "Links back properly" do
    set_nodes
    l.insert_last(5)
    new_list = list_elements_backwards(l.last_node)
    expect(new_list).to eq [5,4,3,2,1,0]
  end

  it "Removes the last node" do
    set_nodes
    l.remove_last
    new_list = list_elements(l.first)
    expect(new_list).to eq [0,1,2,3]
  end

  it "Returns nil if there are no nodes" do
    expect(l.remove_last).to eq nil
  end

  it "Returns the node of a given index" do
    set_nodes
    expect(l.get(2).element).to eq 2
  end

  it "Changes the element of a given index" do
    set_nodes
    l.set(2, 10).element
    new_list = list_elements(l.first)
    expect(new_list).to eq [0,1,10,3,4]
  end

  it "Inserts an element at the given index" do
    set_nodes
    l.insert(2, 10)
    new_list = list_elements(l.first)
    expect(new_list).to eq [0,1,10,2,3,4]
  end

  it "Links back properly after inserting" do
    set_nodes
    l.insert(2, 10)
    new_list = list_elements_backwards(l.last_node)
    expect(new_list).to eq [4,3,2,10,1,0]
  end

  it "Returns the length of the list" do
    set_nodes
    expect(l.size).to eq 5
  end

  it "Print out link back nodes" do
    set_nodes
    new_list = list_elements_backwards(l.last_node)
    expect(new_list).to eq [4,3,2,1,0]
  end
end