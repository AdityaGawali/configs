i# Neovim Keybindings & Commands Cheat Sheet

---

## General

| Key            | Mode   | Action                                           |
|----------------|--------|-------------------------------------------------|
| `<Ctrl-n>`     | Normal | Toggle NERDTree file explorer                    |
| `<F3>`         | Normal | Toggle visible whitespace (tabs, trailing spaces) |
| `<Ctrl-]>`     | Normal | Jump to tag definition (ctags/cscope)           |
| `<Ctrl-t>`     | Normal | Jump back from tag jump                           |

---

## Cscope Navigation

> Requires `cscope.out` loaded via `:cs add cscope.out`

| Keybinding     | Mode   | Action                                                   |
|----------------|--------|----------------------------------------------------------|
| `<leader>cs`   | Normal | Find symbol under cursor (`:cs find s <symbol>`)         |
| `<leader>cg`   | Normal | Find global definition of symbol under cursor (`g`)      |
| `<leader>cc`   | Normal | Find functions called by symbol under cursor             |
| `<leader>ct`   | Normal | Find text string                                          |
| `<leader>ce`   | Normal | Find egrep pattern                                        |
| `<leader>cf`   | Normal | Find file                                                |

---

## Telescope Fuzzy Finder

> Requires Telescope plugin

| Keybinding     | Mode   | Action                           |
|----------------|--------|----------------------------------|
| `<leader>f`    | Normal | Find files                       |
| `<leader>g`    | Normal | Live grep (search text in files) |

---

## Autocompletion (`nvim-cmp`) — Insert Mode

| Key            | Mode   | Action                          |
|----------------|--------|---------------------------------|
| `<Tab>`        | Insert | Select next item in completion  |
| `<Shift-Tab>`  | Insert | Select previous item in completion |
| `<Enter>`      | Insert | Confirm selected completion      |

---

## NERDTree (File Explorer)

| Key            | Mode   | Action                        |
|----------------|--------|-------------------------------|
| `<Ctrl-n>`     | Normal | Toggle file explorer sidebar  |

---

## Treesitter (Syntax Highlighting & Indentation)

No specific keybindings, but auto-enabled with:

- Better syntax highlighting
- Language-aware indentation

---

## Useful Vim Defaults Enabled

| Feature                | Description                                  |
|------------------------|----------------------------------------------|
| `set number`           | Absolute line numbers                         |
| `set relativenumber`   | Relative line numbers                         |
| `set mouse=a`          | Enable mouse support                          |
| `set list`             | Show whitespace chars (tabs, trailing spaces) |
| `set listchars`        | Customize chars for tabs (`>`), trailing spaces (`·`), etc. |

---

## Notes on `<leader>`

- The `<leader>` key defaults to `\` (backslash).
- You can customize it by adding to your config:

  ```vim
  let mapleader=","  " sets leader key to comma

