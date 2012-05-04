# VIM for Python and Django Development

VIM-PyDjango created by Programmer for Programmer who work on Python & Django 
everyday.

It's coming with several features : 

Autocomplete, Pep8 checker, File Manager, Function bar, detect unused module/variable, Auto-Commenting, 
Python/Django/Custom snippets and many else!


# How it works ?

It will detect automatically your code while typing. All code will show with 
related options.

Code mistake, unused variable, un-standard Python will checked automatically. 

Helpful notification will show on bottom so it not disturb your view.

Not only for python files, it also pay attention for  html, js and all django
related files.

Watch Video example usage on :

http://www.youtube.com/watch?v=a-KfmxoxdfI

# Installation

It using Vundle for manage all plugin. Install Vundle by :

    sudo apt-get install git
    cd ~/
    git clone git://github.com/yodiaditya/vim-pydjango.git
    ln -s ~/vim-pydjango/.vim ~/.vim
    ln -s ~/vim-pydjango/.vimrc ~/.vimrc
    git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

To install. please do :

    vim ~/.vimrc
    :BundleInstall


Follow https://github.com/gmarik/vundle for more detailed information.

Don't forget to install dependency packages (I'm using Ubuntu 11.10):

    sudo apt-get install python-setuptools python-pip exuberant-ctags
    sudo pip install git+git://github.com/kevinw/pyflakes.git
    sudo pip install pylint
    sudo pip install pep8

# Python Programming Standards

There are several standards used in this VIM 

1. Pep8

2. PyFlakes

3. Convert HAML into HTML using Sparkup

4. Auto-Commenter


# Debugging Python

For debugging Django with Development Server, I use ipdb

    import ipdb; ipdb.set_trace()

To install ipdb on Ubuntu :

    sudo apt-get install ipython
    sudo pip install ipdb


# Development Rules

VIM-PyDjango use 80 lines terminals ( Good for development )

It using tab & space size as Python standard.

# Shorcut keys

Leader                = ,

MRU                   = , + space

Pep8                  = F6

FileManager + Tagbar  = F8

FileManager           = , + t 

FuzzFinder Files      = F2 

FuzzFinder Buffer     = , + b

Tagbar                = , + l

Paste                = Ctrl + V


# Plugin Installed

Color scheme Mustang : http://hcalves.deviantart.com/art/Mustang-Vim-Colorscheme-98974484

Syntastic :https://github.com/scrooloose/syntastic

FuzzyFinder : http://www.vim.org/scripts/script.php?script_id=1984

L9 : http://www.vim.org/scripts/script.php?script_id=3252

Pyflakes : https://github.com/kevinw/pyflakes-vim

Pep8 : https://github.com/vim-scripts/pep8

NerdTree : https://github.com/scrooloose/nerdtree

NerdCommenter : https://github.com/scrooloose/nerdcommenter

Tagbar : https://github.com/majutsushi/tagbar

Sparkup : http://jetpackweb.com/blog/2010/03/04/write-html-faster-with-sparkup-vim-and-textmate/

MRU    : https://github.com/vim-scripts/mru.vim

Tagbar : https://github.com/majutsushi/tagbar


IndentPython : https://github.com/vim-scripts/indentpython.vim

Fugitive : https://github.com/tpope/vim-fugitive


# Why you should use this ?

VIM-PyDjango using latest and updated VIM plugins and tools. 

Cut a lot time for develop python & django applications after use it!

# Deprecated 

I no longer use VIM-Debug from http://github.com/jabapyth/vim-debug.

You can see how to installation and screenshots there.

UltiSnips : http://www.vim.org/scripts/script.php?script_id=2715

NeoComplcache : https://github.com/Shougo/neocomplcache
