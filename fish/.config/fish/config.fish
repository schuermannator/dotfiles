# OS-specific
switch (uname)
    case Linux
        setenv TZ "America/New_York"
        set -g PATH /snap/bin $PATH
    case Darwin
        if status --is-interactive
            tmux ^ /dev/null; and exec true
        end
        setenv TZ "America/Chicago"
    case FreeBSD NetBSD DragonFly
            echo Uh...
    case '*'
            echo A wild operating system has appeared!
end

# set default CLI commands
abbr -a ping 'prettyping --nolegend'
abbr -a l 'exa -F'
abbr -a ls exa
abbr -a ll 'exa -alF'
abbr -a la 'exa -aF'
abbr -a e nvim
abbr -a m make
abbr -a g git
abbr -a f fg
abbr -a c clear
abbr -a vimdiff 'nvim -d'
abbr -a vim nvim
abbr -a find fd
abbr -a du dust
abbr -a br broot

# add 'logout' command to fish
abbr -a logout exit

if command -v bat > /dev/null
	alias cat 'bat'
else
	alias cat 'cat'
end

# by default send terminfo when using remote machine so that colors/bindings work
# abbr -a ssh 'kitty +kitten ssh'

# check hostname: if we are on a different machine, set HOSTCHECK to hostname to put in prompt
if hostname = "zach-macbook-pro.local"
    set -g HOSTCHECK ""
else
    set -g HOSTCHECK " "(hostname)
end

# no prompt greeting for speed
set fish_greeting

# no vi mode prompt (speedy)
set fish_mode_prompt

# https://draculatheme.com/fish
set -l foreground f8f8f2
set -l selection  44475a
set -l comment    6272a4
set -l red    ff5555
set -l orange ffb86c
set -l yellow f4f99d
set -l green  50fa7b
set -l cyan   8be9fd
set -l pink   ff79c6
set -l purple bd93f9
set -g fish_color_autosuggestion $comment
set -g fish_color_command        $cyan
set -g fish_color_comment        $comment
set -g fish_color_end            $orange
set -g fish_color_error          $red
set -g fish_color_escape         $pink
set -g fish_color_normal         $foreground
set -g fish_color_operator       $green
set -g fish_color_param          $purple
set -g fish_color_quote          $yellow
set -g fish_color_redirection    $foreground
set -g fish_color_search_match   --background=$selection
set -g fish_color_selection      --background=$selection

# general env
setenv EDITOR nvim
setenv NAME "Zach Schuermann"
setenv EMAIL "zachary.zvs@gmail.com"

# make less better
# X = leave content on-screen
# F = quit automatically if less than one screenfull
# R = raw terminal characters (fixes git diff)
#     see http://jugglingbits.wordpress.com/2010/03/24/a-better-less-playing-nice-with-git/
setenv LESS "-F -X -R"

# Fish should not add things to clipboard when killing
# See https://github.com/fish-shell/fish-shell/issues/772
set FISH_CLIPBOARD_CMD "cat"

# fish git prompt
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'

# use ripgrep for fzf
set -gx FZF_DEFAULT_COMMAND  'rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# colored man output
# from http://linuxtidbits.wordpress.com/2009/03/23/less-colors-for-man-pages/
setenv LESS_TERMCAP_mb \e'[01;31m'       # begin blinking
setenv LESS_TERMCAP_md \e'[01;38;5;74m'  # begin bold
setenv LESS_TERMCAP_me \e'[0m'           # end mode
setenv LESS_TERMCAP_se \e'[0m'           # end standout-mode
setenv LESS_TERMCAP_so \e'[38;5;246m'    # begin standout-mode - info box
setenv LESS_TERMCAP_ue \e'[0m'           # end underline
setenv LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline

# rust
set -x PATH $HOME/.cargo/bin $PATH
# setenv CARGO_INCREMENTAL 1
# setenv RUST_BACKTRACE 1
# setenv RUSTFLAGS "-C target-cpu=native"

# opam configuration
source $HOME/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# python (keep at bottom)
# set PYENV_ROOT $HOME/.pyenv
# set -x PATH $PYENV_ROOT/bin $PATH
# `pyenv init - | source` is slow, copied below without `pyenv rehash` (do manually)
# and `function pyenv` (only for `pyenv shell`)
# set -gx PATH '$HOME/.pyenv/shims' $PATH
# set -gx PYENV_SHELL fish
# source '/usr/local/Cellar/pyenv/1.2.20/libexec/../completions/pyenv.fish'
