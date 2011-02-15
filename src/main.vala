using Gtk;
using Config;

static int main (string[] args) {     
  Gtk.init (ref args);

  try {
    var window = new Tagle.Window ();

    window.show_all ();
    window.destroy.connect (Gtk.main_quit);

    Gtk.main ();
  } catch (Error e) {
    stderr.printf ("Could not load UI: %s\n", e.message);
    return 1;
  }
  return 0;
}
