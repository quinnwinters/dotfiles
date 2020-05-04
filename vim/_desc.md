### My vim preferences

I tend to go back and forth between using a fairly sophisticated vim setup and using Vistual Studio / PyCharm CE / RStudio / TeXStudio for various text editing tasks. I think for me it really just depends if I'm already in the terminal or planning on running some interactive parts alongside text editing. 

I use neovim instead of regular vim, so it already includes a lot of nice defaults. I've added some explicit (and possibly redundent) settings as well in here. 

##### Vim preferences

I think my general vim settings are pretty generic but in case you're interested, they include 
* Always using line numbers
* Using "," as a leader key for quick shortcuts
* Easy save and panel navigation shortcuts
* Some nice UI changes

##### Plugins

In addition to all the general changes for vim, I also use some plugins to make vim better to use. Most of note are: 

* Git gutter
* Airline 
* Nerd Tree
* You Complete Me
* Syntastic
* Editorconfig

My editor config is controlled by the editorconfig file and my plugins are managed through `Vundle`. 