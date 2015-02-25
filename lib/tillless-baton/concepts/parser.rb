require 'fileutils'
require 'active_support/inflector'
require 'tillless-baton/version'
require 'tillless-baton/concepts/merchant_config'

module Baton
  class Parser
    attr_accessor :json, :config

    def initialize(json)
      @json = json
      setup
    end

    def setup
      @setup  = true
      @config = Baton::MerchantConfig.new
    end

    def indent
      '  ' * @indent
    end

    def parse
      setup if !@setup
      @config
    end

  end
end
