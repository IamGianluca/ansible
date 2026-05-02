Ansible playbooks for setting up personal environments.

## Playbooks

| File | Target | Description |
|---|---|---|
| `local.yml` | Ubuntu Desktop (laptop) | Core packages, Docker, GUI tools, dwm, ghostty, zsh, tmux, neovim, dev toolchains |
| `headless.yml` | Ubuntu Server | Core packages, Docker, NVIDIA driver + CUDA + Container Toolkit, zsh, tmux, neovim, dev toolchains, nvtop, jj |
| `container.yml` | Ubuntu Docker | NVIDIA driver + CUDA, zsh, tmux, neovim, nodejs |
| `macos.yml` | macOS Desktop | Homebrew packages, ghostty, tmux, neovim, dev toolchains |

## Usage

Run via `ansible-pull` (no clone needed) or from a local checkout.

### Remote pull

```bash
ansible-pull -U https://github.com/iamgianluca/ansible.git local.yml --ask-become-pass       # Ubuntu Desktop
ansible-pull -U https://github.com/iamgianluca/ansible.git headless.yml --ask-become-pass    # Ubuntu Server
ansible-pull -U https://github.com/iamgianluca/ansible.git container.yml                     # Docker Container
ansible-pull -U https://github.com/iamgianluca/ansible.git macos.yml                         # macOS Desktop
```

`local.yml` and `headless.yml` require root privileges (`--ask-become-pass`).

### Local checkout

```bash
make playbook          # run local.yml with --ask-become-pass
make pull              # ansible-pull from main branch
```

## Development

Dry-run a playbook before committing:

```bash
PLAYBOOK=<playbook name> make dry_run
```

Test in a disposable Ubuntu container (requires Docker):

```bash
make build          # build the sandbox container
make run            # shell into it
make playbook       # run local.yml inside the container
make restart        # rebuild + re-enter (after changing a task)
make stop           # kill the container
```
