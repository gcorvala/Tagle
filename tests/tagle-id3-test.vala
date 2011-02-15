void add_foo_tests () {
    Test.add_func ("/tagle/id3", () => {
        assert ("foo" + "bar" == "foobar");
    });
}

void main (string[] args) {
    Test.init (ref args);
    add_foo_tests ();
    Test.run ();
}