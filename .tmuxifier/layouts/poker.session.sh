session_root "~/git/poker"

if initialize_session "poker"; then
  load_window "nvim"
  load_window "rails-console"
  load_window "rails-shell"
  load_window "opencode"

  select_window 3
fi

finalize_and_go_to_session
