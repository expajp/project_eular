# coding: utf-8
# Problem 50

=begin
n以下の素数のうち、連続する最長の素数列の和で表せるものを求める

2から順番に素数の入った配列を作っていく
→素数列の入った配列の末尾に次の素数を追加していく

ある素数列に対して、連続する素数列の和を求めてリストアップする
素数列に次に大きい素数を一つ追加する
新しく追加される「連続する素数列の和」は、
「元の素数列の最大値を含む和」に「新しく追加した素数」を足したモノ
になる
よって、これを帰納的に繰り返してnを超えた時点でストップする

列の長さ、和、含まれる最大の素数をセットで持っておく必要がある
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

def hash_fac(sum, chain, min, max)
  ret = Hash.new
  ret["sum"] = sum
  ret["chain"] = chain
  ret["min"] = min
  ret["max"] = max
  return ret
end

def prime_chain(n)
  hash_arr = Array.new
  hash_arr.push(hash_fac(2,1,2,2))
  return hash_arr[0] if n < 5
  
  i = 3
  prime_chain = hash_fac(0,0,0,0)
  loop do
    if prime?(i)
      dup = hash_arr.dup
      dup.each_with_index do |h|
        next if h["sum"]+i > n
        next_hash = hash_fac(h["sum"]+i, h["chain"]+1, h["min"], i)
        if next_hash["chain"] > prime_chain["chain"] && prime?(next_hash["sum"])
          prime_chain = next_hash
        end
        hash_arr.push(next_hash)
      end
      hash_arr.push(hash_fac(i, 1, i, i))
      hash_arr = hash_arr.select{ |h| h["max"] == i }
    end
    i = i + 2
    break if i > n
  end
  return prime_chain
end

chain = prime_chain(1000000)
puts chain.to_s
