void add_foo_tests () {
    Test.add_func ("/tagle/tests", () => {
      assert ("foo" + "bar" == "foobar");
    });
}

void add_id3_tests () {
  Test.add_func ("/tagle/id3/001", () => {
    try {
      var id3 = new Tagle.Id3 ("tests/id3v1_001_basic.mp3");
      assert (id3.version == Tagle.Id3.Version.ID3_1);
      assert (id3.title == "Title");
      assert (id3.artist == "Artist");
      assert (id3.album == "Album");
      assert (id3.year == 2003);
      assert (id3.comment == "Comment");
      assert (id3.genre == 7);
    } catch (Error e) { print ("!!! %s !!!\n", e.message); };
  });
  Test.add_func ("/tagle/id3/002", () => {
    try {
      var id3 = new Tagle.Id3 ("tests/id3v1_002_basic.mp3");
      assert (id3.version == Tagle.Id3.Version.ID3_1_1);
      assert (id3.title == "Title");
      assert (id3.artist == "Artist");
      assert (id3.album == "Album");
      assert (id3.year == 2003);
      assert (id3.comment == "Comment");
      assert (id3.genre == 7);
    } catch (Error e) { print ("!!! %s !!!\n", e.message); };
  });
}

void main (string[] args) {
    Test.init (ref args);
    add_id3_tests ();
    add_foo_tests ();
    Test.run ();
}