// showybox 用の再利用テンプレート: `law`
// 使い方:
//   #import "templates/showybox.typ": law
//   #law(title: "法則の名前")[ ここに本文 ]

// 元パッケージを取り込み、`law` マクロを定義します。
#import "@preview/showybox:2.0.4": showybox

// `law` はタイトルと本文（content block）を受け取り、
// 既定の olive テーマで showybox を呼び出します。
#let law(title: none, body, frame: (
	border-color: olive,
	title-color: olive.lighten(10%),
	body-color: olive.lighten(95%),
	footer-color: olive.lighten(80%),
), footer: none) = {
	if footer == none [
		#showybox(title: title, frame: frame)[#body]
	] else [
		#showybox(title: title, frame: frame, footer: footer)[#body]
	]
}

// カスタマイズしたい場合は、呼び出し時に frame を上書きできます:
// #law(title: "例", frame: (border-color: red))[本文]

// 定義用の showybox ラッパー: `def`
// 使い方:
//   #import "templates/showybox.typ": def
//   #def(title: "定義の名前")[ ここに定義本文 ]
// 色は olive を参考に、人間に見やすい落ち着いたトーンにしています。
#let def(title: none, body, frame: (
	// 緑っぽくない落ち着いた色としてインディゴ系のカラーを採用します。
	// 数値指定で色を作り、`.lighten(...)` を使います。
	border-color: rgb(79, 70, 229),
	title-color: rgb(79, 70, 229).lighten(10%),
	body-color: rgb(79, 70, 229).lighten(95%),
	footer-color: rgb(79, 70, 229).lighten(80%),
), footer: none) = {
	if footer == none [
		#showybox(title: title, frame: frame)[#body]
	] else [
		#showybox(title: title, frame: frame, footer: footer)[#body]
	]
}


// 問題（例題）用の showybox ラッパー: `problem`
// 色は付けず、単に枠で囲むだけのスタイルにします。
#let problem(title: none, body, frame: (
	border-color: black,
	title-color: black,
	footer-color: black,
), footer: none) = {
	if footer == none [
		#showybox(title: title, frame: frame)[#body]
	] else [
		#showybox(title: title, frame: frame, footer: footer)[#body]
	]
}


// 定理用の showybox ラッパー: `thm`
// 新しいベースカラーを使い、他のラッパーと同じ `.lighten(...)` のバランスを保ちます。
// ここでは落ち着いたティール系の色を採用します（既存の olive / indigo と異なる色）。
#let thm(title: none, body, frame: (
	border-color: rgb(220, 38, 38),
	title-color: rgb(220, 38, 38).lighten(10%),
	body-color: rgb(220, 38, 38).lighten(95%),
	footer-color: rgb(220, 38, 38).lighten(80%),
), footer: none) = {
	if footer == none [
		#showybox(title: title, frame: frame)[#body]
	] else [
		#showybox(title: title, frame: frame, footer: footer)[#body]
	]
}

