Ansible playbooks for setting up personal environments.

## Playbooks

| File | Target | Description |
|---|---|---|
| `ubuntu-local.yml` | Ubuntu Desktop (laptop) | Core packages, Docker, GUI tools, dwm, ghostty, zsh, tmux, neovim, dev toolchains |
| `ubuntu-server.yml` | Ubuntu Server | Core packages, Docker, NVIDIA driver + CUDA + Container Toolkit, zsh, tmux, neovim, dev toolchains, nvtop, jj |
| `ubuntu-container.yml` | Ubuntu Docker | NVIDIA driver + CUDA, zsh, tmux, neovim, nodejs |
| `arch-local.yml` | Arch Desktop (laptop) | Core packages, paru (AUR), Docker, GUI tools, dwm, ghostty, zsh, tmux, neovim, dev toolchains |
| `macos.yml` | macOS Desktop | Homebrew packages, ghostty, tmux, neovim, dev toolchains |

## Usage

Run via `ansible-pull` (no clone needed) or from a local checkout.

### Remote pull

```bash
ansible-pull -U https://github.com/iamgianluca/ansible.git ubuntu-local.yml --ask-become-pass    # Ubuntu Desktop
ansible-pull -U https://github.com/iamgianluca/ansible.git ubuntu-server.yml --ask-become-pass   # Ubuntu Server
ansible-pull -U https://github.com/iamgianluca/ansible.git arch-local.yml --ask-become-pass      # Arch Desktop
ansible-pull -U https://github.com/iamgianluca/ansible.git ubuntu-container.yml                  # Docker Container
ansible-pull -U https://github.com/iamgianluca/ansible.git macos.yml                         # macOS Desktop
```

`ubuntu-local.yml`, `ubuntu-server.yml`, and `arch-local.yml` require root privileges (`--ask-become-pass`).

### Local checkout

```bash
make playbook-ubuntu   # run ubuntu-local.yml with --ask-become-pass
make playbook-arch     # run arch-local.yml with --ask-become-pass
make pull              # ansible-pull from main branch
```

## Development

Dry-run a playbook before committing:

```bash
PLAYBOOK=<playbook name> make dry-run
```

Test in a disposable container (requires Docker):

```bash
# Ubuntu
make build-ubuntu   # build the sandbox container
make run-ubuntu     # shell into it
make playbook-ubuntu # run ubuntu-local.yml inside the container
make restart-ubuntu # rebuild + re-enter (after changing a task)
make stop           # kill the container

# Arch
make build-arch     # build the Arch sandbox container
make run-arch       # shell into it
make playbook-arch  # run arch-local.yml inside the container
make restart-arch   # rebuild + re-enter (after changing a task)
```
