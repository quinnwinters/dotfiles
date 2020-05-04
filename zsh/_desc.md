### My zsh preferences

##### Oh-my-zsh

I like to use [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh) as my collection of plugin and other zsh configuration tools. I generally like to run with a minimalist-ish theme (currently rocking gallois and not just because I like the idea of studying group theory). I tried at one point to put a ton of plugins in my config, but I found that login wait times for zsh were really long, so I took a bunch of them out. I'm currently still expirementing with which ones I want to keep in my dotfiles. 

##### Aliases

I put together a bunch of my commonly used aliases. Some highlights include a bunch of better defaults (e.g. adding color and human readable information), some nice pipelining aliases so I can do things like 

```bash
# slightly faster searching
cat server.log GREP "ERROR" LESS

# some nice counting tools, e.g. frequency histograms
cat data.csv HISTOGRAM
```

In addition the aliases I know that I use quite frequently, the `~/.zshrc` file sources all the aliases written out into files in the location `~/.aliases/{filename}`. In other parts of the setup script, I include aliases that are more specific to various programming languages and setups (e.g. my Github directory structure) 
