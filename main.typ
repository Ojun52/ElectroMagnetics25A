#import "@preview/showybox:2.0.4": showybox
#import "templates/showybox.typ": law, def, problem, thm
#import "@preview/cetz:0.3.1": canvas, draw, coordinate

#show regex("[\p{scx:Han}\p{scx:Hira}\p{scx:Kana}]"): set text(font: "Zen Old Mincho")

#set document(
  title: [電磁気学 シケプリ]
)

#title()

== はじめに

電磁気学のシケプリを作りました。細かい導出などはしていませんが、重要な法則や定義、例題などをまとめています。授業についていけなくなったときに振り返るためなどに使ってください。

なお、このような文書で図を描く場合tikzやcetzなどを使うのが一般的ですが、僕の学習コストが高すぎてやめました。あまり図がありませんがご了承ください。

定義、物理法則、数学定理はそれぞれ、青色、緑色、赤色の枠で囲んでいます。

== 静電場

=== クーロンの法則

クーロンの法則を以下に示す。実験的に発見された法則であり、高校でも習っているはずなので、詳細な説明は省略する。

#law(title: "クーロンの法則", footer: [ $epsilon_0$: 真空での誘電率 ])[ 
  位置 $bold(r_1)$ に電荷 $bold(q_1)$、位置 $bold(r_2)$ に電荷 $bold(q_2)$ が存在するとき、 $bold(r_1)$ の位置にいる電荷は、以下の力 $bold(F)_(1 2)$ を受ける。

  $ bold(F)_(1 2) = 1/(4 pi epsilon_0) (q_1q_2)/(||bold(r_1)-bold(r_2)||^2) (bold(r_1)-bold(r_2))/(||bold(r_1)-bold(r_2)||) $
]

補足しておくが、この力の大きさは、 $1/(4 pi epsilon_0) (q_1q_2)/(||bold(r_1)-bold(r_2)||^2) $ の部分で規定されている。向きは、 $ (bold(r_1)-bold(r_2))/(||bold(r_1)-bold(r_2)||) $ で示される、 $bold(r_2)$ から $bold(r_1)$ へ向かう単位ベクトルの方向である。
 $q_1$ と $q_2$ が同符号の場合、 $q_1$ は $q_2$ から遠ざかる向きに力を受け、異符号の場合は近づく向きに力を受ける。

ここで、 $q_1$ とそれ以外を分離することによって、 $q_2$ が $bold(r_1)$ に作る電場 $bold(E_2)$ が定義できる。

#def(title: [ $q_2$ が $bold(r_1)$ に作る電場 ])[ 
  $ bold(E_2) := 1/(4 pi epsilon_0) q_2/(||bold(r_1)^2-bold(r_2)||^2) (bold(r_1)-bold(r_2))/(||bold(r_1)-bold(r_2)||) $
]

これにより、 $F_(1 2) = q_1 bold(E_2)$ とできる。ここで重ね合わせの原理が適用でき、電荷が $n$ 個ある場合でも、各電荷が作る電場を足し合わせることで全体の電場を求めることができる。 ( $n$ 個の場合の表式は省略する。)

ここで、連続的な電荷分布が作る電場を考える。位置 $bold(x)$ における、単位体積当たりの電荷密度を $rho(bold(x))$ とする。このとき、微小体積 $dif V$ 内に含まれる電荷は $rho(bold(x)) dif V$ であり、この電荷が作る電場を足し合わせることで、連続分布している電荷全体が作る電場を求めることができる。

#def(title: [ 連続分布する電荷が作る電場 ],
footer: [ 注: この積分においては $bold(x)$ が $V$ 全体を走っている。 ])[ 
  立体$V$内に分布する電荷密度$rho(bold(x))$の電荷が、位置$bold(r)$に作る電場は、
  $ bold(E)(bold(r)) := integral.triple_V 1/(4 pi epsilon_0) rho(bold(x))/(||bold(r)-bold(x)||^2) (bold(r)-bold(x))/(||bold(r)-bold(x)||) dif V $
]

点電荷についてもディラックのデルタ関数を用いることで、積分による電場の定義が可能である。

電場$bold(E)$が時間依存しない場合、これを静電場と呼ぶ。以下、主に静電場について議論する。

=== ガウスの法則

静電場について、次のガウスの法則が成り立つ。

#law(title: "積分形のガウスの法則", footer: [ 授業ではよく、 $bold(n) dif S = dif bold(s)$ と表記される。シケプリでも $dif bold(s)$ という記法は使おうと思う。 ])[ 
  任意の閉曲面 $S$ に対して、その内部の領域を $V$、電荷密度を $rho(bold(x))$ とするとき、静電場 $bold(E)$ の $S$ 上での面積分について、以下が成り立つ。
  $ integral.double_S bold(E) dot bold(n) dif S = 1/epsilon_0 integral.triple_V rho(bold(x)) dif V $
  となる。ここで、$bold(n)$は$S$の外向き単位法線ベクトルである。
]

