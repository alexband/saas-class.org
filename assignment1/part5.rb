class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s
    attr_reader attr_name
    attr_reader attr_name+"_history"
    class_eval %Q{
        def #{attr_name}=(k)
          @#{attr_name} = k
          if @#{attr_name+"_history"}.is_a?(Array) then
            @#{attr_name+"_history"}.push(k)
          else
            @#{attr_name+"_history"} = [nil, k]
          end
        end
        def #{attr_name+"_history"}
          @#{attr_name+"_history"}
        end
      }
  end
end
  
class Foo
attr_accessor_with_history :bar
end
f = Foo.new
f.bar = 1
f.bar = 2
f.bar = 'a...'
p f.bar_history
p f.bar


