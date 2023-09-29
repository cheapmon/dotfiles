window_root "~/git/architecture/apps/core"

new_window "core-console"
run_cmd "docker-compose run --rm core rails c"
