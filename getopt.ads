package getopt is
  pragma elaborate_body (getopt);

  function process (options : string) return integer;
  function argument_count return natural;
  function argument (index: positive) return string;

  function optarg return string;
  function optind return positive;
  function optopt return character;

  procedure reset;

  pragma inline (reset);
  pragma inline (optarg);
  pragma inline (optind);
  pragma inline (optopt);
  pragma inline (argument_count);

  opterr : integer;
  opteof : constant integer := -1;

  argument_required : exception;
  argument_illegal  : exception;
end getopt;
