# -------------------------------------
# 環境変数
# -------------------------------------

# SSHで接続した先で日本語が使えるようにする
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# エディタ
#export EDITOR=/opt/local/bin/vim

# ページャ
#export PAGER=/usr/local/bin/vimpager
#export MANPAGER=/usr/local/bin/vimpager

export GNUTERM=x11

# new mac
export TERM=xterm-256color

# -------------------------------------
# zshのオプション
# -------------------------------------

#for zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

## 補完機能の強化
autoload -Uz compinit
compinit -u

## 入力しているコマンド名が間違っている場合にもしかして：を出す。
setopt correct

# ビープを鳴らさない
setopt nobeep

## 色を使う
setopt prompt_subst

## ^Dでログアウトしない。
setopt ignoreeof

## バックグラウンドジョブが終了したらすぐに知らせる。
setopt no_tify

# 補完 {

## タブによるファイルの順番切り替えをしない
#unsetopt auto_menu
setopt auto_menu
bindkey "^[[Z" reverse-menu-complete
## 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
## ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..
## !をつかったヒストリ展開
setopt bang_hist
## 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
## =以降も補完する(--prefix=/usrなど)
setopt magic_equal_subst
## } 補完

# cd -[tab]で過去のディレクトリにひとっ飛びできるようにする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# ディレクトリ名を入力するだけでcdできるようにする
setopt auto_cd

## フローコントロールを無効にする
setopt no_flow_control

# '#' 以降をコメントとして扱う
setopt interactive_comments


# ヒストリの設定 {

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
## 共有
setopt share_history
## 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups
## スペースから始まるコマンド行はヒストリに残さない
 setopt hist_ignore_space
## ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks
## 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups
## } ヒストリの設定

# 高機能なワイルドカード展開を使用する
setopt extended_glob

# -------------------------------------
# パス
# -------------------------------------

# macport
#export PATH="/usr/bin:/usr/sbin:/bin:~/Command"
#export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
#export MANPATH="/opt/local/man:$MANPATH"

# brew
export PATH="/usr/bin:/usr/sbin:/bin:~/sbin"
export PATH="/usr/local/bin:$PATH"
export PATH=$PATH:/usr/local/texlive/2017/bin/x86_64-darwin/

# 重複する要素を自動的に削除
typeset -U path cdpath fpath manpath

# -------------------------------------
# プロンプト
# -------------------------------------

#autoload -U promptinit; promptinit
#autoload -Uz colors; colors
#autoload -Uz vcs_info
#autoload -Uz is-at-least
#
## begin VCS
#zstyle ":vcs_info:*" enable git svn hg bzr
#zstyle ":vcs_info:*" formats "(%s)-[%b]"
#zstyle ":vcs_info:*" actionformats "(%s)-[%b|%a]"
#zstyle ":vcs_info:(svn|bzr):*" branchformat "%b:r%r"
#zstyle ":vcs_info:bzr:*" use-simple true
#
#zstyle ":vcs_info:*" max-exports 6
#
#if is-at-least 4.3.10; then
#	    zstyle ":vcs_info:git:*" check-for-changes true # commitしていないのをチェック
#		     zstyle ":vcs_info:git:*" stagedstr "<S>"
#			      zstyle ":vcs_info:git:*" unstagedstr "<U>"
#					    zstyle ":vcs_info:git:*" formats "(%b) %c%u"
#						     zstyle ":vcs_info:git:*" actionformats "(%s)-[%b|%a] %c%u"
#							  fi
#
#							  function vcs_prompt_info() {
#								      LANG=en_US.UTF-8 vcs_info
#										    [[ -n "$vcs_info_msg_0_" ]] && echo -n " %{$fg[yellow]%}$vcs_info_msg_0_%f"
#							  }
## end VCS
#
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

OK=$'%{\e[38;5;17m%}>%{\e[m%}%{\e[38;5;67m%}>%{\e[m%}'
OK+=$'%{\e[38;5;17m%}>%{\e[m%}%{\e[38;5;67m%}> %{\e[m%}'
#OK="$(tput setaf 243)-------------->>"
#NG="$(tput setaf 131)error $(tput setaf 243)-------->>"
NG=$'%{\e[38;5;111m%}error %{\e[m%}%{\e[38;5;67m%}> %{\e[m%}'

PROMPT=""
PROMPT+="$(tput bold)$(tput setaf 17)%m"
PROMPT+="$(tput setaf 111) * "
PROMPT+="$(tput setaf 103)%~%f ${vcs_info_msg_0_}"
#PROMPT+="\$(vcs_prompt_info)"
#PROMPT+=""$'\n'
PROMPT+="
"
PROMPT+="%(?.$OK%f.$NG%f)"
#PROMPT+="$(tput setaf 88)"
#PROMPT+="%{${reset_color}%}"
#PROMPT+=" "
#RPROMPT="[%*]"

# -------------------------------------
# エイリアス
# -------------------------------------

