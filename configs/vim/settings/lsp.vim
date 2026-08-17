" Vim adapter for the language servers shared with Neovim.
function! s:TypeScriptProjectRoot(buffer) abort
    for marker in [
                \ 'tsconfig.json',
                \ 'jsconfig.json',
                \ 'package-lock.json',
                \ 'yarn.lock',
                \ 'pnpm-lock.yaml',
                \ 'bun.lockb',
                \ 'bun.lock',
                \]
        let path = ale#path#FindNearestFile(a:buffer, marker)
        if !empty(path)
            return fnamemodify(path, ':h')
        endif
    endfor

    let git_dir = ale#path#FindNearestDirectory(a:buffer, '.git')
    return !empty(git_dir) ? fnamemodify(git_dir, ':h') : getcwd()
endfunction

for s:filetype in ['javascript', 'javascriptreact', 'typescript', 'typescriptreact']
    call ale#linter#Define(s:filetype, {
                \ 'name': 'typescript_native',
                \ 'lsp': 'stdio',
                \ 'executable': 'tsc',
                \ 'command': '%e --lsp --stdio',
                \ 'project_root': function('s:TypeScriptProjectRoot'),
                \})
endfor
unlet s:filetype

let g:ale_linters = {
            \ 'javascript': ['typescript_native'],
            \ 'javascriptreact': ['typescript_native'],
            \ 'lua': ['lua_language_server'],
            \ 'rust': ['analyzer'],
            \ 'typescript': ['typescript_native'],
            \ 'typescriptreact': ['typescript_native'],
            \}

let g:ale_fixers = {
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \ 'rust': ['RustFmt'],
            \}

" Recognize the Neovim API when editing Neovim Lua configuration.
let g:ale_lua_language_server_config = {
            \ 'Lua': {
            \     'diagnostics': {'globals': ['vim']},
            \ },
            \}

" Match the core Neovim LSP mappings where ALE offers an equivalent.
nnoremap <silent> gd <Cmd>ALEGoToDefinition<CR>
nnoremap <silent> K <Cmd>ALEHover<CR>
nnoremap <silent> [d <Cmd>ALEPreviousWrap<CR>
nnoremap <silent> ]d <Cmd>ALENextWrap<CR>
nnoremap <silent> <leader>vd <Cmd>ALEDetail<CR>
nnoremap <silent> <leader>vca <Cmd>ALECodeAction<CR>
nnoremap <silent> <leader>vrr <Cmd>ALEFindReferences<CR>
nnoremap <silent> <leader>vrn <Cmd>ALERename<CR>
