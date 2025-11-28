window_root "~/git/architecture"

new_window "traefik"
run_cmd "journalctl --user -u traefik-ia.service -f"
