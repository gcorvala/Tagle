using GLib;

enum Id3Version {
  ID3_1,
  ID3_1_1,
  ID3_2
}

class Tagle.Id3 : Object {
  public string title { get; set; }
  public string artist { get; set; }
  public string album { get; set; }
  public string year { get; set; }
  public string comment { get; set; }
  public uint8 genre { get; set; }
		
	public Id3 (string path) throws Error {
	  uint8 buffer[128];
	  var file = File.new_for_path (path);
	  var input_stream = file.read ();
	  input_stream.seek (-128, SeekType.END);
	  input_stream.read (buffer);
    if (buffer[0] == 'T' && buffer[1] == 'A' && buffer[2] == 'G') print ("%c ID3 OK!\n", buffer[0]);
    string tmp = (string) buffer;
    title = tmp.slice (3, 33).chomp ();
    //title = (string) buffer[3:33];
    artist = tmp.slice (33, 63).chomp ();
    album = tmp.slice (63, 93).chomp ();
    year = tmp.slice (93, 97).chomp ();
    comment = tmp.slice (96, 127).chomp ();
    genre = buffer[127];
	}

	/*public static void main () {
	  try {
      //var id3 = new Id3 ("/Users/gabriel/Downloads/Gabin/Gabin/01-gabin-la_maison.mp3");
      var id3 = new Id3 ("/Users/gabriel/Downloads/Gabin/Mr. Freedom/01-Into My Soul.mp3");
      print ("title = %s\n", id3.title);
      print ("artist = %s\n", id3.artist);
      print ("album = %s\n", id3.album);
      print ("year = %s\n", id3.year);
      print ("comment = %s\n", id3.comment);
      print ("genre = %d\n", id3.genre);
    } catch (Error e) { }
	}*/
}
