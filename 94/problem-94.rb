# coding: utf-8
# Problem 94

=begin
一辺の長さが整数の正三角形は面積が整数にならないことを示すのは簡単である. しかし, 5-5-6の辺を持つ殆ど正三角形に近い擬正三角形 (almost equilateral triangle) は面積が12で整数である.

以降, 二等辺三角形で, 3つめの辺の長さが他と1つしか違わないもの (5-5-6, 5-5-4等) を, 擬正三角形と呼ぶ.

さて, 周囲の長さが1,000,000,000以下の面積が整数になる擬正三角形を考え, その周囲の長さの総和を求めよ.
=end

def square?(n)
  (Math.sqrt(n).floor.to_i)**2 == n
end  

max = 1_000_000_000/3
sum = 0

3.step(max, 2) do |l|
  p l
  [l-1, l+1].each do |bottom|
    height_sq = l*l-bottom*bottom/4
    sum += l*2+bottom if square?(height_sq) && (height_sq%4 == 0 || bottom%4 == 0)
  end
end
p sum
