require 'spec_helper'

describe Event do
  it 'should belong to a user' do
    event = FactoryGirl.build(:event, :user => nil)
    event.should_not be_valid
    event.should have(1).error_on(:user)
    event.errors[:user].should include "can't be blank"
    event.user = User.new
    event.should be_valid
  end

  it 'should require a name' do
    event = FactoryGirl.build(:event, :name => nil)
    event.should_not be_valid
    event.should have(1).error_on(:name)
    event.errors[:name].should include "can't be blank"
  end
end
