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

#problem(title: "例題: 一様帯電球が作る電場")[ 
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

#def(title: [ベクトル場の発散 ( $nabla dot bold(A)$ ) の定義], footer: [これは$"div" bold(A)$ (ダイバージェンス・エー)とも表記される。])[ 
  $ nabla dot bold(A) := (partial A_x)/(partial x) + (partial A_y)/(partial y) + (partial A_z)/(partial z) $
]

#def(title: [ベクトル場の回転 ( $nabla times bold(A)$ ) の定義], footer: [これは$"rot" bold(A)$ (ローテーション・エー)とも表記される。$"rot" bold(A) = 0$ のとき、$bold(A)$の線積分は経路によらない。])[ 
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

また、(下付き添え字のみ用いる)Einsteinの縮約記法や、レヴィチヴィタの記号について軽く紹介する。

3次元の2つのベクトル $bold(A)$ 、$bold(B)$ の内積は、

$ bold(A) dot bold(B) = sum_i A_i B_i $

ここで、$A_i$ などは、ベクトル $bold(A)$ の  $x,y,z$ 成分だと思えばよい。このように、同じ「$i$」という添え字をもつ記号の積がある場合、$sum$ を省略して次のように書いても良い。

$ bold(A) dot bold(B) = A_i B_i $

これをEinsteinの縮約記法という。

外積についてこのように記述するために、以下の記号を導入する。

#def(title: [レヴィチヴィタの記号 ( $epsilon_(i j k)$ ) の定義])[ 
  $ epsilon_(i j k) := 
  cases(
    1 "if" (i, j, k) "が" (1, 2, 3) "の偶置換",
    -1 "if" (i, j, k) "が" (1, 2, 3) "の奇置換",
    0 "if" i = j "or" j = k "or" k = i
  )
  $
]

これは外積を便利に記述するための記号で、定義を詳しく覚える必要はない。この記号を用いると、ベクトル $bold(A)$ と $bold(B)$ の外積は、

$ bold(A) times bold(B) = epsilon_(i j k) bold(e)_i A_j B_k $

と書ける。$bold(e)_i$ は $i$ 軸方向の単位ベクトルである。ここで、$i$、$j$、$k$ を添え字としてもつ記号が2回ずつ現れているので、Einsteinの縮約記法により、$i$、$j$、$k$ についての和が自動的に取られる。

最後に、電場と静電ポテンシャルの関係を表すのに重要なベクトル解析の恒等式を示しておく。

#thm(title: [ベクトル解析の恒等式],
footer: [rot $dot$ grad $Phi = 0$ ともいえる。])[ 
  任意のスカラー関数 $Phi$ について、以下が成り立つ。
  $ nabla times (nabla Phi) = 0 $
]

(証明) ベクトル場を $bold(A) = nabla Phi$ とおく。以下、$nabla_i$ は、$i$ 成分の微分を表す。レヴィチヴィタ記号は実数なので、積の順序は交換することに注意して、

$
nabla times bold(A) &= nabla times (nabla Phi) \
&= epsilon_(i j k) e_i nabla_j nabla_k Phi \
&= bold(e)_i (- epsilon_(i k j)) nabla_k nabla_j Phi \
&= - nabla times bold(A)
$

したがって、$nabla times (nabla Phi) = 0$ がいえた。 $square$

=== 静電ポテンシャル

電場 $bold(E)(bold(x))$ 中で、無限遠から電荷 $q$ を点Aまでもってくることを考える。ここで、先ほど定義した電場 $bold(E)$ は力を表しているので、点Aにおける電場による力は $q bold(E)(bold(x))$ である。したがって、無限遠から点Aまで電荷を運ぶ際に外部がする仕事は、

$ W = - integral_infinity^A q bold(E)(bold(x)) dot dif bold(s) $

ここでさりげなく積分の上端と下端に点を用いているが、仕事は線積分によって求められるため、本来は経路が必要である。$nabla times bold(A)$ の定義でも示したが、$nabla times bold(A) = 0$ のとき、$bold(A)$の線積分は経路によらない。ここで、静電場 $bold(E)$ は $nabla times bold(E) = 0$ であることが知られているため、電場 $bold(E)$ による仕事は経路によらない。したがって、2点を示すだけで積分が定まる。

$q=1$ としたときの仕事を静電ポテンシャル $Phi(A)$ と定義する。

#def(title: [静電ポテンシャル $Phi(A)$ の定義])[ 
  電場 $bold(E)(bold(x))$ によって作り出される、点Aにおける静電ポテンシャルは、
  $ Phi(A) := - integral_infinity^A bold(E)(bold(x)) dot dif bold(s) $
]

