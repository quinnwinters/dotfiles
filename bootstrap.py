#!/usr/bin/env python

import argparse
import subprocess
import shlex

class SetupTask:
    def __init__(self, flag, script_location, default_value=True):
        self.flag = flag
        self.script_location = script_location
        self.default_value = default_value
        self.command = shlex.split("sh ./scripts/" + script_location)

    def add_to_parser(self, parser):
        helper_description = "Use this flag to run: $DOT_DIR/scripts{script_location} (default: {default_value})".format(script_location=script_location, default_value=default_value)
        parser.add_argument(
            self.flag,
            description=helper_description,
            help=helper_description,
            type=bool,
            action="store",
            default=default_value
        )

    def run(self):
        subprocess.check_call(self.command)
    

TASKS = [
    SetupTask("shell-tools", "environment/setup-shell-tools", default_value=False),
    SetupTask("github-ssh", "environment/setup-github-ssh", default_value=False),
    SetupTask("local-exports", "environment/setup-local-exports"),
    SetupTask("dotfile-links", "environment/setup-dotfile-links"),
    SetupTask("brew-apps", "install/install-brew-apps"),
    SetupTask("brew-casks", "install/install-brew-casks"),
    SetupTask("mac-apps", "install/install-brew-mas"),
    SetupTask("clone-repos", "install/install-ghq-repos"),
    SetupTask("node-tools", "install/install-node-tools"),
    SetupTask("vim-plugins", "install/install-vim-plugins"),
    SetupTask("macos-prefs", "preferences/setup-macos-prefs"),
]

parser = argparse.ArgumentParser(description="qwinters dotfiles install script")

for task in TASKS:
    task.add_to_parser(parser)

if __name__ == "__main__":
    args = parser.parse_arguments()
    for task in TASKS:
        if args[task.flag]:
            task.run()




