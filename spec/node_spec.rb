require_relative "../node"

describe "Node" do

  let(:node) {Node.new(10)}

  it "Has an element" do
    expect(node.element).to be 10
  end

  it "Links to another node" do
    a_node = Node.new(3)
    node.insert_after(a_node)
    expect(node.reference).to be a_node
  end

  it "Can remove a link to another node" do
    a_node = Node.new(3)
    node.insert_after(a_node)
    node.remove_after
    expect(node.reference).to be nil
  end

end
