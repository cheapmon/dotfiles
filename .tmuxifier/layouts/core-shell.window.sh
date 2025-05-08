new_window "zsh"
run_cmd "docker-compose logs -f core --tail=100"
split_v 50
select_pane 1