# -n 行数表示, -I バイナリファイル無視, svn関係のファイルを無視
export GREP_COLOR='00;38;05;11'
alias grep="grep --color -n -I --exclude='*.svn-*' --exclude='entries' --exclude='*/cache/*'"

# ls
alias ls="ls -FG" # color for darwin
alias l="ls -la"
alias la="ls -a"
alias l1="ls -1"
eval `/usr/local/bin/gdircolors ~/.colorrc`
alias ls='gls --color=auto -F'


# tree
alias tree="tree -NC" # N: 文字化け対策, C:色をつける

# .zshrc
alias sz="source ~/.zshrc"
alias zr="vim ~/.zshrc"
alias br="vim ~/.bashrc"
# vim
alias oldvim="/usr/local/bin/vim"
alias vim="nvim"
alias vr="vim ~/.vimrc"
alias dp="vim ~/.config/nvim/dein-plugins.toml"

#tmux
alias killtm='killall tmux'
alias tm='tmux'
alias tmls='tmux ls'
alias tma='tmux attach'
alias tmat='tmux attach -t'
alias tmrs='tmux rename-session -t'
alias kills="tmux kill-session -t"
alias tc="vim ~/.tmux.conf"
#tmux自動起動
	# 既にtmuxを起動してないか
if [ "$TMUX" = "" ]; then
	    tmux attach;

		     # detachしてない場合
			      if [ $? ]; then
						        tmux;
								      fi
										fi
#scip
alias makeipopt="make IPOPT=true"
alias scipex='scip;cd examples;ls'
alias scipbin='scip;cd bin;ls'
alias scipsrc='scip;cd src/scip;ls'
alias makedbg='make OPT=dbg LPS=none ZIMPL=false PARASCIP=true'
alias makeopt='make OPT=opt LPS=none ZIMPL=false PARASCIP=true'
alias makedbgcl='make clean OPT=dbg LPS=none ZIMPL=false PARASCIP=true'
alias makeoptcl='make clean OPT=opt LPS=none ZIMPL=false PARASCIP=true'
#java
alias javac='javac -J-Dfile.encoding=UTF-8'
alias java='java -Dfile.encoding=UTF-8'
#
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mfoi='mdfind -onlyin ./'
alias oe='open -a Emacs'
alias R='R --vanilla --slave'
alias color='perl ~/.256colors2.pl'
alias up="cd ..; ls"
alias f="open ."
alias cr="vim ~/.colorrc"
alias c='cd ~/Desktop/c;ls'
alias dr='cd ~/Dropbox;ls'
# show hidden-files
alias hfon="defaults write com.apple.finder AppleShowAllFiles true|killall Finder"
# hidden hidden-files
alias hfoff="defaults write com.apple.finder AppleShowAllFiles false|killall Finder"
alias comls='ls ~/Command'
alias com="~/Command/com "
alias cl='clear'
alias killmenu='killall SystemUIServer'
alias mkcl='make clean'
alias path="echo $PATH"
alias mkdir="mkdir -p"
alias his="history"
alias mark="pwd | pbcopy"

# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'
alias -g V='> ~/.gomi.txt ; vim ~/.gomi.txt'
# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
# Mac
	alias -g C='| pbcopy'
	elif which xsel >/dev/null 2>&1 ; then
# Linux
	alias -g C='| xsel --input --clipboard'
	elif which putclip >/dev/null 2>&1 ; then
# Cygwin
	alias -g C='| putclip'
	fi

# ~/Command
#alias cp_ind="~/Command/cp_ind"
#alias cp_outd="~/Command/cp_outd"
#alias dic="~/Command/dic"
#alias portup="~/Command/portup"
#alias portclean="~/Command/portclean"
#alias ="~/Command/"


#macbookair
alias scip='cd ~/scipoptsuite-3.2.1/scip-3.2.1/'
alias sshk="ssh -l keiji 192.168.11.2"
alias ssh13="ssh -l kimurakeiji 172.16.25.44"
alias num="open -a /Applications/iWork\ \'09/Numbers.app/"
alias aic="~/Dropbox/c/AIC/bin/main"
alias aic2="~/Dropbox/c/AIC2/bin/main"
alias cplex="~/Applications/IBM/ILOG/CPLEX_Studio1262/cplex/bin/x86-64_osx/cplex"

# -------------------------------------
# キーバインド
# -------------------------------------

bindkey -e

function cdup() {
	   echo
		   cd ..
			   zle reset-prompt
}
zle -N cdup
bindkey '^K' cdup

#bindkey "^R" history-incremental-search-backward
# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward

# -------------------------------------
# その他
# -------------------------------------

# cdしたあとで、自動的に ls する
#function chpwd() { }

# iTerm2のタブ名を変更する
function title {
	    echo -ne "\033]0;"$*"\007"
}

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

#sh
alias rep="~/sh/replace.sh"

#git
alias gb="git branch"
alias gs="git status"
alias gc="git checkout"

#fplll
alias fplll="~/project/fplll-master/fplll/fplll"
