# QWINTERS Dotfiles

A simple and easy way to setup my dotfiles using dotbot. The config is located
at `install-config.yaml` and the main install shell script is the simple
`install` file.

## Install

### Usage

To get the install script to both setup, and reset a system, simply run

```
./install
```

If you want to do only part of the tasks, then run

```
./install --only <task name>
```

The options for tasks are controlled in the `install-config.yaml` file.
Currently the tasks that you can run based on my config are:

- `brewfile`: install all my brew programs based on `$DOT_DIR/home/.Brewfile`
- `clean`: clean up the directories that I like to have controlled
  programmatically
- `create`: create the directories I use frequently
- `link`: link all my relevant dotfiles
- `conda-env`: create conda environments and install relevant packages based on
  the environment definitions in `$DOT_DIR/home/.conda-env`
