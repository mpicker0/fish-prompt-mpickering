function fish_prompt
  # Cache exit status
  set --global last_status $status

  function _exit_indicator
    if test $last_status -ne 0
      echo (set_color red)'('$last_status')'(set_color normal)
    else
      echo ''
    end
    functions --erase _exit_indicator
  end

  function _get_arrow_color
    if test $last_status -ne 0
      echo 'red'
    else
      echo 'green'
    end
    functions --erase _get_arrow_color
  end

  # Setup colors
  set --local normal (set_color normal)
  set --local red (set_color red)
  set --local cyan (set_color cyan)
  set --local green (set_color green)
  set --local white (set_color white)
  set --local gray (set_color normal)
  set --local brwhite (set_color --bold white)
  set --local arrow_color (set_color (_get_arrow_color))
  set --local prompt_char_color (set_color --bold cyan)

  function _venv_status
    if set --query VIRTUAL_ENV
      echo -n ' 🐍 '
    end
    functions --erase _venv_status
  end

  set --local exit_indicator (_exit_indicator)

  # Line 1
  echo -n $arrow_color'┌'$cyan$USER$__fish_prompt_remote $normal(prompt_pwd)$normal
  __fish_git_prompt
  __fish_svn_prompt
  _venv_status
  echo

  # Line 2
  echo -n $arrow_color'└'$exit_indicator$prompt_char_color$__fish_prompt_char $normal
end
