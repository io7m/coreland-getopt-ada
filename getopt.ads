package getopt is
  function process (options: string) return integer;
  procedure remaining (remain: out natural);

  function optarg return string;
  function optind return positive;
  function optopt return character;

  procedure reset;

  pragma inline (reset);
  pragma inline (optarg);
  pragma inline (optind);
  pragma inline (optopt);
  pragma inline (remaining);

  opterr: integer;
  opteof: constant integer := -1;

  argument_required: exception;
  argument_illegal: exception;
end getopt;
