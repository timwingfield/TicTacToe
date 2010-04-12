require File.dirname(__FILE__) + '../TicTacToe/bin/Debug/TicTacToe.dll'
require 'rubygems'
require 'spec'

describe "When setting up a  canvas" do
  before :each do
    @canvas = TicTacToe::Canvas.new
  end
  
  it "should have nine items in the list" do
    @canvas.Squares.length.should == 9
  end
  
  it "should have a  square in the first position in the list" do
    @canvas.Squares[0].should be_instance_of(TicTacToe::Square)
  end
  
  it "should have all nine items set to empty" do
    @canvas.Squares.each do |s|
      s.CurrentValue.should == "empty"
    end
  end
  
  it "should have all nine items available to be set" do
    @canvas.Squares.each do |s|
      s.CanBeSet.should be_true
    end
  end
end