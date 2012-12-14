@bhornseth dotfiles
===================

Dead-simple setup for \*nix machines to set up a box the way it was meant.

Installation
------------
<pre>
git clone git@github.com:bhornseth/dotfiles.git ~/.dotfiles
cd !$
git submodule init
git submodule update
rake install
</pre>

That's it.

Environment
-----------
I hack on a Gentoo Linux box during the day, and a Macbook Pro at night, so the files 
in here should work with the default tools on either setup.

VIM
---
Vim uses a heavily-customized .vimrc file with snippets from all the hell over. It 
also uses the [JellyBeans](http://www.vim.org/scripts/script.php?script_id=2555) theme
and ends up looking something like this:

![Vim](http://i.imgur.com/ckrIP.png)

### Adding pathogen modules
Add the repo as a submodule in vim/bundle:

    git submodule add git://github.com/some/vim-repo.git vim/bundle/vim-repo

moar_info?
----------
Soon.
