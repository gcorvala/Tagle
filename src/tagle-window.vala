using Config;
using Gtk;

namespace Tagle {
  class Window : Gtk.Window {
    private Logger logger;
    private Builder builder;
    private UIManager ui_manager;
    private TextView log_view;
    private MenuBar menu_bar;
    private Toolbar tool_bar;
    private Box main_box;
    private Gtk.ActionGroup actions;

    public Window (WindowType type = Gtk.WindowType.TOPLEVEL) throws Error {
      logger = new Tagle.Logger ();
      builder = new Builder ();
      ui_manager = new UIManager ();

      builder.add_from_file (GLib.Path.build_filename (Config.PACKAGE_DATADIR, "tagle-main-window.ui"));
      builder.connect_signals (null);

      main_box = builder.get_object ("vbox1") as Box;
      add (main_box);

      actions = new Gtk.ActionGroup ("testActions");
      var action = new Gtk.Action ("Action", "label", "tooltip", Gtk.Stock.ABOUT);
      action.activate.connect (() => { logger.insert ("action activated"); });
      actions.add_action (action);
      ui_manager.insert_action_group (actions, 0);

      if (ui_manager.add_ui_from_file (GLib.Path.build_filename (Config.PACKAGE_DATADIR, "tagle-menu.ui")) == 0)
        throw new IOError.FAILED ("prout1");

      if ((menu_bar = ui_manager.get_widget ("/menubar") as MenuBar) == null) throw new IOError.FAILED ("prout2");
      main_box.pack_start (menu_bar, true, true, 0);

      if ((tool_bar = ui_manager.get_widget ("/Toolbar") as Toolbar) == null) throw new IOError.FAILED ("prout3");
      main_box.pack_start (tool_bar, true, true, 0);

      log_view = builder.get_object ("logView") as TextView;

      logger.entry_added.connect (on_entry_added);

      var save_button = builder.get_object ("saveButton") as ToolButton;
      save_button.clicked.connect (() => { logger.insert ("save button clicked"); });

      var redo_button = builder.get_object ("redoButton") as ToolButton;
      redo_button.clicked.connect (() => { logger.insert ("redo button clicked", LogType.ERROR); });

      logger.insert ("Tagle started");
    }

    private void on_entry_added (Logger.LogEntry entry) {
      string msg;
      switch (entry.type) {
  	    case LogType.DEBUG: msg = "[DEBUG] "; break;
  	    case LogType.ERROR: msg = "[ERROR] "; break;
  	    case LogType.MESSAGE: msg = "[MESSAGE] "; break;
  	    case LogType.WARNING: msg = "[WARNING] "; break;
  	    default: msg = "[UNKNOW] "; break;
  	  }
      log_view.buffer.text += msg + entry.message + "\n";
      log_view.scroll_to_mark (log_view.buffer.get_insert (), 0, true, 0, 0);
    }
  }
}