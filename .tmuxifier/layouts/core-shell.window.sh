new_window "zsh"
run_cmd "docker-compose logs -f core"
split_v 50
select_pane 1
