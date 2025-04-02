session_root "~/git/architecture"

if initialize_session "architecture"; then
  load_window "traefik"
  load_window "zsh"

  select_window 2
fi

finalize_and_go_to_session
