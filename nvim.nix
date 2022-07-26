{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;

    extraConfig = ''
        set background=dark
        colorscheme nord

        set ts=4 sw=4
        set smartindent
        set autoindent

        set relativenumber
        set scrolloff=8
        set nowrap

        set noswapfile
        set nobackup
        set undofile
        set undodir=~/.vim/undodir/

        set mouse=a

        set splitright
        set splitbelow
    '';

    plugins = with pkgs.vimPlugins; [ vim-nix nord-vim ];

  };
}
