# Default to Solarized colors because yimmy began as a Solarized theme
if not set -q yimmy_solarized
  set -U yimmy_solarized true
end

function fish_prompt
  # Cache exit status
  set -g last_status $status

  # Just calculate these once, to save a few cycles when displaying the prompt
  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  end
  if not set -q __fish_prompt_char
    switch (id -u)
      case 0
        set -g __fish_prompt_char '#'
      case '*'
        set -g __fish_prompt_char '>'
    end
  end

  function _exit_indicator
    if test $last_status -ne 0
      echo (set_color red)'('$last_status')'(set_color normal)
    else
      echo ''
    end

  end

  # Setup colors
  set -l normal (set_color normal)
  set -l red (set_color red)
  set -l cyan (set_color cyan)
  set -l white (set_color white)
  set -l gray (set_color normal)
  set -l brwhite (set_color -o white)

  if test "$yimmy_solarized" = "true"
    set gray (set_color -o cyan)
  end

  # Configure __fish_git_prompt
  set -g __fish_git_prompt_showdirtystate true
  set -g __fish_git_prompt_showuntrackedfiles true
  set -g __fish_git_prompt_showstashstate true
  set -g __fish_git_prompt_color green
  set -g __fish_git_prompt_color_flags red
  set -l exit_indicator (_exit_indicator)

  # Line 1
  echo -n $red'┌'$cyan$USER$white'@'$cyan$__fish_prompt_hostname $gray(prompt_pwd)$normal
  __fish_git_prompt
  echo

  # Line 2
  echo -n $red'└'(_exit_indicator)$gray$__fish_prompt_char $normal
end
