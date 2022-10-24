require_relative "./PolyTreeNode.rb"
class KnightPathFinder

    def self.valid_moves(pos)
        moves = [[2,1],[2,-1],[1,2],[1,-2],[-1,2],[-1,-2],[-2,-1],[-2,1]]
        valid_m = []
        x = pos[0]
        y = pos[1]
        moves.each do |move|
            new_x = move[0] + x 
            new_y = move[1] + y 
            ##[2,-1] --> 
            if new_x >= 0 && new_x <= 7 && new_y >= 0 && new_y <= 7
                valid_m << [new_x, new_y]
            end

        end
        valid_m
    end

    def initialize(starting_pos)
        @considered_positions = [starting_pos]
        @starting_pos = starting_pos
        build_move_tree
    end

    def new_move_positions(pos)
        new_moves = []
        moves = KnightPathFinder.valid_moves(pos)
        moves.each do |move|
            if !@considered_positions.include?(move)
                new_moves << move
                @considered_positions << move
            end
        end 
        new_moves
    end


    def build_move_tree
        #set root node equal to starting pos
        #queue with root,
        root = PolyTreeNode.new(@starting_pos)
         queue = [root]
            #until loop through queue
            until queue.empty?
                shifted = queue.shift
                new_move_positions(shifted.value).each do |move|
                    k = PolyTreeNode.new(move)
                    shifted.add_child(k)
                    #add as a child to parent
                    queue << k

                end
               
            end
         @considered_positions.length
    end
end