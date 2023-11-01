Ansible is a software tool that provides simple but powerful automation for cross-platform computer support. 

In our case, we are using Ansible to create simple playbooks to rapidly set up host Operating Systems and Docker containers (e.g., installing frequently used packages, dotfiles, etc.) and to store encrypted passwords and SSH keys and secrets. The idea is to have simple playbooks we can use to quickly set up the OS, instead of wasting hours doing this manually.

If you are new to Ansible, here are a couple of good resources to get you started

- [How to manage your workstation configuration with Ansible](https://opensource.com/article/18/3/manage-workstation-ansible)
- [Manage your workstation with Ansible: Automating configuration](https://opensource.com/article/18/3/manage-your-workstation-configuration-ansible-part-2#:~:text=Ansible%20is%20an%20amazing%20automation,the%20focus%20of%20this%20series.)
- [Using Ansible to automate your laptop and desktop configs!](https://www.youtube.com/watch?v=gIDywsGBqf4&list=WL&index=34&t=1805s)

# Usage

Make sure `git` and `ansible` are installed in the host Operating System.

#### Linux

Run the following command on your terminal (no need to clone this repo):

```bash
ansible-pull -U https://github.com/iamgianluca/ansible.git --ask-become-pass
```

You will be asked to provide your password to complete some operations that require root privileges.

#### MacOS 

Run the following command on your terminal (no need to clone this repo):

```bash
ansible-pull -U https://github.com/iamgianluca/ansible.git macos.yml
```

# TODO

- [ ] SSH keys
- [ ] `import_tasks` instead of `include`
- [ ] Manage passwords with `ansible-vault`
