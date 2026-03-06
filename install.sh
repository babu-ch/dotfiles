#!/bin/bash

pwd=`pwd`

# シンボリックリンクを安全に作成する関数
# - すでにシンボリックリンクが存在する場合はスキップ
# - 通常ファイルが存在する場合は上書き確認あり (-i オプション)
# - 何も存在しない場合は強制作成 (-f オプション)
make_link() {
    src=$1
    dest=$2
    if [ -L "$dest" ]; then
        # すでにシンボリックリンクなのでスキップ
        return
    elif [ -e "$dest" ]; then
        # 通常ファイルが存在する場合は確認を求める
        ln -sniv "$src" "$dest"
    else
        # 存在しない場合は作成
        ln -snfv "$src" "$dest"
    fi
}

# ~/.bash_profile の設定
# ~/.bash_profile が存在しない場合は新規作成し、source ~/.bashrc を追記する
# 存在する場合は source ~/.bashrc の行がなければ追記のみ行う（上書きしない）
echo '### profile setting start'
if [ -e ~/.bash_profile ]; then
	echo '.bash_profile exist'

	grep -E '(source|\.) ~/.bashrc' ~/.bash_profile >> /dev/null
	if [ $? -eq 0 ]; then
		echo '.bashrc setting exist'
	else
		echo '.bashrc setting not exist'
		echo 'append "source ~/.bashrc"'
		echo 'source ~/.bashrc' >> ~/.bash_profile
	fi
else
	echo '.bash_profile not exist'
	echo 'create .bash_profile'
	echo 'source ~/.bashrc' >> ~/.bash_profile
fi
echo '### profile setting end'

# ドットファイルのシンボリックリンク作成
# リポジトリルート直下の .??* ファイルを $HOME へリンクする
# 以下のファイル・ディレクトリは除外する:
#   .git        - Gitリポジトリ管理ディレクトリ
#   .DS_Store   - macOSのメタデータファイル
#   .idea       - IDEの設定ディレクトリ
#   .gitignore  - Gitの除外設定ファイル
echo '### synbolic setting start'
for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    [[ "$f" == ".idea" ]] && continue
    [[ "$f" == ".gitignore" ]] && continue

    echo "make symbolic $f"
    make_link "$pwd/$f" "$HOME/$f"
done
echo '### synbolic setting end'

# Claude Code の設定ファイルをシンボリックリンクで管理する
# リポジトリの claude/ ディレクトリ配下のファイルを ~/.claude/ へリンクする
echo '### claude setting start'
mkdir -p "$HOME/.claude"
for f in claude/settings.json claude/notify.sh
do
    echo "make symbolic $f"
    make_link "$pwd/$f" "$HOME/.$f"
done
echo '### claude setting end'

source ~/.bash_profile