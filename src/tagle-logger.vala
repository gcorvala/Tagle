namespace Tagle {
  public enum LogType {
    DEBUG,
    ERROR,
    MESSAGE,
    WARNING
  }

  class Logger : Object {
    public struct LogEntry {
      public LogType type;
      public string message;
    }

  	private List<LogEntry?> log;

    public signal void entry_added (LogEntry entry);

  	public Logger () {
  		log = new List<LogEntry?> ();
  	}

  	public void insert (string message, LogType type = LogType.MESSAGE) {
  	  var entry = LogEntry () {
  	    message = message,
  	    type = type
  	  };
  		log.append (entry);
  		entry_added (entry);
  	}
  }
}