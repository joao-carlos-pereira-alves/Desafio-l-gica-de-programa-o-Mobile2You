expression = '<<.<<..>><>><.>.>.<<.>.<.>>>><>><>>'

diamonds = 0
sand = 0
stack = []

expression.each_char do |char|
  case char
  when '<'
    stack.push(char)
  when '>'
    if stack[-1] == '<'
      stack.pop
      diamonds += 1
    else
      stack.push(char)
    end
  when '.'
    sand += 1
  end

  while stack.length >= 2 && stack[-2..-1] == ['<', '>']
    stack.pop(2)
    diamonds += 1
    stack.push('<', '>')
  end
end

puts "Diamantes extraídos: #{diamonds}"
puts "Areias encontradas: #{sand}"