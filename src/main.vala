using Gtk;
using Config;
 
public static void on_button1_clicked (Button source) {
    source.label = "Thank you!";
}
 
public static void on_button2_clicked (Button source) {
    source.label = "Thanks!";
}
 
static int main (string[] args) {     
    Gtk.init (ref args);
 
    try {
		// Builder
        var builder = new Builder ();
        builder.add_from_file (GLib.Path.build_filename (Config.PACKAGE_DATADIR, "tagle-main-window.ui"));
        builder.connect_signals (null);

		// Window
        var window = builder.get_object ("window1") as Window;

		// Logger and signal connection
		var log = new Log();
		var logviewer = builder.get_object("logviewer") as TextView;
		logviewer.editable = false;
		logviewer.cursor_visible = false;
		logviewer.buffer.text = "oh hai\n";
		log.logInserted.connect((str) => {
				logviewer.buffer.text += str + "\n";
			});
		log.insert("this is an event inserted\n");

		// Show everyting and launch gtk.main()
        window.show_all ();
        window.destroy.connect (Gtk.main_quit);
        Gtk.main ();
    } catch (Error e) {
        stderr.printf ("Could not load UI: %s\n", e.message);
        return 1;
    } 
 
    return 0;
}
