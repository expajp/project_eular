# coding: utf-8
# Problem 76

=begin
5は数の和として6通りに書くことができる:

4 + 1
3 + 2
3 + 1 + 1
2 + 2 + 1
2 + 1 + 1 + 1
1 + 1 + 1 + 1 + 1

2つ以上の正整数の和としての100の表し方は何通りか.
=end

@patterns = [nil, 0]

# get patterns from n and h
def gpfnah(n, h)
  p "n: #{n}, h: #{h}"
  return 1 if h == 1 || n == 1 || n == h
  ret = 0
  [*1..n/h].each do |i|
    ret += gpfnah(n-h*i, h-1)
  end
  return ret
end

# snp = sum notation patterns
def snp(n)
  return @patterns[n] unless @patterns[n].nil?
  @patterns[n] = 0
  [*1..(n/2).floor].each do |i|
    p "#{n}: a. #{snp(i)+1}"
    @patterns[n] += snp(i)+1
  end
  [*(n/2).floor+1..n-1].each do |i|
    pt = gpfnah(n, n-i)
    p "#{n}: b. #{pt}"
    @patterns[n] += pt
  end
  p "@patterns[#{n}] = #{@patterns[n]}"
  @patterns[n]
end

p snp(7)
