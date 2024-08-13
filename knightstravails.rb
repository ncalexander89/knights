# frozen_string_literal: true

# BFS as we want to check if any next moves find the end point
# DFS will keep iterating until it ends in nil

require 'pry'
class Knight # rubocop:disable Style/Documentation
  attr_accessor :start_pos, :end_pos

  def initialize(start_pos, end_pos)
    @start_pos = start_pos
    @end_pos = end_pos
    @board_size = Array.new(8) { Array.new(8, false) } # Creates an 8x8 board with false values
    @moves = [[2, 1], [1, 2], [-1, -2], [-2, -1], [-2, 1], [-1, 2], [1, -2], [2, -1]]
  end

  def valid_pos?(pos)
    pos[0].between?(0, 7) && pos[1].between?(0, 7) # Check between board size
  end

  def bfs # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
    return [start_pos] if start_pos == end_pos

    queue = [[start_pos, [start_pos]]] # Starting position, path
    @board_size[start_pos[0]][start_pos[1]] = true # Sets starting position on board as true

    until queue.empty?
      # Shift removes and returns first element from queue (touple)
      # current pos = [0,0] path = [[0,0]]

      current_pos, path = queue.shift # Empties Queue

      @moves.each do |move|
        new_pos = [current_pos[0] + move[0], current_pos[1] + move[1]]
        new_path = path + [new_pos] # [[0,0],[2,1]]

        return new_path if new_pos == end_pos # Returns path when end pos found, exits entire bfs method

        if valid_pos?(new_pos) && !@board_size[new_pos[0]][new_pos[1]] # Check within board and false board pos (not visited) # rubocop:disable Layout/LineLength
          queue << [new_pos, new_path] # Pushes into Queue = [[2,1], [[0,0],[2,1]]]
          @board_size[new_pos[0]][new_pos[1]] = true # Sets new position as visited
        end
      end
    end
  end
end

kt = Knight.new([0, 0], [7, 6])
moves_path = kt.bfs
puts "Path from #{kt.instance_variable_get(:@start_pos)} to #{kt.instance_variable_get(:@end_pos)}:"
moves_path.each_with_index do |pos, index|
  puts "Move #{index}: #{pos}"
end
