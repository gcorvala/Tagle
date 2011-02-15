using Config;
using Gtk;

namespace Tagle {
  class Window : Gtk.Window {
    private Tagle.Logger logger;
    private Gtk.Builder builder;
    private Gtk.TextView log_view;

    public Window (WindowType type = Gtk.WindowType.TOPLEVEL) throws Error {
      logger = new Tagle.Logger ();
      builder = new Builder ();

      builder.add_from_file (GLib.Path.build_filename (Config.PACKAGE_DATADIR, "tagle-main-window.ui"));
      builder.connect_signals (null);

      log_view = builder.get_object ("logView") as TextView;

      logger.entry_added.connect (on_entry_added);

      var save_button = builder.get_object ("saveButton") as ToolButton;
      save_button.clicked.connect (() => { logger.insert ("save button has been clicked"); });

      var redo_button = builder.get_object ("redoButton") as ToolButton;
      redo_button.clicked.connect (() => { logger.insert ("redo button has been clicked", LogType.ERROR); });

      add (builder.get_object ("vbox1") as Widget);

      logger.insert ("save button has been clicked!!!");
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
      log_view.buffer.text = msg + entry.message + "\n" + log_view.buffer.text;
    }
  }
}