静電ポテンシャル $Phi(bold(x))$ はスカラー関数であり、電場 $bold(E)$ はこの静電ポテンシャルの勾配によって次のように表される。

#law(title: [電場と静電ポテンシャルの関係])[ 
  任意の位置 $bold(x)$ における電場 $bold(E)(bold(x))$ は、静電ポテンシャル $Phi(bold(x))$ を用いて、以下のように表される。
  $ bold(E)(bold(x)) = - nabla Phi(bold(x)) $
]

ここで、ベクトル解析の恒等式 $nabla times (nabla Phi) = 0$ と合わせると、以下が言える。

#law(title: [静電場の性質],
footer: [「静電場は渦なし」などと表現される。])[ 
  $ nabla times bold(E) = 0 $
]

=== 微分形のガウスの法則

ガウスの法則に発散定理を用いる。

$ 
integral.double_S bold(E) dot dif bold(s) = integral.triple_V nabla dot bold(E) dif V = 1/epsilon_0 integral.triple_V rho(bold(x)) dif V
$

ここで、任意の $V$ について上式が成り立つため、被積分関数についても等式が成り立つ。(例えば $V$ に1点加えても積分が等しいので、その点での被積分関数も等しいはずである。)

したがって、次の法則が成り立つ。

#law(title: [微分形のガウスの法則],
footer: [静電場を前提に議論したが、この法則は電場が時間依存しても成り立つ。])[ 
  任意の位置 $bold(x)$ において、静電場 $bold(E)(bold(x))$ と電荷密度 $rho(bold(x))$ について、以下が成り立つ。
  $ nabla dot bold(E)(bold(x)) = 1/epsilon_0 rho(bold(x)) $
]

これは非常に強力な法則であり、マクスウェル方程式の一つである。さて、電場と静電ポテンシャルの関係式 $bold(E) = - nabla Phi$ を用いると、この法則は、

$
nabla dot (- nabla Phi) = 1/epsilon_0 rho(bold(x))
$

と書き換えられる。ここで、ラプラシアン($laplace$)という演算子を、$laplace := nabla dot nabla = nabla^2$ として定義すると、先ほどの式は以下のように書ける。(ポアソン方程式という。)

#law(title: [ポアソン方程式])[
  任意の位置 $bold(x)$ において、静電ポテンシャル $Phi(bold(x))$ と電荷密度 $rho(bold(x))$ について、以下が成り立つ。
  $ laplace Phi(bold(x)) = - 1/epsilon_0 rho(bold(x)) $
]

また、$rho(bold(x)) = 0$の場所では、以下のラプラス方程式が成り立つ。

#law(title: [ラプラス方程式])[
  任意の位置 $bold(x)$ において、静電ポテンシャル $Phi(bold(x))$ について、以下が成り立つ。
  $ laplace Phi(bold(x)) = 0 $
]

逆に、ポアソン方程式と、$nabla times bold(E) = 0$ を、電場を特徴づける法則とすることもできる。つまり、これらの方程式を満たすベクトル場 $bold(E)$ は、静電場である、と定義できる。

したがって、電場はポアソン方程式を解くことにより求めることもできる。

=== グリーンの恒等式

またベクトル解析の話であるが、次のグリーンの恒等式を紹介しておく。

#thm(title: [グリーンの恒等式],
footer: [いわば、「3次元版部分積分」である。])[ 
  任意のスカラー関数 $Phi(bold(x))$ と $Psi(bold(x))$、および閉曲面 $S$ に囲まれた領域 $V$ について、以下が成り立つ。
  $
  integral.triple_V Phi laplace psi dif V = integral.double_S (Phi nabla psi) dot dif bold(s) - integral.triple_V (nabla Phi) dot (nabla psi) dif V
  $
]

== 磁場

=== 電荷保存則

閉曲面 $S$ 、その中の領域 $V$ について考える。
この領域から流出する正味の電荷について式を立てると、電荷が保存することから以下の式が立てられる。
ただし、電流密度を $bold(j)$ としている。

$
  integral.double_S bold(j) dot dif bold(s) = - (partial)/(partial t) integral.triple_V rho(bold(x), t) dif V
$

左辺に発散定理を適用して移項すると、

$
integral.triple_V (nabla dot bold(j) + (partial rho)/(partial t)) dif V = 0
$

となる。領域 $V$ は任意なので、以下の等式が成り立つ。

