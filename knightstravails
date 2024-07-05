# BFS as we want to check if any next moves find the end point
# DFS will keep iterating until it ends in nil

require 'pry'

class Knight
    def initialize(start_pos, end_pos)
      @start_pos = start_pos
      @end_pos = end_pos
      @board_size = 8
      @moves = [[2, 1], [1, 2], [-1, -2], [-2, -1], [-2, 1], [-1, 2], [1, -2], [2, -1]]
    end
  
    def valid_pos?(pos)
      pos[0].between?(0, @board_size - 1) && pos[1].between?(0, @board_size - 1)
    end
  
    def bfs(start_pos, end_pos)
      return [start_pos] if start_pos == end_pos
  
      queue = [[start_pos, [start_pos]]]
      visited = Array.new(@board_size) { Array.new(@board_size, false) }
      visited[start_pos[0]][start_pos[1]] = true
  
      until queue.empty?
        # shift removes and returns first element from queue (touple)
        #  current pos == start pos, path == [start post] -- pat]

        current_pos, path = queue.shift

        # binding.pry  # Insert a breakpoint
  
        @moves.each do |move|
          new_pos = [current_pos[0] + move[0], current_pos[1] + move[1]]
          new_path = path + [new_pos]
  
        #   binding.pry  # Insert a breakpoint

          if new_pos == end_pos
            return new_path
          end
  
          if valid_pos?(new_pos) && !visited[new_pos[0]][new_pos[1]]
            queue << [new_pos, new_path]
            visited[new_pos[0]][new_pos[1]] = true
          end
        end
      end
  
    #   []
    end
  
    def check
      bfs(@start_pos, @end_pos)
    end
  end
  
  kt = Knight.new([0, 0], [7, 6])
  moves_path = kt.check
  puts "Path from #{kt.instance_variable_get(:@start_pos)} to #{kt.instance_variable_get(:@end_pos)}:"
  moves_path.each_with_index do |pos, index|
    puts "Move #{index}: #{pos}"
  end
  
