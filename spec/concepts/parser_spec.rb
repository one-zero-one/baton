require 'tillless-baton/version'
require 'tillless-baton/concepts/parser'
require 'tillless-baton/concepts/merchant_config'
require 'tillless-baton/concepts/conductor'

RSpec.describe Baton::Parser do
  it "should exist" do
    expect { Baton::Parser }.to_not raise_error
  end
end
