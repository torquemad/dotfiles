set smartindent
set number
set tabstop=2       " The width of a TAB is set to 2.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 2.
set shiftwidth=2    " Indents will have a width of 2
set softtabstop=2   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces

" Various syntax highlighting  for Vim
syntax on

" Install plugins into their own directories
execute pathogen#infect()

function f_ {
  local yn files insensitive count
    if [ -n "${@}" ]; then
      exec 5>&1 # so we can echo out results as they are found, and also capture the output to a variable
        [[ "${@}" =~ [[:upper:]].* ]] || insensitive="i"
        files=$(find . -type f -${insensitive}name "*${@}*" -not -path "*/dist/*" -not -path "*.swp" | tee /dev/fd/5)
        count=$(echo "${files}" | wc -l)
        [ -n "${files}" ] && read -p "vim (${count} files)? " yn
        [ "${yn}" = "y" ] && vim -p ${files}
  fi
}

function g_ {
  local yn files insensitive count
    if [ -n "${@}" ]; then
      exec 5>&1 # so we can echo out results as they are found, and also capture the output to a variable
        [[ "${@}" =~ [[:upper:]].* ]] || insensitive="i"
        files=$(grep -rs${insensitive} "${@}" * | tee /dev/fd/5)
        files=$(echo "${files}" | sed 's/:.*$//' | uniq)
        count=$(echo "${files}" | wc -l)
        [ -n "${files}" ] && read -p "vim (${count} files)? " yn
        [ "${yn}" = "y" ] && vim "+/${@}" -p ${files}
  fi
}



imap <S-Left> <Esc>:tabp<CR>
imap <S-Right> <Esc>:tabn<CR>

autocmd FileType python setlocal sts=4 ts=4 sw=4 tabstop=4 expandtab nospell```
autocmd FileType javascript setlocal sts=2 ts=2 sw=2 tabstop=2 expandtab nospell```
map <C-J> :%!python -m json.tool<cr>```
map <C-t> :tabnew<CR>:e.
nmap <C-t> :tabnew<CR>:e.
imap <C-t> <Esc>:tabnew<CR>:e.

" used for searching eg: :find somefile.txt
set path=.,**
