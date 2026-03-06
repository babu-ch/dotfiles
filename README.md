# dotfiles

[![DeepWiki](https://img.shields.io/badge/DeepWiki-babu--ch%2Fdotfiles-blue.svg?logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACwAAAAyCAYAAAAnWDnqAAAAAXNSR0IArs4c6QAAA05JREFUaEPtmUtyEzEQhtWTQyQLHNak2AB7ZnyXZMEjXMGeK/AIi+QuHrMnbChYY7MIh8g01fJoopFb0uhhEqqcbWTp06/uv1saEDv4O3n3dV60RfP947Mm9/SQc0ICFQgzfc4CYZoTPAswgSJCCUJUnAAoRHOAUOcATwbmVLWdGoH//PB8mnKqScAhsD0kYP3j/Yt5LPQe2KvcXmGvRHcDnpxfL2zOYJ1mFwrryWTz0advv1Ut4CJgf5uhDuDj5eUcAUoahrdY/56ebRWeraTjMt/00Sh3UDtjgHtQNHwcRGOC98BJEAEymycmYcWwOprTgcB6VZ5JK5TAJ+fXGLBm3FDAmn6oPPjR4rKCAoJCal2eAiQp2x0vxTPB3ALO2CRkwmDy5WohzBDwSEFKRwPbknEggCPB/imwrycgxX2NzoMCHhPkDwqYMr9tRcP5qNrMZHkVnOjRMWwLCcr8ohBVb1OMjxLwGCvjTikrsBOiA6fNyCrm8V1rP93iVPpwaE+gO0SsWmPiXB+jikdf6SizrT5qKasx5j8ABbHpFTx+vFXp9EnYQmLx02h1QTTrl6eDqxLnGjporxl3NL3agEvXdT0WmEost648sQOYAeJS9Q7bfUVoMGnjo4AZdUMQku50McDcMWcBPvr0SzbTAFDfvJqwLzgxwATnCgnp4wDl6Aa+Ax283gghmj+vj7feE2KBBRMW3FzOpLOADl0Isb5587h/U4gGvkt5v60Z1VLG8BhYjbzRwyQZemwAd6cCR5/XFWLYZRIMpX39AR0tjaGGiGzLVyhse5C9RKC6ai42ppWPKiBagOvaYk8lO7DajerabOZP46Lby5wKjw1HCRx7p9sVMOWGzb/vA1hwiWc6jm3MvQDTogQkiqIhJV0nBQBTU+3okKCFDy9WwferkHjtxib7t3xIUQtHxnIwtx4mpg26/HfwVNVDb4oI9RHmx5WGelRVlrtiw43zboCLaxv46AZeB3IlTkwouebTr1y2NjSpHz68WNFjHvupy3q8TFn3Hos2IAk4Ju5dCo8B3wP7VPr/FGaKiG+T+v+TQqIrOqMTL1VdWV1DdmcbO8KXBz6esmYWYKPwDL5b5FA1a0hwapHiom0r/cKaoqr+27/XcrS5UwSMbQAAAABJRU5ErkJggg==)](https://deepwiki.com/babu-ch/dotfiles)



## 概要
各種設定ファイルを管理します。

## 管理対象ファイル

| ファイル | 用途 |
|---|---|
| `.bashrc` | bash の設定 |
| `.bash_aliases` | エイリアス定義 |
| `.bash_logout` | ログアウト時の処理 |
| `.vimrc` | Vim の設定 |
| `.ideavimrc` | IdeaVim (JetBrains IDE) の設定 |
| `.inputrc` | Readline の設定 |
| `.my.cnf` | MySQL クライアントの設定 |
| `claude/settings.json` | Claude Code のグローバル設定 |
| `claude/notify.sh` | Claude Code の通知スクリプト |

## インストール

```bash
git clone <repository-url>
cd dotfiles
./install.sh
```

`install.sh` は以下の処理を行います:

1. **`~/.bash_profile` の設定** — 存在しない場合は新規作成、存在する場合は `source ~/.bashrc` 行がなければ追記します（上書きしません）
2. **ドットファイルのシンボリックリンク作成** — リポジトリ直下の `.??*` ファイルを `$HOME` へリンクします
3. **Claude Code 設定のシンボリックリンク作成** — `claude/` ディレクトリのファイルを `~/.claude/` へリンクします

### シンボリックリンクの作成ルール

| 状態 | 動作 |
|---|---|
| すでにシンボリックリンクが存在する | スキップ |
| 通常ファイルが存在する | 上書き確認あり |
| 存在しない | 新規作成 |

### 除外ファイル

以下は処理対象外です:

- `.git` — Gitリポジトリ管理ディレクトリ
- `.DS_Store` — macOSのメタデータファイル
- `.idea` — IDEの設定ディレクトリ
- `.gitignore` — Gitの除外設定ファイル

## 新規設定ファイルの追加方法

1. リポジトリルートに新しいドットファイルを作成（例: `.hgrc`, `.tmux.conf`）
2. `./install.sh` を実行すると、除外ファイルを除くすべての `.??*` ファイルが自動でシンボリックリンク対象になります