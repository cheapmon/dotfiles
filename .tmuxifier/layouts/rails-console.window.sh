new_window "rails-console"

split_v 50

run_cmd "./bin/jobs" 1
run_cmd "./bin/rails c" 2
select_pane 2
