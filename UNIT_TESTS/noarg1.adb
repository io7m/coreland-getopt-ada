with Getopt;

procedure noarg1 is
  char : Integer;
begin
  char := Getopt.Process ("");
  if char /= Getopt.Option_EOF then
    raise Program_Error with "expected EOF from Getopt";
  end if;
end noarg1;
