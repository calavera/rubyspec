require File.expand_path('../../../../spec_helper', __FILE__)
require 'delegate'

describe "SimpleDelegator" do
  before :each do
    @obj = "hello"
    @delegate = SimpleDelegator.new(@obj)
  end

  it "can be marshalled" do
    m = Marshal.load(Marshal.dump(@delegate))
    m.class.should == SimpleDelegator
    (m == @obj).should be_true
  end

  ruby_bug "redmine:1744", "1.8.7" do
    it "can be marshalled with its instance variables intact" do
      @delegate.instance_variable_set(:@foo, "bar")
      m = Marshal.load(Marshal.dump(@delegate))
      m.instance_variable_get(:@foo).should == "bar"
    end
  end
end
