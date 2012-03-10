# hw part1 palindrome

class Numeric
  @@currencies = { 'dollar' => 1.0, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019 }
  def method_missing(method_id, *args)
    from = method_id.to_s
    singular_from = from.gsub( /s$/, '')
    if from == 'in'
      to =  args[0].to_s
      singular_to = to.gsub( /s$/, '')
      if @@currencies.has_key?(to)
        to = to
      elsif @@currencies.has_key?(singular_to)
        to = singular_to
      else
        super
      end
      return self / @@currencies[to]
    end
    if @@currencies.has_key?(from)
      from = from
    elsif @@currencies.has_key?(singular_from)
      from = singular_from
    else
      super
    end
    self * @@currencies[from]
  end
end 

puts 5.dollars.in(:euros) ==  5 / 1.292
puts 10.euros.in(:rupees) == 10 * 1.292 / 0.019
puts 1.dollar.in(:rupees) == 1 / 0.019
puts 10.rupees.in(:euro) == 10 * 0.019 / 1.292

class String
  def palindrome?
    new_string = self.gsub(/\W/,'').downcase.reverse
    return self.gsub(/\W/,'').downcase == new_string
  end
end

puts 'foo'.palindrome?
puts "A man, a plan, a canal -- Panama".palindrome?

module Enumerable
  def palindrome?
    if self.reverse == self
      true
    else
      false
    end
  end
end

puts [1,2,3,2,1].palindrome?
puts [1,2,3,1,1].palindrome?
