from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import *

class Default(ColorScheme):
  def use(self, context):
    fg, bg, attr = default_colors

    if context.reset:
      # Reset to default colors if any error happens
      return default_colors

    # ============
    # File browser
    # ============
    elif context.in_browser:
      # Global text color
      fg = 7

      if context.selected:
        # Selected item colors
        attr = reverse

      if context.empty or context.error:
        # Empty item text color
        fg = 1
 
      if context.border:
        # Border color
        fg = 6

      if context.media:
        # Media listing text color
        fg = 2

        if context.image:
          # Image listing text color
          fg = 5

      if context.container:
        # Container listing text color
        fg = 3

      if context.directory:
        # Directory listing text color
        fg = 6

      elif context.executable and not any((context.media, context.container)):
        # Executable colors
        fg = 1

      if context.socket or context.fifo or context.device:
        # Socket, FIFO and device text color
        fg = 1

      if context.link:
        # Link text color
        fg = 3

      if context.main_column:	
        if context.marked:
          # Marked items text color
          fg = 214

      if context.badinfo:
        # Bad info colors
        fg = 1

    # =========
    # Title bar	
    # =========
    elif context.in_titlebar:
      # Global text color
      attr |= bold
      fg = 7

      if context.hostname:
        # Hostname text color
        fg = 6

      elif context.directory:
        # Directory text color
        fg = 4

      elif context.tab:
        if context.good:
          # Tab text color
          fg = 0
          bg = 6

    # ==========
    # Status bar
    # ==========
    elif context.in_statusbar:
      # Global text color
      attr |= bold
      fg = 7

      if context.permissions:
        if context.good:
          # Permission good text color
          fg = 2

        elif context.bad:
          # Permission bad text color
          fg = 1

      if context.marked:
        # Mark text color
        fg = 2

      if context.message:
        if context.bad:
          # Bad message text color
          fg = 1

    return fg, bg, attr
