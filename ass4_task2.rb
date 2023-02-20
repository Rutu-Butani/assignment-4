puts "Enter the first number:"
num1 = gets.chomp.to_f
puts "Enter the second number:"
num2 = gets.chomp.to_f

puts "Enter the operation (+, -, *, /):"
operation = gets.chomp

case operation
when "+"
  operation_proc = Proc.new { |x, y| x + y }
when "-"
  operation_proc = Proc.new { |x, y| x - y }
when "*"
  operation_proc = Proc.new { |x, y| x * y }
when "/"
  operation_proc = Proc.new { |x, y| x / y }
else
  puts "Invalid operation."
end

if operation_proc
  result = operation_proc.call(num1, num2)
  puts "The result is #{result}."
end

