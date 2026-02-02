status is-interactive; or exit

# cursor style
set -gx fish_vi_force_cursor 1
set -gx fish_cursor_default block
set -gx fish_cursor_insert line blink
set -gx fish_cursor_visual block
set -gx fish_cursor_replace_one underscore

# path setup
fish_add_path ~/.local/bin ~/.cargo/bin

set -gx EDITOR (which nvim)
set -gx VISUAL $EDITOR
set -gx SUDO_EDITOR $EDITOR

starship init fish | source

function zed --wraps zed --description "Zed with server-side decorations"
    env ZED_WINDOW_DECORATIONS=server ~/.local/bin/zed $argv
end

abbr p pnpm

# pnpm
set -gx PNPM_HOME "/home/jcli/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
