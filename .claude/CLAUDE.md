# Claude Instructions

**Priority**: These user-level instructions take precedence over project-specific context.

## Jira Integration
- If available, always include the ticket key when checking out new branches.
- Use `acli jira workitem view [key]` to view Jira tickets.
- Use `acli jira workitem view [key] --fields 'customfield_10261' --json` to extract QA steps from a Jira ticket.
- Use `acli jira workitem comment list --key [key]` to retrieve for a Jira ticket.

## Project Structure & Workflow
- Primary tech stack: **Ruby** (Rails monolith, some Sinatra apps)
- Work applications live in: `~/git/architecture/apps`
- **Branch naming**: Include ticket key with short description (e.g., `SCH-801-redirect-issues`, `INF-1024-server-reboot`)
- **Commit messages**: Almost always include ticket name (e.g., "UB-385: Introduce Slot component")

## Coding Preferences
- **Linting/Formatting**: Use `rubocop` for linting, `rufo` for formatting
- **Testing**: Write tests often, if setup isn't too complicated
- **Documentation**: Only write when specifically asked
- **Comments**: Add concise comments for non-obvious or complex code
- **Docker vs Native**: Team uses both Docker Compose and native execution - ensure both approaches work
- **Error handling**: Always consider errors

## Working Style
- **Decision-making**: Use reasonable defaults, but ask if unsure - don't guess
- **Communication**: Concise answers preferred unless prompted for detail
- **Tools**: Neovim user, works exclusively in terminal

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

## Development & Testing
- Always run `rspec` like this: `docker-compose run -e RAILS_ENV=test --rm core rspec [files]`.

## System Environment
- I'm on NixOS. If something is missing (e.g. `python3`), consider running commands using `nix-shell`.
