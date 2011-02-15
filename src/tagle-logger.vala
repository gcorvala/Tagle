enum LogType {
  DEBUG,
  ERROR,
  MESSAGE,
  WARNING
}

class Tagle.Logger : Object {
  class LogEntry {
    public LogType type;
    public string message;
  }

	private List<LogEntry> log;

  public signal void logInserted(string str);

	public Logger () {
		log = new List<LogEntry> ();
	}

	public void insert (string message, LogType type = LogType.MESSAGE) {
	  var entry = new LogEntry ();
	  entry.message = message;
	  entry.type = type;
		log.append (entry);
		logInserted (message);
	}

	public void print () {
		log.foreach ((e) => {
		  var entry = e as LogEntry;
		  string msg;
		  switch (entry.type) {
		    case LogType.DEBUG: msg = "[DEBUG] "; break;
		    case LogType.ERROR: msg = "[ERROR] "; break;
		    case LogType.MESSAGE: msg = "[MESSAGE] "; break;
		    case LogType.WARNING: msg = "[WARNING] "; break;
		    default: msg = "[UNKNOW] "; break;
		  }
	    stdout.printf (msg + entry.message + "\n"); });
	}
}
