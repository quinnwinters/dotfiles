### Directory structure

I'm opinionated so I like to have my directory structure look like the
following:

```yaml
/Users/quinnwinters:
  - .automation: <if you have a cronjob script put it here>
  - .aliases: <all these files are automatically sourced at shell login>
  - .alfred: <all my alfred preference backups>
  - .Brewfile: <up to date brew formulae>
  - .conda-env: <conda environment definitions>
  - .ghqrepos: <list of ghq maintained repos>
  - .gitconfig: <standard git config>
  - .gitignore: <global git ignore>
  - .hyper.js: <personal hyper settings>
  - .hyperlayout: <personal hyper layouts>
  - .mackup.cfg: <backup settings for non-dotfiles>
  - .tex_template: <various latex templates>
  - .tmux.cfg: <tmux bindings>
  - .vimrc: <vim configs>
  - .vim_runtime:
      - profile: <generic vim settings>
      - plugins: <install plugins with vundle>
      - config: <configure the plugins installed with vundle>
  - .zaliases: <zsh aliases>
  - .zshenv: <global environment variable I want for me>
  - .zshrc: <zsh configuration>
  - Backups: <files from mackup backups, symlinked back to dotfiles dir>
  - Code:
      - github.com:
          - quinnwinters: <repos I maintain>
          - <other organizations/user code folders>
  - Documents:
      - dotfiles
      - <directories from google drive>
  - Downloads: <Where the downloads go>
  - Pictures:
      - media/<some default media symlinked to dotfiles>
      - screenshots/<auotmatically place screenshots here>
```

Some important notes:

- My username on my computer matches my github login: quinnwinters, Specifically
  this is required to make sure that some of my ghq aliases work.
- While I put dotfiles in my Documents folder, you can put them pretty much
  anywhere
- Google drive folders are automatically linked, so whatever you have in google
  drive should work fine, but beware that it only links top level folders
- All the dotfile specific links are easy enough to see by just looking in
  `home/`

### Brewfile backups

A lot of the installed elements of the brew file are fairly standard. Here are
the major ones that are worth noting (because I use them pretty much everyday):

- Python, Java, Git, Scala, OCaml, and their package managers and environment
  managers as well
- Apache Spark, Cassandra, Posgres, Docker, and other dev tools and useful clis
- Some mac apps like 1Password, Chrome, Alfred, Hyper, and Notion

The brewfile is managed with
[brew wrap](https://homebrew-file.readthedocs.io/en/latest/brew-wrap.html),
which ensures that the brew file is always up to date. There is a regular cron
job that commits the current changes to a backup branch.

### Aldred backups (which aren't automated)

Alfred doesn't seem to have a fully automated cli yet (note to self: awesome
project to do!), so in oder to backup things you have to setup an external
backup directory in alfred settings and then choose the proper folder.

### Conda environments

I tend to work on math-y projects, so I have a number of conda environments that
are tailored to those specific types of workflows. The specific files included
right now are all viewable in `home/.conda-env`

There's an update script that runs the following command to upgrade conda repos

```bash
conda env list --json | grep miniconda | tr -d '",' | xargs -n1 conda update --update-all --prefix
```

This is scheduled to run daily using a cronjob.

### Shell of choice: oh-my-zsh

I use [oh-my-zsh](https://ohmyz.sh/) for my shell of choice. I keep my aliases
in `~/.aliases` and have a `~/.zshrc` that relies on those aliases and oh-my-zsh
both being setup. Your milage may vary if you wind up tweaking this.

### Hyper as an aesthetically pleasing terminal

[Hyper](https://hyper.is) is my terminal of choice. If you haven't used it
before, it's important to note that the configuration is easy to manage: it's
located at `~/.hyper.js` and that includes all the plugins. Once plugins are
installed they are automatically refreshed. There is a dotbot plugin included to
install hyper plugins (so you can see in the logs if any downloads fail).

### ghq for repo management and updates

All my repos that I install, I install with
[ghq](https://github.com/x-motemen/ghq). I created an aliases for `ghq` that
updates the file everytime I run `ghq get`. Additionally there are aliases for
regularly accessed folder such as `~/Code`, `~/Code/github.com` etc.

### Tmux (and ssh)

In order to make sure my worksessions are easily accessible (and not tied to a
specific terminal window) I have a script that runs on new hyper windows that
will create/bind to a tmux session. This is also configured to run when ssh-ing
on to machines to ensure that those sessions are also accessible if a connection
drops for example.

### Mackup backups

I use mackup to backup things that are harder to backup in `dotfiles` -
specifically programs like Bartender and Magnet where the preferences are
hidden. Mackup basically runs the same link commands you would normally run, but
the actual files are abstracted away to make things easier. This is currently
whitelist only because using it with files already controlled by other dotbot
tasks may get dicey.

### Regular Cronjobs

I have regular cronjobs to deal with standard maintance tasks. Currently that
includes:

- A regular update job for conda, homebrew, ghq, etc
- A backup job that takes current changes and pushes them up to a backup branch
- A backup job for mackup files that could change
