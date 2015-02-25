require 'tillless-baton/version'

RSpec.describe Baton::VERSION do
  it "has a version number" do
    expect { Baton::VERSION }.to_not raise_error
  end
end
