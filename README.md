# Dotfiles

## Create dotfiles symlink with [GNU stow](https://www.gnu.org/software/stow/)

Helpful videos on the topic:

- https://www.youtube.com/watch?v=NoFiYOqnC4o
- https://www.youtube.com/watch?v=y6XCebnB9gs

**Get home folder**

```bash
cd ~ && pwd
> /Users/mypc # example
```

**Run stow command with home path as target**

```bash
# stow command structure
# -t Target folder
stow -t [HOME_PATH] [PACKAGE_NAME]

# stow package
stow -t /Users/mypc nvim

# stow whole current folder
# -D Unstow package name
stow -D nvim
```

## ZSH plugins

- [Git](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git)
- [Git commit](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git-commit)
- [Web Search](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/web-search)
- [Jira](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/jira)
