# coding: utf-8
# Problem 100

=begin
箱の中に15個の青い円盤と6個の赤い円盤からなる21個の色のついた円盤が入っていて, 無作為に2つ取り出すとき, 青い円盤2つを取り出す確率P(BB)は

P(BB) = (15/21) × (14/20) = 1/2
であることがわかる.

無作為に2つ取り出すとき, 青い円盤2つを取り出す確率がちょうど1/2となるような次の組み合わせは, 箱が85個の青い円盤と35個の赤い円盤からなるときである.

箱の中の円盤の合計が10^12 = 1,000,000,000,000を超えるような最初の組み合わせを考える. 箱の中の青い円盤の数を求めよ.
--

求める確率は、全体n, 青い円盤mとすると、
  m_C_2 / n_C_2
= (m!/2!(m-2)!) / (n!/2!(n-2)!)
= m!(n-2)! / n!(m-2)!
= m*(m-1) / n*(n-1)
であり、これがちょうど1/2になるとき2*m*(m-1) = n*(n-1)である
これを満たすようなn > 10^12を求める

n*(n-1)は必ず偶数なので、n*(n-1)/2を求め、隣り合った数の積になっているかどうかを調べる
隣り合った数の積であるとき、(平方根の床関数)*(平方根の天井関数)に一致する
この天井関数の側がmである
--

このままだとまったく解けないので、ググる
何度も出てきたペル方程式であることがわかる
平方を含み、整数解を持つディオファントス方程式

右辺が-1である形には解が存在しない場合がある
これを調べて実装する

=end
require 'prime'

