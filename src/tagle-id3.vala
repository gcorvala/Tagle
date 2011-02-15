using GLib;

class Tagle.Id3 : Object {
  public enum Version {
    ID3_1,
    ID3_1_1,
    ID3_2
  }

  public string title { get; set; }
  public string artist { get; set; }
  public string album { get; set; }
  public int year { get; set; }
  public string comment { get; set; }
  public uint8 genre { get; set; }
  public Version version { get; set; }
		
	public Id3 (string path) throws Error {
	  uint8[] buffer = new uint8[128];
	  var file = File.new_for_path (path);
	  var input_stream = file.read ();
	  input_stream.seek (-128, SeekType.END);
	  if (input_stream.read (buffer) != 128) throw new IOError.FAILED ("aie");
	  if (buffer[0] != 'T' || buffer[1] != 'A' || buffer[2] != 'G') throw new IOError.FAILED ("aie2");
    title = (string) buffer[3:33];
    artist = (string) buffer[33:63];
    album = (string) buffer[63:93];
    year = ((string) buffer[93:97]).to_int ();
    comment = (string) buffer[97:127];
    genre = buffer[127];
    if (buffer[125] == 0 && buffer[126] != 0)
      version = Version.ID3_1_1;
    else
      version = Version.ID3_1;
	}
}
