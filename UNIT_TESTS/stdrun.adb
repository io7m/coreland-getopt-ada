with Ada.Text_IO;
with Ada.Exceptions;
with Ada.Command_Line;
with Getopt;

procedure stdrun is
  package Exceptions renames Ada.Exceptions;
  package Command_Line renames Ada.Command_Line;
  package IO renames Ada.Text_IO;

  Option           : Integer;
  Option_Character : Character;
begin
  -- print raw command line
  IO.Put (Command_Line.Command_Name & " ");
  for Index in 1 .. Command_Line.Argument_Count loop
    IO.Put ("""" & Command_Line.Argument (Index) & """ ");
  end loop;
  IO.Put_Line ("");

  IO.Put_Line ("-- start");
  loop
    begin
      Option := Getopt.Process ("abcx:y:z:?");
      exit when Option = Getopt.Option_EOF;

      Option_Character := Character'Val (Option);
      case Option_Character is
        when 'a' => IO.Put_Line ("-a");
        when 'b' => IO.Put_Line ("-b");
        when 'c' => IO.Put_Line ("-c");
        when 'x' => IO.Put_Line ("-x " & Getopt.Option_Argument);
        when 'y' => IO.Put_Line ("-y " & Getopt.Option_Argument);
        when 'z' => IO.Put_Line ("-z " & Getopt.Option_Argument);
        when '?' => IO.Put_Line ("-?");
        when others =>
          raise Program_Error with "bug: got " & Character'Image (Option_Character);
      end case;
    exception
      when Ex : Getopt.Argument_Required =>
        IO.Put_Line ("error: " & Exceptions.Exception_Message (Ex));
      when Ex : Getopt.Argument_Illegal =>
        IO.Put_Line ("error: " & Exceptions.Exception_Message (Ex));
    end;
  end loop;

  IO.Put_Line ("-- remaining (" & Natural'Image (Getopt.Argument_Count) & " )");
  for Index in 1 .. Getopt.Argument_Count loop
    IO.Put_Line ("arg " & Integer'Image (Index) & ": " & Getopt.Argument (Index));
  end loop;

  IO.Put_Line ("-- end");
  IO.New_Line;

exception
  when Ex : others =>
    IO.Put_Line ("fatal: " & Exceptions.Exception_Name (Ex) & ": " & Exceptions.Exception_Message (Ex));
    IO.New_Line;
end stdrun;