#law(title: [微分形の電荷保存則])[
  任意の位置 $bold(x)$ 、時間 $t$ において、電流密度 $bold(j)$ と電荷密度 $rho$ について以下が成り立つ。

  $
    nabla dot bold(j)(bold(x), t) + (partial rho(bold(x), t))/(partial t) = 0
  $
]

=== ビオ・サバールの法則

#law(title: "ビオ・サバールの法則")[ 
  電流素片 $I_2 dif bold(s_2)$ があるとする。
  これが位置 $bold(r_1)$ に作る磁場は、以下のように与えられる。

  $
    dif bold(B)_2 (bold(r_1)) = (mu_0)/(4 pi) (I_2 dif bold(s_2))/norm(bold(r_1) - bold(r_2))^2  times (bold(r_1)-bold(r_2))/(||bold(r_1)-bold(r_2)||)
  $
]

これを線積分すると、次の法則が得られる。

#law(title: "ビオ・サバールの法則 (積分形)", footer: [積分の変数は $bold(s)$ である。])[ 
  電流 $I$ が流れている回路 $C$ があるとする。これが位置 $bold(r)$ に作る磁場は、

  $
    bold(B)(bold(r)) = (mu_0)/(4 pi) integral.cont_C (I dif bold(s))/norm(bold(r) - bold(s))^2  times (bold(r)-bold(s))/(||bold(r)-bold(s)||)
  $

]

これらは、静電場の議論で言うところのクーロンの法則に対応している。

=== ベクトルポテンシャル

ベクトルポテンシャル $bold(A)(bold(r))$ を次のように定める。

#def(title: [ベクトルポテンシャル])[
  $
    bold(A)(bold(r)) = mu_0/(4 pi) integral.triple_V bold(j(bold(x)))/norm(bold(r) - bold(x))^2 dif V
  $
]

このようにすると、$nabla times bold(A) = bold(B)$ が成り立つ。これは、静電場で言うところの静電ポテンシャルに対応している。

ここで、$nabla dot bold(B) = nabla dot (nabla times bold(A)) = 0$ が成り立つ。これは、磁場に対するガウス則とよばれ、マクスウェル方程式の一つである。

証明は省略するが、$nabla dot bold(B) = 0$ は、磁場が時間依存していても成り立つ。

静電ポテンシャルと同様、ベクトルポテンシャルにはいくらかの不定性がある。それを利用して、静磁場では$nabla dot bold(A) = 0$ となるように $bold(A)$ を定めた。

先ほどは $nabla dot bold(B)$ について調べたので、$nabla times bold(B)$ について述べる。静磁場について、以下の法則が成り立つ。

#law(title: [アンペール則])[
  任意の位置 $bold(r)$ において、静磁場 $bold(B)(bold(r))$ と電流密度 $bold(j)(bold(r))$ について、以下が成り立つ。
  $
    nabla times bold(B)(bold(r)) = mu_0 bold(j)(bold(r))
  $
]

(証明) $
nabla times bold(B) &= 
nabla times (nabla times bold(A)) \
&=  nabla(nabla dot bold(A)) - nabla dot nabla bold(A) \
&= 0 - laplace bold(A) \
&= - mu_0/(4 pi) integral.triple_V bold(j(bold(x))) laplace (1/norm(bold(r) - bold(x))) dif V \
&= - mu_0 /(4pi) dot integral.triple_V bold(j(bold(x))) (- 4 pi delta(bold(r) - bold(x))) dif V \
&= mu_0 integral.triple_V bold(j(bold(x))) delta(bold(r) - bold(x)) dif V \
&= mu_0 bold(j)(bold(r))
$

よって示された。 $square$

なお、この途中式より、磁場に対するポアソン方程式を導くことができる。

#law(title: [磁場に対するポアソン方程式])[
  任意の位置 $bold(r)$ において、静磁場 $bold(B)(bold(r))$ と電流密度 $bold(j)(bold(r))$ について、以下が成り立つ。
  $
    laplace bold(A)(bold(r)) = - mu_0 bold(j)(bold(r))
  $
]

=== ローレンツ力

#law(title: [ローレンツ力])[
  位置 $bold(r)$ に電場 $bold(E)$ がかかっているとする。この位置で、電荷が速度 $bold(v)$ で移動しているとする。その位置の電荷密度を $rho$ とすると、位置 $bold(r)$ にかかる単位体積あたりの力は以下のようになる。

  $
    bold(f) = rho (bold(E) + bold(v) times bold(B))
  $
]

