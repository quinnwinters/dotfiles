# Dotfiles

Here are my dotfiles. To install simply run

```bash
git clone https://github.com/qwinters/dotfiles && sh dotfiles/scripts/bootstrap.sh
```

## Notes on installing on M1 Mac

Some features are not available on M1 macs.

Currently unavailable features include:

- Conda (From what I've heard the GUI installer works fine)
- Neovim
  ([Potential Fix](https://dev.to/craftzdog/how-to-install-neovim-on-apple-silicon-m1-mac-27ke))
- MAS (Mac App Store CLI)

My personal preference is to wait for these taps to be updated with native brew
support, but I have included alternative suggestions where possible
