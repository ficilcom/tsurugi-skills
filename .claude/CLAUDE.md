# CLAUDE.md

Tsurugi プロジェクト運用向けスキルを配布する Claude Code プラグインマーケットプレイス。リポジトリのルートがそのままプラグイン `tsurugi` になっている。

## 公開リポジトリとしての注意

このリポジトリは public。以下を書かない・コミットしない:

- 認証情報、API キー、トークン、接続文字列
- 社内ホスト名、IP アドレス、内部 URL
- 顧客情報・個人情報
- 非公開リポジトリのコードや内部設計の詳細

環境ごとに異なる値は、スキル本文で「実行時にユーザーに確認する」「環境変数から読む」と書く。

## スキルの書き方

- 1 スキル = `skills/<skill-name>/SKILL.md`。雛形は `template/SKILL.md`
- `<skill-name>` は kebab-case で、frontmatter の `name` と一致させる
- `description` には「いつ使うか」と、ユーザーが言いそうなトリガーフレーズを書く
- `SKILL.md` は短く保つ。長い参照資料やスクリプトは同じディレクトリに置き、`SKILL.md` からリンクする

## 変更時の手順

1. スキルを追加・変更したら `.claude-plugin/plugin.json` の `version` を上げる（上げないと既存ユーザーに更新が届かない）
2. `claude plugin validate --strict .` が通ることを確認する
