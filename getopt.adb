with ada.command_line;
with ada.strings.unbounded;

package body getopt is
  package cmdline renames ada.command_line;
  package us renames ada.strings.unbounded;

  -- current option
  internal_optcur: natural;
  internal_optarg: us.unbounded_string;
  internal_optind: positive;
  internal_optopt: character;

  -- reset processing (called on elaboration)
  procedure reset is
  begin
    internal_optcur := 2;
    internal_optarg := us.to_unbounded_string ("");
    internal_optind := 1;
    internal_optopt := ' ';
    opterr := 1;
  end reset;

  -- accessors
  function optarg return string is begin return us.to_string (internal_optarg); end optarg;
  function optind return positive is begin return internal_optind; end optind;
  function optopt return character is begin return internal_optopt; end optopt;

  -- main processing function
  function process (options: string) return integer is

    -- handle argument connected to option character '-ffile.txt'
    function handle_arg_nospace (option_index: positive) return integer is
    begin
      internal_optarg := us.to_unbounded_string
        (cmdline.argument (internal_optind)(internal_optcur + 1 ..
         cmdline.argument (internal_optind)'length));
      internal_optind := internal_optind + 1;
      return character'pos (options (option_index));
    end handle_arg_nospace;

    -- handle argument not connected to option character '-f file.txt'
    function handle_arg_separate (option_index: positive) return integer is
    begin
      internal_optcur := 2;
      internal_optind := internal_optind + 1;
      internal_optarg := us.to_unbounded_string (cmdline.argument (internal_optind));
      internal_optind := internal_optind + 1;
      return character'pos (options (option_index));
    end handle_arg_separate;

    -- handle case of a matching option character with a missing string argument
    procedure handle_missing_arg is
    begin
      if (internal_optcur < cmdline.argument (internal_optind)'length) then
        internal_optcur := internal_optcur + 1;
      else
        internal_optcur := 2;
        internal_optind := internal_optind + 1;
      end if;
    end handle_missing_arg;

    -- process args or not?
    function want_processing return boolean is
    begin
      if cmdline.argument_count = 0 then return false; end if;
      if internal_optind > cmdline.argument_count then return false; end if;
      if cmdline.argument (internal_optind)(1) /= '-' then return false; end if;
      if cmdline.argument (internal_optind)'length = 1 then return false; end if;
      return true;
    end want_processing;

  begin
    -- validity
    if not want_processing then return opteof; end if;

    -- return -1 and internal_optind++ upon '--'
    if (cmdline.argument (internal_optind)(2) = '-') then
      internal_optind := internal_optind + 1;
      return opteof;
    end if;

    -- apparently valid option found
    for option_index in options'range loop
      if (options (option_index) =
        cmdline.argument (internal_optind)(internal_optcur)) then
        if (option_index < options'length) then
          if (options (option_index + 1) = ':') then

            -- optarg doesn't follow a space?
            if (cmdline.argument (internal_optind)'length - internal_optcur > 0) then
              return handle_arg_nospace (option_index);
            end if;

            -- optarg follows a space?
            if (internal_optind < cmdline.argument_count) then
              return handle_arg_separate (option_index);
            else
              internal_optind := internal_optind + 1;
              internal_optopt := options (option_index);

              -- arg missing
              if opterr = 1 and options (1) /= ':' then
                raise argument_required with "option requires an argument -- " &
                  options (option_index .. option_index);
              end if;

              if (options (1) = ':') then
                return character'pos (':');
              else
                return character'pos ('?');
              end if;
            end if;

          else  -- current optchar matches and has no arg option
            handle_missing_arg;
            return character'pos (options (option_index));
          end if;
        else
          -- last char in options, can't have argument
          handle_missing_arg;
          return character'pos (options (option_index));
        end if;
      end if;
    end loop;

    internal_optopt := cmdline.argument (internal_optind)(internal_optcur);
    handle_missing_arg;

    -- unknown arg
    raise argument_illegal with "illegal option -- " &
      character'image (internal_optopt);
  end process;

begin
  reset;
end getopt;
