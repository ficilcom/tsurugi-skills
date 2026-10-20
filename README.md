# tsurugi-skills

Tsurugi プロジェクトの運用向け公開スキル集です。Claude Code のプラグインマーケットプレイスとして配布しています。

## インストール

Claude Code 2.1.275 以降:

```
/plugin install tsurugi --marketplace ficilcom/tsurugi-skills
```

それより前のバージョン:

```
/plugin marketplace add ficilcom/tsurugi-skills
/plugin install tsurugi@tsurugi-skills
```

最新版への更新は `/plugin marketplace update tsurugi-skills` のあと `/plugin update tsurugi@tsurugi-skills` です。

## 構成

```
.claude-plugin/
  marketplace.json   # マーケットプレイス定義
  plugin.json        # プラグイン "tsurugi" の定義
skills/              # スキル本体（1 スキル = 1 ディレクトリ）
template/SKILL.md    # 新規スキル用テンプレート
```

## スキルの追加

1. `template/` を `skills/<skill-name>/` としてコピーする
2. `SKILL.md` の `name`（ディレクトリ名と同じ）と `description` を書き、本文に手順を書く
3. `.claude-plugin/plugin.json` の `version` を上げる
4. `claude plugin validate --strict .` で検証する

## ライセンス

[Apache License 2.0](LICENSE)
