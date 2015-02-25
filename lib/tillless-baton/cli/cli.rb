require 'json'
require 'thor'
require 'tillless-baton/version'
require 'tillless-baton/concepts/parser'
require 'tillless-baton/concepts/orchestrator'

module Baton
  class CommandLine < Thor
    class_option :verbose, type: :boolean, desc: 'Turn verbose output on/off'

    desc "deploy", "Execute a deployment of a Tillless Merchant configuration"
    option :in,  desc: 'where to read merchant configuration from, defaults to stdin'
    option :out, desc: 'where to write output report data to, defaults to stdout'
    long_desc <<-LONGDESC
    Execute a deployment of a Tillless Merchant configuration. A merchant configuration file (as JSON) must be
    provided via --config which baton will parse, orchestrate, and then return a report (as JSON) of what was
    performed.
    LONGDESC
    def deploy
      @in  = options[:in]  || STDIN
      @out = options[:out] || STDOUT

      log "#{Baton::CommandLine}.deploy: --in='#{@in==STDIN ? '<stdin>' : @in}' --out='#{@out==STDOUT ? '<stdout>' : @out}'\n"

      # Read from STDIN or specified file name
      if @in == STDIN
        json_str = @in.gets
      else
        json_str = IO.read(@in)
      end

      # Convert input into JSON
      log "      Loading: ... "
      json   = JSON.parse(json_str)
      log "Done\n"

      # Parse JSON into a configuration object
      log "      Parsing: ... "
      config = Baton::Parser.new(json).parse
      log "Done\n"

      # Parse JSON into a configuration object
      log "Orchestrating: ... "
      output = Baton::Orchestrator.new(config).orchestrate
      log "Done\n"

      # Dump output to STDOUT or specified file
      if @out == STDOUT
        @out.puts output
      else
        log "       Output: '#{@out}' ... "
        IO.write(@out, output)
        log "Done\n"
      end

    end

    def log(msg)
      if options[:verbose]
        print msg
      end
    end
  end
end
