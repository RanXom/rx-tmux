# rx-tmux

A clean, modular, and professional Tmux configuration designed specifically to complement the [rx-neovim](https://github.com/RanXom/rx-neovim) ecosystem.

This configuration emphasizes maintainability by splitting settings into logically separated modules, integrates automated session management, and provides a polished, dynamic status line.

## Dependencies

This configuration relies on external color palettes generated dynamically.

*   **Noctalia v5**: Used as the primary theme generator for the status line and window elements. 
    *   *Note*: The scripts parse Noctalia's generated configuration file (`themes/noctalia.conf`). If you prefer, you can easily modify the extraction scripts to use Matugen or simply hardcode your own hex values directly into `themes/status.tmux`.

## Plugins

This configuration uses the Tmux Plugin Manager (TPM) to handle plugins. The following plugins are pre-configured:

*   **[TPM (Tmux Plugin Manager)](https://github.com/tmux-plugins/tpm)**
    *   Manages the installation and loading of all other plugins.
*   **[tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect)**
    *   Saves the complete state of your Tmux environment (sessions, windows, panes) so it survives system restarts.
*   **[tmux-continuum](https://github.com/tmux-plugins/tmux-continuum)**
    *   Provides continuous background saving of your Tmux environment (using tmux-resurrect) and automatically restores your last saved session when Tmux starts.
*   **[tmux-prefixless](https://github.com/toddyamakawa/tmux-prefixless)**
    *   Streamlines navigation by mapping common Tmux operations directly to `Alt` key combinations, entirely bypassing the need for a prefix key.

## Keymaps

Thanks to **tmux-prefixless**, navigating your Tmux environment is fast and intuitive. 

By holding `Alt` (or `Option`), you can use the following bindings without pressing your prefix key:

*   `Alt + h / j / k / l` - Navigate between panes
*   `Alt + H / L` - Navigate between windows
*   `Alt + J / K` - Navigate between sessions
*   `Alt + i` - Disable prefixless bindings (useful when you need these bindings in terminal applications like Neovim)
*   `Alt + o` - Re-enable prefixless bindings

You can view the full list of prefixless bindings at any time by running:
```sh
tmux list-keys -T prefixless
```

## Structure

The configuration is modularly split:
*   `tmux.conf`: The main entrypoint that sources all other configurations.
*   `conf/general.conf`: Core Tmux settings, terminal overrides, and mouse behavior.
*   `conf/theme.conf`: Sourcing logic for themes and status line styling.
*   `conf/plugins.conf`: Plugin declarations and TPM initialization.
*   `themes/status.tmux`: The shell script responsible for constructing the transparent status line and applying color variables.

## Installation

1. Clone this repository into your Tmux configuration directory:
```sh
git clone https://github.com/RanXom/rx-tmux.git ~/.config/tmux
```
2. Start Tmux.
3. Install plugins by pressing `<Prefix> + I` (or install manually if `tpm` was not cloned automatically).
