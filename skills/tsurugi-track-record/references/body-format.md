# 実績の本文の形式

`update_track_record` の本文は、ツール定義に `contentMarkdown` があれば Markdown で、無ければ `content`（TipTap JSON）で送る。どちらか一方だけを渡す。

## Markdown（`contentMarkdown`）

使えるもの:

- 見出し: `##`（大見出し）、`###`（小見出し）
- 段落、改行、`**太字**`、`*斜体*`、`~~打ち消し線~~`
- 箇条書き `-`、番号付きリスト `1.`、引用 `>`、区切り線 `---`
- 画像: `![説明](https://...)` を前後に文字を置かず 1 行で書く。URL は Web でアップロード済みのもの
- YouTube: URL だけを 1 行で書くと埋め込みになる
- PDF: `[資料名](https://....pdf)` だけを 1 行で書く

使えないもの:

- 表（エラーになる）
- リンクとコード（ただの文字として残る）

## TipTap JSON（`content`）

ルートは `{"type":"doc","content":[...]}`。

```json
{"type":"doc","content":[
  {"type":"heading","attrs":{"level":2},"content":[{"type":"text","text":"背景・課題"}]},
  {"type":"paragraph","content":[{"type":"text","text":"本文の段落。"},{"type":"text","text":"強調したい語","marks":[{"type":"bold"}]}]}
]}
```

使えるノード:

| 要素 | 書き方 |
|---|---|
| 段落 | `{"type":"paragraph","content":[テキスト...]}` |
| テキスト | `{"type":"text","text":"..."}`。`text` は空にしない |
| 太字など | テキストに `"marks":[{"type":"bold"}]`（`bold`・`italic`・`strike`・`underline`） |
| 見出し | `{"type":"heading","attrs":{"level":2},"content":[...]}`。level は 2 か 3 |
| 改行 | `{"type":"hardBreak"}` |
| 箇条書き | `{"type":"bulletList","content":[{"type":"listItem","content":[段落...]}]}` |
| 番号付きリスト | `{"type":"orderedList","attrs":{"start":1},"content":[listItem...]}` |
| 引用 | `{"type":"blockquote","content":[段落...]}` |
| 区切り線 | `{"type":"horizontalRule"}` |
| 画像 | `{"type":"figure","attrs":{"src":"https://...","alt":"説明"}}` |
| YouTube | `{"type":"youtube","attrs":{"src":"https://www.youtube.com/watch?v=..."}}` |
| PDF | `{"type":"pdfLink","attrs":{"href":"https://....pdf","title":"資料名"}}` |
