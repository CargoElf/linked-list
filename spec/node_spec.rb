require_relative "../node"

RSpec.describe Node do

  let(:node) {Node.new(10)}

  describe "Attributes" do
    it "Has an element" do
      expect(node.element).to be 10
    end

    it "Has readable refrence" do
      expect(node.reference).to be nil
    end

    it "Has readable link back" do
      expect(node.link_back).to be nil
    end
  end

  describe "Node Links" do
    it "Links to the next node" do
      a_node = Node.new(3)
      node.insert_after(a_node)
      expect(node.reference).to be a_node
    end

    it "Links to the previous node" do
      a_node = Node.new(3)
      node.insert_before(a_node)
      expect(node.link_back).to be a_node
    end

    it "Can remove link to next node" do
      a_node = Node.new(3)
      node.insert_after(a_node)
      node.remove_after
      expect(node.reference).to be nil
    end

    it "Can remove link to previous node" do
      a_node = Node.new(3)
      node.insert_before(a_node)
      node.remove_before
      expect(node.link_back).to be nil
    end
  end
end
