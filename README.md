# Neovim Setup Guide (Ubuntu)

Everything you need to install before this Neovim configuration works correctly.

---

## 1. Neovim (0.9 or newer)

The default Ubuntu apt version is often too old. Install the latest stable release:

```bash
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt install neovim
```

Verify: `nvim --version` — should show `0.9+`.

---

## 2. Essential System Packages

```bash
sudo apt update
sudo apt install -y \
  git \
  make \
  gcc \
  unzip \
  curl \
  wget \
  ripgrep \
  xclip
```

What each one does:

| Package | Why |
|---|---|
| `git` | Plugin manager (lazy.nvim) clones plugins via git |
| `make` + `gcc` | Compiles telescope-fzf-native (fuzzy search speed boost) |
| `unzip` | Mason uses it to extract downloaded binaries |
| `curl` / `wget` | Mason downloads tools with these |
| `ripgrep` | Powers `<leader>sg` (live grep across files) |
| `xclip` | System clipboard integration (`"+y` / `"+p`) |

---

## 3. Node.js & npm

Required for **Supermaven** (AI autocomplete) and some Mason-installed tools.

```bash
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs
```

Verify: `node --version` and `npm --version`.

---

## 4. Python 3

Required for the **pyright** language server and **ruff** formatter.

```bash
sudo apt install -y python3 python3-pip python3-venv
```

Verify: `python3 --version`.

---

## 5. Go

Required for the **gopls** language server, **goimports** formatter, and **delve** debugger.

```bash
# Download the latest Go release (check https://go.dev/dl/ for the latest version)
wget https://go.dev/dl/go1.24.0.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go1.24.0.linux-amd64.tar.gz
rm go1.24.0.linux-amd64.tar.gz
```

Then add Go to your PATH. Add these lines to `~/.bashrc` (or `~/.zshrc`):

```bash
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin
```

Reload: `source ~/.bashrc`

Verify: `go version`.

---

## 6. lazygit

Used for the `:LazyGit` command (a beautiful Git TUI inside Neovim).

```bash
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit lazygit.tar.gz
```

Verify: `lazygit --version`.

---

## 7. Nerd Font

The config has `vim.g.have_nerd_font = true`, so icons will be broken without a Nerd Font installed and set as your terminal font.

**Option A — Download manually:**

1. Go to <https://www.nerdfonts.com/font-downloads>
2. Download a font (e.g. **JetBrainsMono Nerd Font** or **FiraCode Nerd Font**)
3. Unzip and copy the `.ttf` files to `~/.local/share/fonts/`
4. Run `fc-cache -fv`
5. Set the font in your terminal emulator settings

**Option B — Quick install with a script:**

```bash
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
unzip JetBrainsMono.zip -d JetBrainsMono
rm JetBrainsMono.zip
fc-cache -fv
```

Then open your terminal's preferences and select **JetBrainsMono Nerd Font** as the font.

---

## 8. Copy the Config

```bash
# Back up any existing config first
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null

# Clone / copy the config
cp -r /path/to/this/config ~/.config/nvim
```

---

## 9. Tree-sitter Parsers

Tree-sitter provides fast, accurate syntax highlighting and code structure understanding. This config auto-installs parsers for these languages on first launch:

`bash`, `c`, `diff`, `go`, `gomod`, `html`, `lua`, `luadoc`, `markdown`, `markdown_inline`, `python`, `query`, `vim`, `vimdoc`

**Tree-sitter parsers compile from C source code**, so `gcc` and `make` (installed in step 2) are required. Without them the parsers will fail to build and you'll get no syntax highlighting.

**They install automatically** — you don't need to do anything extra. On first launch, nvim-treesitter will compile all listed parsers. This may take a minute.

**To manually install a parser** for a language not in the list:

```vim
:TSInstall <language>
```

Example: `:TSInstall rust` or `:TSInstall javascript`

**To update all parsers** after a nvim-treesitter plugin update:

```vim
:TSUpdate
```

**To check parser status:**

```vim
:TSInstallInfo
```

This lists every available parser and shows which ones are installed. Green = installed and up to date.

---

## 10. First Launch — Let Everything Install

Open Neovim:

```bash
nvim
```

On first launch, **lazy.nvim** (the plugin manager) will automatically install all plugins. This takes 1–3 minutes. Wait for it to finish, then restart Neovim.

After restart, **Mason** will automatically install all language servers, formatters, and tools:

- `gopls` — Go language server
- `pyright` — Python language server  
- `lua_ls` — Lua language server
- `stylua` — Lua formatter
- `ruff` — Python formatter & linter
- `goimports` — Go import organizer
- `delve` — Go debugger

You can monitor Mason's progress with `:Mason`.

**Tree-sitter** parsers are also compiled on first launch (see section 9 for details).

---

## 11. Verify Everything Works

Run inside Neovim:

```
:checkhealth
```

This shows the status of all components. Green = good, yellow = optional warning, red = something needs fixing.

---

## Summary Checklist

- [ ] Neovim 0.9+
- [ ] `git`, `make`, `gcc`, `unzip`, `curl`, `ripgrep`, `xclip`
- [ ] Node.js & npm (LTS)
- [ ] Python 3 + pip
- [ ] Go 1.21+
- [ ] lazygit
- [ ] Nerd Font installed and set in terminal
- [ ] Config copied to `~/.config/nvim`
- [ ] First launch completed (plugins + Tree-sitter parsers installed)
- [ ] `:TSInstallInfo` shows parsers as installed
- [ ] `:checkhealth` shows no red errors


## this is a fork of Kickstart project and here is the list of things i have added

1. i have added hidden and no-ignore option to sf and sg ( fuzzy finder ) to look for everything.
