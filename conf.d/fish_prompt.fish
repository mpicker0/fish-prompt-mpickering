if not set --query __fish_prompt_remote
  set --global __fish_prompt_remote ''
  if set --query SSH_CONNECTION
    set --global __fish_prompt_remote 📡
  end
end

if not set --query __fish_prompt_char
  switch (id -u)
    case 0
      set --global __fish_prompt_char '#'
    case '*'
      set --global __fish_prompt_char '>'
  end
end

# Configure __fish_git_prompt
set --global __fish_git_prompt_showdirtystate true
set --global __fish_git_prompt_showuntrackedfiles true
set --global __fish_git_prompt_color green
set --global __fish_git_prompt_color_flags red
set --global ___fish_git_prompt_char_dirtystate '⚡'
set --global ___fish_git_prompt_char_untrackedfiles '+'

