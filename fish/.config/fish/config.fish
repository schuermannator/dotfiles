if status --is-interactive
    tmux ^ /dev/null; and exec true
end

set PATH ~/.cargo/bin/ $PATH
set PATH ~/universe/experimental/bin $PATH
set PATH ~/universe/bin $PATH

set fish_greeting

# use ripgrep for fzf
set -gx FZF_DEFAULT_COMMAND  'rg --files --no-ignore --hidden --follow --glob "!.git/*"'

if command -v exa > /dev/null
	alias l 'exa'
	alias ls 'exa'
	alias lll 'exa -l'
	alias ll 'exa -la'
else
	alias l 'ls'
	alias lll 'ls -l'
	alias ll 'ls -la'
end

if command -v bat > /dev/null
	alias cat 'bat'
else
	alias cat 'cat'
end

if command -v nvim > /dev/null
    alias vim '~/nvim-osx64/bin/nvim'
    alias vi 'vim'
end
