with ada.text_io;
with ada.exceptions;
with ada.command_line;
with getopt;

procedure stdrun is
  package ex renames ada.exceptions;
  package cmdline renames ada.command_line;
  package io renames ada.text_io;

  char    : integer;
  optchar : character;
begin
  -- print raw command line
  io.put (cmdline.command_name & " ");
  for index in 1 .. cmdline.argument_count loop
    io.put ("""" & cmdline.argument (index) & """ ");
  end loop;
  io.put_line ("");

  io.put_line ("-- start");
  loop
    begin
      char := getopt.process ("abcx:y:z:?");
      exit when char = getopt.opteof;

      optchar := character'val (char);
      case optchar is
        when 'a' => io.put_line ("-a");        
        when 'b' => io.put_line ("-b");
        when 'c' => io.put_line ("-c");
        when 'x' => io.put_line ("-x " & getopt.optarg);
        when 'y' => io.put_line ("-y " & getopt.optarg);
        when 'z' => io.put_line ("-z " & getopt.optarg);
        when '?' => io.put_line ("-?");
        when others =>
          raise program_error with "bug: got " & character'image (optchar);
      end case;
    exception
      when e: getopt.argument_required =>
        io.put_line ("error: " & ex.exception_message (e));
      when e: getopt.argument_illegal =>
        io.put_line ("error: " & ex.exception_message (e));
    end;
  end loop;

  io.put_line ("-- remaining (" & natural'image (getopt.argument_count) & " )");
  for index in 1 .. getopt.argument_count loop
    io.put_line ("arg " & integer'image (index) & ": " & getopt.argument (index));
  end loop;

  io.put_line ("-- end");
  io.put_line ("");

exception
  when e : others =>
    io.put_line ("fatal: " & ex.exception_name (e) & ": " & ex.exception_message (e));
    io.put_line ("");
end stdrun;