(証明) 磁場による微小な力を $dif bold(F)_M$ 、電場による微小な力を $dif bold(F)_E$ とする。

$
dif bold(F)_M = I dif bold(s) times bold(B) = bold(j) dif V times bold(B) = rho bold(v) dif V times bold(B)
$

$
dif bold(F)_E = rho dif V bold(E)
$

全体の力 $bold(F)$ は、

$
  bold(F) = dif bold(F)_E + dif bold(F)_M = rho dif V (bold(E) + bold(v) times bold(B))
$

となる。単位体積あたりで考えると、以下の式が成り立つ。

$
  bold(f) = rho(bold(E) + bold(v) times bold(B))
$

よって、示された。 $square$

=== レンツ・ノイマン則とファラデー則

実験事実として、以下のことがわかっている。

#law(title: [レンツ・ノイマン則])[
  閉曲線 $C$ に囲まれた曲面 $S$ を考える。このとき、時間 $t$ における磁束を、

  $
    Phi(t) = integral.double_S bold(B)(bold(x), t) dot dif bold(s)
  $

  と定義する。このとき、時間 $t$ における誘導起電力 $V^("emf")$ は、以下のように与えられる。

  $
    V^("emf") = - k (d Phi(t))/(d t)
  $

  実際は相対性原理より、比例定数 $k=1$ であることが示されるため、

  $
    V^("emf") = - (d Phi(t))/(d t)
  $

  である。
]

この法則から、次のファラデー則が導かれる。

#law(title: [ファラデー則])[
  任意の閉曲線 $C$ に囲まれた曲面 $S$ について、時間 $t$ における電場 $bold(E)(bold(x), t)$ と磁場 $bold(B)(bold(x), t)$ は、以下の関係を満たす。

  $
    nabla times E = - (partial bold(B))/(partial t)
  $
]

(証明) 閉曲線 $C$ に囲まれた曲面 $S$ を考える。これは固定する（つまり"回路"は動かない）。$C$ および $S$ を固定したことで、レンツ・ノイマン則の全微分は、偏微分として適用してよい。

そもそも起電力の定義より、

$
  V^("emf") = integral.cont_C bold(E)(bold(x), t) dot dif bold(s)
$

である。また、先述した磁束の定義に注意する。
レンツ・ノイマン則にこれらの定義を代入すると、

$
  integral.cont_C bold(E)(bold(x), t) dot dif bold(s) =
  - integral.double_S (partial bold(B)(bold(x), t))/(partial t) dot dif bold(s)
$

である。左辺に回転定理を適用した上で移項すると、

$
  integral.double_S (nabla times bold(E)(bold(x), t) + (partial bold(B)(bold(x), t))/(partial t)) dot dif bold(s) = 0
$

となる。ここで、$S$ は任意だったので、

$
  nabla times bold(E) = - (partial bold(B))/(partial t)
$

が成り立つ。$square$

これはマクスウェル方程式の一つである。

最後のマクスウェル方程式を示す。

#law(title: [アンペール・マクスウェルの法則])[
  任意の位置 $bold(r)$ 、時間 $t$ において、電場 $bold(E)(bold(r), t)$ と静磁場 $bold(B)(bold(r), t)$ 、および電流密度 $bold(j)(bold(r), t)$ について、以下が成り立つ。
  $
    nabla times bold(B) = mu_0 (bold(j) + epsilon_0 (partial bold(E))/(partial t))
  $
]

(証明) 
$
  nabla dot (nabla times bold(B) - mu_0 bold(j)) &= 0 - mu_0 nabla dot bold(j) \
  &= mu_0 (partial rho)/(partial t) \
  &= epsilon_0 mu_0 (partial)/(partial t) (nabla dot bold(E)) \
$

ただし、1行目から2行目には電荷保存則、2行目から3行目にはガウス則を用いた。

$nabla dot$ の中身を比較して、

$
  nabla times bold(B) = mu_0 (bold(j) + epsilon_0 (partial bold(E))/(partial t))
$

が示された。 $square$

以上で、マクスウェル方程式が全て証明できた。
以下に4つのマクスウェル方程式をまとめておく。これらは、時間や空間に関係なく成り立つ。

#law(title: [マクスウェル方程式])[
  $
    nabla dot bold(E) = rho/epsilon_0
  $

  $
    nabla times bold(E) = - (partial bold(B))/(partial t)
  $

  $
    nabla dot bold(B) = 0
  $

  $
    nabla times bold(B) = mu_0 (bold(j) + epsilon_0 (partial bold(E))/(partial t))
  $
] 