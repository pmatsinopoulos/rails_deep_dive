require 'spec_helper'

describe User do
  describe 'the Name attribute' do
    before :each do
      @user = FactoryGirl.build(:user)
    end

    it 'should exist on the User model' do
      @user.should respond_to :name
      @user.should respond_to :name=
    end

    it 'should be unique' do
      @user.save
      user2 = FactoryGirl.build(:user, :email => 'diff@example.com')
      user2.should_not be_valid
      user2.should have(1).error_on :name
      user2.errors[:name].should include 'has already been taken'
    end

    it 'should be required' do
      @user.name = nil
      @user.should_not be_valid
      @user.should have(1).error_on :name
      @user.errors[:name].should include "can't be blank"
    end

    it "can be built for a user" do
      @user.save
      lambda {
        @user.events << Event.new(:name => 'A new event')
      }.should change{ @user.events.count }.by(1)
    end

    it "can be removed from a user" do
      @user.save
      @user.events << Event.new(:name => 'A short event')
      lambda {
        @user.events.first.destroy
      }.should change{@user.events.count}.by(-1)
    end
  end
end
