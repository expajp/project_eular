# coding: utf-8
# Problem 70

=begin
オイラーのトーティエント関数 φ(n) (ファイ関数とも呼ばれる) とは, n 未満の正の整数で n と互いに素なものの個数を表す. 例えば, 1, 2, 4, 5, 7, 8 は9未満で9と互いに素であるので, φ(9) = 6 となる. 
1 は全ての正の整数と互いに素であるとみなされる. よって φ(1) = 1 である.

面白いことに, φ(87109)=79180 であり, 87109は79180を置換したものとなっている.

1 < n < 107 で φ(n) が n を置換したものになっているもののうち, n/φ(n) が最小となる n を求めよ.
=end

def prime?(n)
  return false if n <= 1
  return true if n == 2
  return false if n != 2 && n % 2 == 0
 
  limit = Math.sqrt(n).ceil
  3.step(limit, 2) do |i|
    return false if n % i == 0
  end

  return true
end

def primes(max)
  return [] if max < 2
  ret = [2]
  3.step(Math.sqrt(max).floor, 2) do |i|
    ret.push(i) if prime?(i)
  end
  return ret
end

def prime_factors(n)
  ret = []
  @primes.each do |p|
    while n%p == 0 do
      n = n/p
      ret.push(p)
    end
  end
  ret.uniq
end

def totient(n)
  return n-1 if prime?(n) # [*1..n-1] if prime?(n)

  ret = n
  pfs = prime_factors(n)
  pfs.each do |pf|
    ret = ret*(pf-1)/pf 
  end
  ret
end

def permutation?(n, m)
  arr = n.to_s.split('').permutation(n.to_s.length).to_a.select{ |a| a[0] != 0 }.map{ |a| a.inject(:+).to_i }
  # p arr
  arr.include?(m)
end

max = 10**7
@primes = primes(max)
answer = max
combi_primes = @primes.combination(2).to_a

combi_primes.each do |combi|
  pp = combi.inject(:*) # primes_product
  f = pp/totient(pp).to_f
  if f < answer
    p "combi = #{combi}, pp = #{pp}, f = #{f}"
    answer = pp
  end
end
p answer
