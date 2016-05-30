require 'rails_helper'

RSpec.describe Titleist do
  it 'autoloads all constants' do
    expect { Titleist::Title }.not_to raise_error
    expect { Titleist::Engine }.not_to raise_error
    expect { Titleist::VERSION }.not_to raise_error
  end
end
