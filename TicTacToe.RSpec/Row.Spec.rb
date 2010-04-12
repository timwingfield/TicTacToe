require File.dirname(__FILE__) + '../TicTacToe/bin/Debug/TicTacToe.dll'
require 'rubygems'
require 'spec'

describe "When setting up a scoring row" do
  before :each do
    @row = TicTacToe::Row.new(TicTacToe::Square.new, TicTacToe::Square.new, TicTacToe::Square.new)
  end
  
  it "should have a Cells length of three" do
    @row.Cells.length.should == 3
  end
  
  it "should have a Square in each cell" do
    @row.Cells.each do |c|
      c.should be_instance_of(TicTacToe::Square)
    end
  end
  
  it "should have a square set to empty in all three cells" do
    @row.Cells.each do |c|
      c.CurrentValue.should == "empty"
    end
  end
  
  it "should not be a game winner" do
    @row.GameWinner.should be_false
  end
end

describe "When a scoring row has an X, a O, and an empty" do
  before :each do
    cellX = TicTacToe::Square.new
    cellO = TicTacToe::Square.new
    cellEmpty = TicTacToe::Square.new
        
    cellX.SetToX
    cellO.SetToO
    @row = TicTacToe::Row.new(cellX, cellO, cellEmpty)
  end
  
  it "should not be a game winner" do
    @row.GameWinner.should be_false
  end
end

describe "When a scoring row has an X, a O, and an X" do
  before :each do
    cellX = TicTacToe::Square.new
    cellO = TicTacToe::Square.new
    cellX2 = TicTacToe::Square.new

    cellX.SetToX
    cellO.SetToO
    cellX2.SetToX
    @row = TicTacToe::Row.new(cellX, cellO, cellX2)
  end

  it "should not be a game winner" do
    @row.GameWinner.should be_false
  end
end

describe "When a scoring row has three Xs" do
  before :each do
    cell1 = TicTacToe::Square.new
    cell2 = TicTacToe::Square.new
    cell3 = TicTacToe::Square.new
        
    cell1.SetToX
    cell2.SetToX
    cell3.SetToX
    @row = TicTacToe::Row.new(cell1, cell2, cell3)
  end
  
  it "should be a game winner" do
    @row.GameWinner.should be_true
  end
end
