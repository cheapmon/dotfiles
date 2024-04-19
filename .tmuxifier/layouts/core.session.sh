session_root "~/git/architecture/apps/core"

if initialize_session "core"; then
  load_window "nvim"
  load_window "core-console"
  load_window "zsh"

  select_window 3
fi

finalize_and_go_to_session
