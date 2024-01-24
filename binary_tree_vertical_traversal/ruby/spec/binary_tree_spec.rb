# frozen_string_literal: true

require 'rspec'
require_relative '../binary_tree'
require_relative '../tree_node'

describe BinaryTree do
  it 'README example1' do
    root_node = TreeNode.new(value: 3,
                             left: TreeNode.new(value: 9),
                             right: TreeNode.new(value: 20,
                                                 left: TreeNode.new(value: 15),
                                                 right: TreeNode.new(value: 7)))

    result = BinaryTree.new(root_node).vertical_traversal

    expect(result).to eq([[9], [3, 15], [20], [7]])
  end

  it 'README example2' do
    root_node = TreeNode.new(value: 1,
                             left: TreeNode.new(value: 2,
                                                left: TreeNode.new(value: 4),
                                                right: TreeNode.new(value: 5)),
                             right: TreeNode.new(value: 3,
                                                 left: TreeNode.new(value: 6),
                                                 right: TreeNode.new(value: 7)))

    result = BinaryTree.new(root_node).vertical_traversal

    expect(result).to eq([[4], [2], [1, 5, 6], [3], [7]])
  end

  it 'README example3' do
    root_node = TreeNode.new(value: 1,
                             left: TreeNode.new(value: 2,
                                                left: TreeNode.new(value: 4),
                                                right: TreeNode.new(value: 6)),
                             right: TreeNode.new(value: 3,
                                                 left: TreeNode.new(value: 5),
                                                 right: TreeNode.new(value: 7)))

    result = BinaryTree.new(root_node).vertical_traversal

    expect(result).to eq([[4], [2], [1, 5, 6], [3], [7]])
  end
end
