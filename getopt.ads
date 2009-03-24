package Getopt is
  pragma Elaborate_Body (Getopt);

  function Process (Options : String) return Integer;

  Argument_Required : exception;
  Argument_Illegal  : exception;

  function Argument (index : Positive) return String;

  function Argument_Count return Natural;
  pragma Inline (Argument_Count);

  procedure Reset;
  pragma Inline (Reset);

  function optarg return String;
  function Option_Argument return String renames optarg;
  pragma Inline (optarg);

  function optind return Positive;
  function Option_Index return Positive renames optind;
  pragma Inline (optind);

  function optopt return Character;
  function Option_Character return Character renames optopt;
  pragma Inline (optopt);

  Option_EOF : constant := -1;
  opteof     : constant := Option_EOF;

end Getopt;
