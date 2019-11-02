module Enumerable
    def my_each
        i = 0
        while i < self.length
            yield(self[i])
            i += 1
        end
    end

    def my_each_with_index
        i = 0
        while i < self.length
            yield(self[i], i)
            i += 1
        end
    end

    def my_select
        result = []
        i = 0
        while i < self.length
            if yield(self[i])
                result << self[i]
            end
            i += 1
        end
        result
    end

    def my_all?
        result = true
        i = 0
        while i < self.length
            if !yield(self[i])
                result = false
                break
            end
            i += 1
        end
        result
    end

    def my_any?
        result = false
        i = 0
        while i < self.length
            if yield(self[i])
                result = true
                break
            end
            i += 1
        end
        result
    end

    def my_none?
        result = true
        i = 0
        while i < self.length
            if yield(self[i])
                result = false
                break
            end
            i += 1
        end
        result
    end

    def my_count(*items)
        result = 0
        if items.empty?
            if block_given?
                i = 0
                while i < self.length
                    result += 1 if yield(self[i])
                    i += 1
                end
            else
                result = self.length
            end
        else
            i = 0
            while i < self.length
                result += 1 if self[i] == items[0]
                i += 1
            end
        end
        result
    end

    def my_map
        result = []
        i = 0
        while i < self.length
                result << yield(self[i])
            i += 1
        end
        result
    end

    def my_inject(*items)
        if items.empty?
            initial_value = self[0]
            i = 1
        else
            initial_value = items[0]
            i = 0
        end


        while i < self.length
            initial_value = yield(initial_value, self[i])
            i += 1
        end
        initial_value
    end


end

#my_array = [2,3,4,5]
#my_proc = Proc.new { |x| x * 2}
#puts my_array.my_map(&my_proc)


