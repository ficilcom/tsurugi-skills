# tsurugi-skills

[剣-TSURUGI-](https://tsurugi.marketing) を AI から使うためのスキル集です。AI に Tsurugi の MCP サーバーをつなぎ、これらのスキルを入れると、実績ポートフォリオの作成、受注者プロフィールの整備、案件探しと応募、案件メッセージへの対応を手伝ってもらえます。

Claude Code・Codex・Claude アプリ（claude.ai／Claude Desktop）で使えます。

## スキル一覧

| スキル | できること |
|---|---|
| `tsurugi-mcp` | Tsurugi MCP への接続と、使うときの共通ルール |
| `tsurugi-track-record` | 実績（ポートフォリオ記事）を聞き取りから下書き・公開まで作る。既存の実績の改善 |
| `tsurugi-provider-profile` | 受注者プロフィールを、応募できる条件を満たす内容に整える |
| `tsurugi-order-application` | 案件を探して応募し、応募後の最初のメッセージ（提案）を書く |
| `tsurugi-messages` | 案件メッセージの未読を確かめ、返信案を作って送る |

## 使い始める

1. Tsurugi のアカウントを用意する
2. AI に Tsurugi の MCP サーバー（`https://tsurugi.marketing/mcp`）をつなぐ
3. スキルを入れる

詳しい接続手順は [skills/tsurugi-mcp/references/connect.md](skills/tsurugi-mcp/references/connect.md) にあります。

### Claude Code

MCP をつなぐ:

```bash
claude mcp add --transport http --scope user tsurugi https://tsurugi.marketing/mcp
```

Claude Code を起動して `/mcp` から `tsurugi` にログインします。

スキルを入れる（Claude Code 2.1.275 以降）:

```
/plugin install tsurugi --marketplace ficilcom/tsurugi-skills
```

それより前のバージョン:

```
/plugin marketplace add ficilcom/tsurugi-skills
/plugin install tsurugi@tsurugi-skills
```

スキルは話しかけるだけで自動で使われます。明示的に呼ぶときは `/tsurugi:tsurugi-track-record` のように指定します。

### Codex

MCP をつなぐ:

```bash
codex mcp add tsurugi --url https://tsurugi.marketing/mcp
codex mcp login tsurugi
```

スキルを入れる（`~/.agents/skills/` に置く）:

```bash
git clone https://github.com/ficilcom/tsurugi-skills.git
mkdir -p ~/.agents/skills
cp -R tsurugi-skills/skills/tsurugi-* ~/.agents/skills/
```

更新するときは `git pull` のあとに同じコピーをやり直します。

### Claude アプリ（claude.ai・Claude Desktop）

MCP をつなぐ: 「Customize」→「Connectors」→「Add custom connector」で URL に `https://tsurugi.marketing/mcp` を入力し、Tsurugi にログインします。

スキルを入れる:

1. [最新のリリース](https://github.com/ficilcom/tsurugi-skills/releases/latest) から、各スキルの ZIP（例: `tsurugi-track-record.zip`）をダウンロードする
2. 「Customize」→「Skills」→「+」→「Upload a skill」で ZIP を 1 つずつアップロードし、オンにする

スキルを使うには、設定で「Code execution and file creation」をオンにしておく必要があります。

## 話しかけ方の例

- 「この前のリスティング広告の改善事例を、Tsurugi の実績にしたい」
- 「Tsurugi の実績を見直して、足りないところを教えて」
- 「Tsurugi の受注者プロフィールを、応募できる状態にして」
- 「Tsurugi で BtoB の広告運用の案件を探して」
- 「Tsurugi の未読メッセージを確認して」

## 安心して使うために

- 公開・応募・メッセージ送信・削除などの前に、AI は必ず内容を見せて確認を求めます。
- MCP で扱えるのは個人アカウントの情報だけです。企業アカウントの操作や画像のアップロードは Web の画面で行います。
- Tsurugi 側の対応状況によって MCP から使えない操作があるときは、AI が Web の画面を案内します。

## 開発者向け

```
.claude-plugin/      # Claude Code のマーケットプレイス定義とプラグイン定義
skills/<name>/       # スキル本体（SKILL.md と参照資料）
template/SKILL.md    # 新しいスキルの雛形
scripts/             # Claude アプリ用の ZIP 作成
```

スキルの追加・変更のルールは [.claude/CLAUDE.md](.claude/CLAUDE.md) を参照してください。`v*` のタグを push すると、各スキルの ZIP を添付したリリースが作られます。

## ライセンス

[Apache License 2.0](LICENSE)
