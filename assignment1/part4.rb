class Dessert
  attr_accessor :name, :calories

  def initialize(name, calories)
    @name = name
    @calories = calories
  end

  def healthy?
    return self.calories < 200
  end

  def delicious?
    return true
  end
end

class JellyBean < Dessert
  attr_accessor :flavor

  def initialize(name, calories, flavor)
    super(name, calories)
    @flavor = flavor
  end

  def delicious?
    if self.flavor == 'black licorice' then
      return false
    else 
      return true
    end
  end
end 

b = JellyBean.new('xxx',200,'black licorice')
c = JellyBean.new('xxx',200,'licorice')
a = Dessert.new('xxx',300)
puts a.healthy?
puts a.delicious?
puts b.healthy?
puts b.delicious?
puts c.healthy?
puts c.delicious?
