require File.dirname(__FILE__) + '../TicTacToe/bin/Debug/TicTacToe.dll'
require 'rubygems'
require 'spec'

describe "When a  square is empty" do
  before :each do
    @square = TicTacToe::Square.new
  end
  
  it "should have no value" do
    @square.CurrentValue.should == "empty"
  end
  
  it "should be able to be set" do
    @square.CanBeSet.should be_true
  end
end

describe "When a  square is being set to X" do
  before :each do
    @square = TicTacToe::Square.new
    @square.SetToX
  end
  
  it "should set the value to X" do
    @square.CurrentValue.should == "X"
  end
  
  it "should not be a lower case x" do
    @square.CurrentValue.should_not == "x"
  end
  
  it "should have a can be set value of false after the value is X" do
    @square.CanBeSet.should_not be_true
  end
end

describe "When a  square is being set to O" do
  before :each do
    @square = TicTacToe::Square.new
    @square.SetToO
  end
  
  it "should set the value to O" do
    @square.CurrentValue.should == "O"
  end
  
  it "should not be a lower case y" do
    @square.CurrentValue.should_not == "o"
  end
  
  it "should have a can be set value of false after the value is Y" do
    @square.CanBeSet.should_not be_true
  end
end

describe "When a  square is set to X and somebody tries to set it to O" do
  before :each do
    @square = TicTacToe::Square.new
    @square.SetToX
    
    @square.SetToO
  end
  
  it "should have a value of X" do
    @square.CurrentValue.should == "X"
  end
  
  it "should not be able to be set" do
    @square.CanBeSet.should_not be_true
  end
end

describe "When a  square is set to O and somebody tries to set it to X" do
  before :each do
    @square = TicTacToe::Square.new
    @square.SetToO
    
    @square.SetToX
  end
  
  it "should have a value of X" do
    @square.CurrentValue.should == "O"
  end
  
  it "should not be able to be set" do
    @square.CanBeSet.should_not be_true
  end
end