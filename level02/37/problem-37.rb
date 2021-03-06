# Problem 37

def check_if_prime(n)
  return false if n <= 1
  return true if n == 2
  return false if n != 2 && n % 2 == 0
 
  limit = Math.sqrt(n).ceil
  3.step(limit, 2) do |i|
    return false if n % i == 0
  end

  return true
end

def trancatable_ltor(str)
  (str.length).times do |i|
    return false if !check_if_prime(str.slice(i, str.length-i).to_i)
  end
  return true
end

def trancatable_rtol(str)
  (str.length).times do |i|
    return false if !check_if_prime(str.slice(0, str.length-i).to_i)
  end
  return true
end


answer = []

i = 10
loop do
  i = i + 1

  str = i.to_s
  next if !trancatable_ltor(str)
  next if !trancatable_rtol(str)
  
  answer.push(i)
  break if answer.length >= 11
end

puts answer.to_s
puts answer.inject(:+).to_s
