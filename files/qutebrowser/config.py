# Colors
c.colors.webpage.darkmode.enabled  = True
c.colors.webpage.darkmode.policy.images  = "never"
config.set('colors.webpage.darkmode.enabled', False, 'file://*')

# UI Customizations

c.fonts.default_size = "16px"
c.completion.height = 200
c.completion.open_categories = ["searchengines", "quickmarks", "bookmarks", "history"]

c.confirm_quit = ["downloads"] # Confirm quitting if something is downloading

c.content.prefers_reduced_motion = True # Reduce motion as much as possible
c.scrolling.smooth = True

c.search.wrap = False
c.tabs.min_width = 200
c.tabs.max_width = 200
c.tabs.title.format = "{audio}{current_title}"

c.tabs.indicator.width =  0 # No tab indicators

# EMAACS!!!
c.editor.command = ["emacsclient", "-c", "-a=''", "+{line}:{column}", "{file}"]

# Bindings
config.bind('<Ctrl+p>', 'completion-item-focus prev', mode='command')
config.bind('<Ctrl+n>', 'completion-item-focus next', mode='command')
config.bind('<Alt+p>', 'command-history-prev', mode='command')
config.bind('<Alt+n>', 'command-history-next', mode='command')

# Search engines
c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "!nix": "https://search.nixos.org/packages?channel=24.11&from=0&size=50&sort=relevance&type=packages&query={}",
    "!nixopt": "https://search.nixos.org/options?channel=24.11&from=0&size=50&sort=relevance&type=packages&query={}",
    "!git": "https://github.com/search?q={}&type=repositories",
    "!arch": "https://wiki.archlinux.org/index.php?search={}&title=Special%3ASearch&wprov=acrw1_-1",
    "!g": "https://www.google.com/search?q={}",
    "!d": "https://duckduckgo.com/?q={}",
}

# Load autocinf automatically (quickmarks!)
config.load_autoconfig(True)

# Yt Bocking
c.content.blocking.enabled = True
