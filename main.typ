#import "@preview/showybox:2.0.4": showybox
#import "templates/showybox.typ": law, def

#show regex("[\p{scx:Han}\p{scx:Hira}\p{scx:Kana}]"): set text(font: "Zen Old Mincho")

#set document(
  title: [電磁気学 シケプリ]
)

#title()

== はじめに

== 静電場

=== クーロンの法則

クーロンの法則を以下に示す。実験的に発見された法則であり、高校でも習っているはずなので、詳細な説明は省略する。

#law(title: "クーロンの法則", footer: [$epsilon_0$: 真空での誘電率])[ 
  位置$bold(r_1)$に電荷$bold(q_1)$、位置$bold(r_2)$に電荷$bold(q_2)$が存在するとき、$bold(r_1)$の位置にいる電荷は、以下の力$bold(F)_(1 2)$を受ける。

  $ bold(F)_(1 2) = 1/(4 pi epsilon_0) (q_1q_2)/(||bold(r_1)-bold(r_2)||^2) (bold(r_1)-bold(r_2))/(||bold(r_1)-bold(r_2)||) $
]

補足しておくが、この力の大きさは、$1/(4 pi epsilon_0) (q_1q_2)/(||bold(r_1)-bold(r_2)||^2)$の部分で規定されている。向きは、$(bold(r_1)-bold(r_2))/(||bold(r_1)-bold(r_2)||)$で示される、$bold(r_2)$から$bold(r_1)$へ向かう単位ベクトルの方向である。
$q_1$と$q_2$が同符号の場合、$q_1$は$q_2$から遠ざかる向きに力を受け、異符号の場合は近づく向きに力を受ける。

ここで、$q_1$とそれ以外を分離することによって、$q_2$が$bold(r_1)$に作る電場$bold(E_2)$が定義できる。

#def(title: [$q_2$が$bold(r_1)$に作る電場])[ 
  $ bold(E_2) := 1/(4 pi epsilon_0) q_2/(||bold(r_1)^2-bold(r_2)||^2) (bold(r_1)-bold(r_2))/(||bold(r_1)-bold(r_2)||) $
]

これにより、$F_(1 2) = q_1 bold(E_2)$とできる。ここで重ね合わせの原理が適用でき、電荷が$n$個ある場合でも、各電荷が作る電場を足し合わせることで全体の電場を求めることができる。($n$個の場合の表式は省略する。)

ここで、連続的な電荷分布が作る電場を考える。位置$bold(x)$における、単位体積当たりの電荷密度を$rho(bold(x))$とする。このとき、微小体積$dif V$内に含まれる電荷は$rho(bold(x)) dif V$であり、この電荷が作る電場を足し合わせることで、連続分布している電荷全体が作る電場を求めることができる。

#def(title: [連続分布する電荷が作る電場],
footer: [注: この積分においては$bold(x)$が$V$全体を走っている。])[ 
  立体$V$内に分布する電荷密度$rho(bold(x))$の電荷が、位置$bold(r)$に作る電場は、
  $ bold(E)(bold(r)) := integral.triple_V 1/(4 pi epsilon_0) rho(bold(x))/(||bold(r)-bold(x)||^2) (bold(r)-bold(x))/(||bold(r)-bold(x)||) dif V $
]

点電荷についてもディラックのデルタ関数を用いることで、積分による電場の定義が可能である。

電場$bold(E)$が時間依存しない場合、これを静電場と呼ぶ。以下、主に静電場について議論する。

=== ガウスの法則