ここで、右辺の積分$integral.triple_V rho(bold(x)) dif V$は、領域$V$内に含まれる全電荷量を表している。

対称性のよい場合では、左辺の面積分が非常に簡単に計算できるため、電場を計算することが非常に容易になる。一般には、電場の定義により積分することで電場を計算できるが、この積分計算は煩雑になることが多い。そのような場合、ガウスの法則を用いるのが便利である。

#problem(title: "例題1: 一様帯電球が作る電場")[ 
  半径 $a$、体電荷密度 $rho_0$ の一様帯電球が作る電場 $bold(E)$ を、ガウスの法則を用いて求めよ。
]

(解) 対称性より、電場 $bold(E)$ の大きさは原点からの距離 $r$ のみに依存し、 $bold(r)$ 方向を向く。すなわち,

$ bold(E) = E(r) dot bold(n) $

と書ける。ただし、 $bold(n)$ は位置 $bold(r)$ における、球に対する外向き単位法線ベクトルである。

閉曲面 $S$ を、球の中心Oを中心とする半径 $r$ の球とすると、ガウスの法則より、

$
integral.double_S bold(E) dot dif bold(s) &= integral.double_S E(r) bold(n) dot bold(n) dif bold(s) \
&= 4 pi r^2 E(r)
$

ここで、閉曲面 $S$ 内の荷量は、$Q = (4 pi min{r, a}^3)/3 rho_0$と書けるため、

$ (4 pi min{r, a}^3)/(3 epsilon_0) rho_0 = 4 pi r^2 E(r) $

したがって、$bold(E)$ の大きさは、

$ E(r) = (min{a, r}^3 rho_0)/(3 epsilon_0 r^2) $

$bold(E)$ の向きは $bold(n)$ 。

=== 脱線: ベクトル解析

電磁気学ではベクトル解析が多用される。ここで、授業で扱うベクトル解析の基本的な概念を簡単に説明する。

$nabla$ (ナブラ)は、それぞれの成分に対する偏微分の操作を形式的にベクトルの3成分とみなしたもので、以下のように定義される。

#def(title: [ナブラ ( $nabla$ ) の定義])[ 
  $ nabla := (partial/(partial x), partial/(partial y), partial/(partial z)) $
]

例えば、スカラー関数 $Phi(bold(x))$ に対して、 $nabla Phi$ は以下のように定義される。

#def(title: [スカラー関数の勾配 ( $nabla Phi$ ) の定義], footer: [これは$"grad" Phi$(グラディエント・ファイ)とも表記される。なぜなら、ベクトル $nabla Phi$ は、$Phi$ の等高線に直交し、$Phi$ が増加する方向を向くからである。])[ 
  $ nabla Phi := ((partial Phi)/(partial x), (partial Phi)/(partial y), (partial Phi)/(partial z)) $
]

$nabla$ はベクトルの形をしているので、形式的に「内積」や「外積」をとることができる。一般に、ベクトル場$bold(A)$に対して、$nabla$との内積を取ったものを発散 (divergence) と呼び、外積を取ったものを回転 (rotation) と呼ぶ。

#def(title: [ベクトル場の発散 ( $nabla dot bold(A)$ ) の定義], footer: [これは$"div" bold(A)$(ダイバージェンス・エー)とも表記される。])[ 
  $ nabla dot bold(A) := (partial A_x)/(partial x) + (partial A_y)/(partial y) + (partial A_z)/(partial z) $
]

#def(title: [ベクトル場の回転 ( $nabla times bold(A)$ ) の定義], footer: [これは$"rot" bold(A)$(ローテーション・エー)とも表記される。])[ 
  $ nabla times bold(A) := ((partial A_z)/(partial y) - (partial A_y)/(partial z), (partial A_x)/(partial z) - (partial A_z)/(partial x), (partial A_y)/(partial x) - (partial A_x)/(partial y)) $
]

div や rot を用いると、積分を変換できる次のような定理が成り立つ。

#thm(title: [(ガウスの)発散定理],)[ 
任意のベクトル場 $bold(A)$ と、閉曲面 $S$ に囲まれた領域 $V$ について以下が成り立つ。

$ integral.double_S bold(A) dot dif bold(s) = integral.triple_V nabla dot bold(A) dif V $
]

#thm(title: [(ストークスの)回転定理],)[ 
任意のベクトル場 $bold(A)$ と、曲線 $C$ に囲まれた曲面 $S$ について以下が成り立つ。
$ integral.cont_C bold(A) dot dif bold(s) = integral.double_S (nabla times bold(A)) dot dif bold(s) $
]

証明は省略する。それぞれ微小な直方体、長方形について体積分、線積分を愚直に計算すればよい。