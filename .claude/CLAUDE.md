# CLAUDE.md

剣-TSURUGI-（tsurugi.marketing）を使うエンドユーザー（個人マーケター・フリーランス・代理店・事業会社）向けの公開スキル集。ユーザーが自分の AI（Claude Code・Codex・Claude アプリ）に Tsurugi の MCP サーバーをつなぎ、実績・受注者プロフィール・案件・応募・メッセージを扱えるようにする。

Claude Code ではリポジトリのルートがそのままプラグイン `tsurugi` になる。Codex には `skills/` のフォルダをコピーし、Claude アプリには各スキルの ZIP をアップロードして使う。

## 公開リポジトリとしての注意

このリポジトリは public。以下を書かない・コミットしない:

- 認証情報、API キー、トークン、接続文字列
- 社内ホスト名、IP アドレス、開発環境・検証環境の URL
- 未リリースの機能や計画
- 非公開リポジトリのコード、内部設計、社内のファイルパス
- 顧客情報・個人情報

書いてよいのは、公開ドメイン（tsurugi.marketing）、Web 画面に表示される文言、MCP のツール名など利用者が見られる情報だけ。

## スキルの書き方

- 1 スキル = `skills/<skill-name>/SKILL.md`。雛形は `template/SKILL.md`
- `<skill-name>` は `tsurugi-` で始まる kebab-case にし、frontmatter の `name` と一致させる（Codex と Claude アプリには名前空間が無いため）
- frontmatter は `name` と `description` だけにする（Claude アプリへのアップロードで他のキーはエラーになる）。`description` は 1024 文字以内で、「いつ使うか」とユーザーが言いそうな言い方を書く
- 本文は日本語。MCP ツールの入力仕様は書き写さず、実行時のツール定義に従わせる。スキルには流れ・判断・確認ポイント・書き方のコツを書く
- 使うツールがサーバーに無い場合に、Web の画面を案内する手順を入れる
- 公開・応募・送信などの相手に見える操作と、削除・辞退・承諾・却下などの取り消せない操作は、ユーザーの明示的な指示があってから実行させる
- 各スキル単体でも動くように書く。`SKILL.md` は短く保ち、長い資料は同じフォルダの `references/` に置いてリンクする

## 変更時の手順

1. スキルを追加・変更したら `.claude-plugin/plugin.json` の `version` を上げる（上げないと既存ユーザーに更新が届かない）
2. スキルを追加したら README のスキル一覧を更新する
3. `claude plugin validate --strict .` が通ることを確認する
4. `bash scripts/package-skills.sh` で ZIP が作れることを確認する
