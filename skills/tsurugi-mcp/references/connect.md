# Tsurugi MCP の接続手順

- URL: `https://tsurugi.marketing/mcp`
- 事前に Tsurugi のアカウント（Google またはメールでログイン）を用意する。
- どのクライアントでも、途中でブラウザが開き、Tsurugi へのログインと同意画面（「外部ツールへの接続を許可」）が出る。「許可する」を押すと接続が完了する。

## Claude Code

1. ターミナルで実行する。`--scope user` にすると、どのフォルダで Claude Code を開いても使える。

   ```bash
   claude mcp add --transport http --scope user tsurugi https://tsurugi.marketing/mcp
   ```

2. Claude Code を起動して `/mcp` を開き、`tsurugi` を選んでログインする。ターミナルから `claude mcp login tsurugi` でもよい。
3. ログインし直すとき: `/mcp` → `tsurugi` → 「Re-authenticate」。権限のエラーが続くときは「Clear authentication」（または `claude mcp logout tsurugi`）のあとにログインする。
4. 接続をやめるとき: `claude mcp remove tsurugi --scope user`

参考: https://code.claude.com/docs/en/mcp

## Codex（CLI・IDE 拡張・アプリ）

1. ターミナルで実行する。

   ```bash
   codex mcp add tsurugi --url https://tsurugi.marketing/mcp
   codex mcp login tsurugi
   ```

   `~/.codex/config.toml` に直接書く場合は、次を追加してから `codex mcp login tsurugi` を実行する。

   ```toml
   [mcp_servers.tsurugi]
   url = "https://tsurugi.marketing/mcp"
   ```

2. 確かめるとき: `codex mcp list`（Auth 欄）、または Codex の中で `/mcp`。
3. ログインし直すとき: `codex mcp logout tsurugi` のあとに `codex mcp login tsurugi`。

参考: https://developers.openai.com/codex/mcp

## Claude アプリ（claude.ai・Claude Desktop）

Claude Desktop は claude.ai と同じアカウントのコネクタを使う。画面の名前は英語版の表記をもとにしているので、日本語表示では異なる場合がある。

個人プラン（Free・Pro・Max）:

1. 「Customize」→「Connectors」（https://claude.ai/customize/connectors）を開く。
2. 「Add custom connector」を選び、名前に `Tsurugi`、URL に `https://tsurugi.marketing/mcp` を入力する。
3. 認証は「Sign in now」、OAuth クライアントは「Register automatically」を選ぶ。
4. 「Add」を押し、ブラウザで Tsurugi にログインして「許可する」。
5. 会話で使うときは、入力欄の「+」→「Connectors」で Tsurugi をオンにする。

Team・Enterprise: 組織のオーナーが「Organization settings」→「Connectors」で追加し、各メンバーが「Customize」→「Connectors」で「Connect」を押す。

Free プランで追加できるカスタムコネクタは 1 つまで。

参考: https://support.claude.com/en/articles/11175166-getting-started-with-custom-connectors-using-remote-mcp

## 同意画面で許可する内容

- 本人の確認、名前とプロフィール画像、メールアドレスの参照
- 再ログインなしでの接続の継続
- 個人アカウントの実績・案件・受注者プロフィール・案件メッセージの閲覧と操作（企業アカウントは対象外）

表示される項目はサーバー側の対応状況で変わる。一部だけを許可することはできない。
