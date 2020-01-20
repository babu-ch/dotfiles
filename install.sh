#!/bin/bash

pwd=`pwd`

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

echo '### synbolic setting start'
for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    echo "make symbolic $f"
    ln -sniv "$pwd"/"$f" "$HOME"/"$f"
done
echo '### synbolic setting end'

source ~/.bash_profile
