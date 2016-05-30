require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'can be saved' do
    expect(Post.create(name: 'testing', body: 'save')).to be_persisted
  end
end
