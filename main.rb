# main.rb

require_relative 'lib/enumerable_methods'

puts "----- my_each -----"
[1, 2, 3].my_each { |x| puts "x = #{x}" }

puts "\n----- my_select -----"
result = [1, 2, 3, 4, 5].my_select { |x| x.even? }#.even? en Ruby verifica si un número es par. Retorna true si el número es par y false si no lo es.
puts result.inspect  # => [2, 4]

puts "\n----- my_map -----"
result = [1, 2, 3].my_map { |x| x * 2 }
puts result.inspect  # => [2, 4, 6]

puts "\n----- my_all? -----"
puts [2, 4, 6].my_all? { |x| x.even? }    # => true
puts [2, 3, 4].my_all? { |x| x.even? }    # => false

puts "\n----- my_any? -----"
puts [1, 3, 5].my_any? { |x| x.even? }    # => false
puts [1, 4, 5].my_any? { |x| x.even? }    # => true

puts "\n----- my_none? -----"
puts [1, 3, 5].my_none? { |x| x.even? }   # => true
puts [1, 4, 5].my_none? { |x| x.even? }   # => false

puts "\n----- my_count -----"
puts [1, 2, 3, 4].my_count                # => 4
puts [1, 2, 3, 4].my_count { |x| x > 2 }  # => 2

puts "\n----- my_inject -----"
sum = [1, 2, 3, 4].my_inject { |acc, num| acc + num }
puts sum                                  # => 10
product = [1, 2, 3, 4].my_inject(1) { |acc, num| acc * num }
puts product                              # => 24
