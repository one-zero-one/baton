require 'tillless-baton/version'
require 'tillless-baton/cli/cli'

RSpec.describe Baton::CommandLine do
  it "should exist" do
    expect { Baton::CommandLine }.to_not raise_error
  end
end
