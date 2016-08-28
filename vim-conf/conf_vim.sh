#!/bin/bash

VIMFILES_DIR=/usr/share/vim/vimfiles

echo "override original vimrc"
cp -rf vimrc /etc/

echo "install ctags and cscope"
yum install -y ctags cscope

echo "cp all *.vim  to the vimfiles"
cp after/ftplugin/* ${VIMFILES_DIR}/after/ftplugin/
cp -rf autoload/* ${VIMFILES_DIR}/autoload/
cp doc/* ${VIMFILES_DIR}/doc/
cp plugin/* ${VIMFILES_DIR}/plugin/

echo "execute the supertab installation"
vim ${VIMFILES_DIR}/plugin/supertab.vmb -c ":so%" -c ":qa"

#finished
echo "Finished installation!"
