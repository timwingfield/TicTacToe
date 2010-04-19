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

describe "When setting up a canvas with values to verify the rows" do
  before :each do
    @canvas = TicTacToe::Canvas.new
    @canvas.Squares[0].SetToX
    @canvas.Squares[1].SetToO
    @canvas.Squares[3].SetToO
    @canvas.Squares[5].SetToX
    @canvas.Squares[7].SetToX
    @canvas.Squares[8].SetToO
  end
  describe "When verifying row 1" do
    it "should be a row object" do
      @canvas.Row1.should be_instance_of(TicTacToe::Row)
    end
    
    it "should have the values of canvas items 0, 1, and 2" do
      @canvas.Row1.Cells[0].should == @canvas.Squares[0]
      @canvas.Row1.Cells[1].should == @canvas.Squares[1]
      @canvas.Row1.Cells[2].should == @canvas.Squares[2]
    end
  end
  
  describe "When verifying row2" do
    it "should have the valuse of canvas items 3, 4, 5" do
      @canvas.Row2.Cells[0].should == @canvas.Squares[3]
      @canvas.Row2.Cells[1].should == @canvas.Squares[4]
      @canvas.Row2.Cells[2].should == @canvas.Squares[5]      
    end
  end
  
  describe "When verifying row3" do
    it "should have the valuse of canvas items 3, 4, 5" do
      @canvas.Row3.Cells[0].should == @canvas.Squares[6]
      @canvas.Row3.Cells[1].should == @canvas.Squares[7]
      @canvas.Row3.Cells[2].should == @canvas.Squares[8]      
    end
  end
  
  describe "When verifying column1" do
    it "should have the values of canvas items 0, 3, 6" do
      @canvas.Column1.Cells[0].should == @canvas.Squares[0]
      @canvas.Column1.Cells[1].should == @canvas.Squares[3]
      @canvas.Column1.Cells[2].should == @canvas.Squares[6]
    end
  end
  
  describe "When verifying column2" do
    it "should have the values of canvas items 0, 3, 6" do
      @canvas.Column2.Cells[0].should == @canvas.Squares[1]
      @canvas.Column2.Cells[1].should == @canvas.Squares[4]
      @canvas.Column2.Cells[2].should == @canvas.Squares[7]
    end
  end
  
  describe "When verifying column3" do
    it "should have the values of canvas items 0, 3, 6" do
      @canvas.Column3.Cells[0].should == @canvas.Squares[2]
      @canvas.Column3.Cells[1].should == @canvas.Squares[5]
      @canvas.Column3.Cells[2].should == @canvas.Squares[8]
    end
  end
  
  describe "When verifying diagonal1" do
    it "should have the values of canvas items 0, 4, 8" do
      @canvas.Diagonal1.Cells[0].should == @canvas.Squares[0]
      @canvas.Diagonal1.Cells[1].should == @canvas.Squares[4]
      @canvas.Diagonal1.Cells[2].should == @canvas.Squares[8]
    end
  end
  
  describe "When verifying diagonal2" do
    it "should have the values of canvas items 2, 4, 6" do
      @canvas.Diagonal2.Cells[0].should == @canvas.Squares[2]
      @canvas.Diagonal2.Cells[1].should == @canvas.Squares[4]
      @canvas.Diagonal2.Cells[2].should == @canvas.Squares[6]
    end
  end
end

describe "When checking for a game winner" do
  #0, 1, 2
  #3, 4, 5
  #6, 7, 8
  before :each do
    @canvas = TicTacToe::Canvas.new
  end
  
  describe "When all spaces are empty" do
    it "should return game not over" do
      @canvas.IsGameOver.should be_false
    end
    
    it "should not have a winner" do
      @canvas.HasAWinner.should be_false
    end
  end
  
  describe "When all spaces are filled" do
    before :each do
      @canvas.Squares.each do |square|
        square.SetToX
      end
    end
    
    it "should return the game is over" do
      @canvas.IsGameOver.should be_true
    end
  end
  
  describe "When three non consecutive spaces are filled" do
    before :each do
      @canvas.Squares[1].SetToX
      @canvas.Squares[4].SetToO
      @canvas.Squares[8].SetToX
    end
    
    it "should return game not over" do
      @canvas.IsGameOver.should be_false
    end
    
    it "should not have a winner" do
      @canvas.HasAWinner.should be_false
    end
  end
  
  describe "When row1 contains three Xs" do
    before :each do
      @canvas.Squares[0].SetToX
      @canvas.Squares[1].SetToX
      @canvas.Squares[2].SetToX
    end
    
    it "should return game is over" do
      @canvas.IsGameOver.should be_true
    end
    
    it "should have a winner" do
      @canvas.HasAWinner.should be_true
    end
  end
  
  describe "When diagonal1 contains three Os" do
    before :each do
      @canvas.Squares[0].SetToO
      @canvas.Squares[4].SetToO
      @canvas.Squares[8].SetToO
    end
    
    it "should return game is over" do
      @canvas.IsGameOver.should be_true
    end
    
    it "should have a winner" do
      @canvas.HasAWinner.should be_true
    end
  end
  
  describe "When all squares are filled and there is no winner" do
    before :each do
      @canvas.Squares[0].SetToX
      @canvas.Squares[1].SetToO
      @canvas.Squares[2].SetToX
      @canvas.Squares[3].SetToX
      @canvas.Squares[4].SetToO
      @canvas.Squares[5].SetToX
      @canvas.Squares[6].SetToO
      @canvas.Squares[7].SetToX
      @canvas.Squares[8].SetToO
    end
    
    it "should return the game is over" do
      @canvas.IsGameOver.should be_true
    end
    
    it "should not have a winner" do
      @canvas.HasAWinner.should be_false
    end
  end
  
end