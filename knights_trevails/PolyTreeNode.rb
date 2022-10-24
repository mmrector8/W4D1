class PolyTreeNode
    attr_reader :parent, :children, :value

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        #add the parent's children array and delete the current node
        return if self.parent == node

        if node == nil
            @parent.children.select!{|child| child != self}
            @parent = nil
        elsif self.parent == nil
            @parent = node
        else
             self.parent.children.select!{|nodes| nodes != self}
             @parent = node
        end

        node.children << self if node != nil && !node.children.include?(self)

    end

    def add_child(node)
        children << node
        node.parent=(self)
    end

    def remove_child(node)
        if !self.children.include?(node)
            raise 'Not a child'
        else
            node.parent=(nil)
        end
    end



    def dfs(target)

        return self if self.value == target
        return nil if self.children == nil

        self.children.each do |child|
            df = child.dfs(target)
            return df if df != nil
        end
        return nil

    end

    def bfs(target)
        queue_arr = [self]
        
        while queue_arr.length > 0
            first_val = queue_arr.shift

            if first_val.value  == target
                return first_val
            else
                first_val.children.each do |child|
                    queue_arr << child
                end
            end    
        end
    end

end