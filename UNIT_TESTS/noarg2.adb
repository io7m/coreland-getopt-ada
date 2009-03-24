with Getopt;

procedure noarg2 is
  Option : Integer;
begin
  Option := Getopt.Process (" ");
  if Option /= Getopt.Option_EOF then
    raise Program_Error with "expected EOF from Getopt";
  end if;
end noarg2;
