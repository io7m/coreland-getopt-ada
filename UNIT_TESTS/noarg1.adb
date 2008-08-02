with getopt;

procedure noarg1 is
  char: integer;
begin
  char := getopt.process ("");
  if char /= getopt.opteof then
    raise program_error with "expected opteof from getopt";
  end if;
end noarg1;
