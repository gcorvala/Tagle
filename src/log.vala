class Log {
	private List<string> logList;
	
	public Log() {
		logList = new List<string>();
	}

	public void insert(string str) {
		logList.append(str);
	}
	
	// For testing purposes
	public void printList() {
		logList.foreach((elem) => {stdout.printf("%s\n", (string)elem);});
	}
	
	// public static void main() {
	// 	Log ha = new Log();
	// 	ha.insert("this");
	// 	ha.insert("and that");
	// 	ha.insert("and also this");
	// 	ha.printList();
	// }
	
}
