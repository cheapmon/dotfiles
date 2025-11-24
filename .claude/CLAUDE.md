## Jira Integration
- Use `acli jira workitem view [key]` to view Jira tickets.
- If available, always include the ticket key when checking out new branches.
- Use `acli jira workitem view [key] --fields 'customfield_10261' --json` to extract QA steps from a Jira ticket.

## Dotfiles Management
- My dotfiles are managed as a bare git repository at `$HOME/git/dotfiles` with work-tree at `$HOME`
- Use the alias `d` for all dotfiles git commands: `d status`, `d add`, `d commit`, etc.
- The alias expands to: `git --git-dir=$HOME/git/dotfiles --work-tree=$HOME`
- **Important:** Run `d` commands from `$HOME` directory, use relative paths with `./` prefix (e.g., `./bin/script`, `./.config/file`)
- When committing dotfiles changes, use the `-f` flag with `add` to override gitignore for tracked files
- **Commit message style:** Use `[category] Description` format (e.g., `[bin]`, `[nix]`, `[claude]`, `[hypr]`, `[misc]`)
- Example workflow:
  ```bash
  cd ~                        # Must be in home directory
  d status                    # Check changes
  d add -f ./bin/script       # Stage file with ./ prefix (use -f for ignored paths)
  d add -f ./.config/file     # Stage config file
  d commit -m "[category] message"  # Commit with category prefix
  d push                      # Push to remote
  ```
- Always run `rspec` like this: `docker-compose run -e RAILS_ENV=test --rm core rspec [files]`.