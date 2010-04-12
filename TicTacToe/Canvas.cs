using System.Collections.Generic;

namespace TicTacToe
{
    public class Canvas
    {
        public List<Square> Squares { get; set; }

        public Row Row1 { get; set; }
        public Row Row2 { get; set; }
        public Row Row3 { get; set; }

        public Row Column1 { get; set; }
        public Row Column2 { get; set; }
        public Row Column3 { get; set; }

        public Row Diagonal1{get; set;}
        public Row Diagonal2{get; set;}

        public Canvas()
        {
            Squares = new List<Square>();
            for (var i = 0; i <= 8; i++)
            {
                Squares.Add(new Square());
            }

            Row1 = new Row(Squares[0], Squares[1], Squares[2]);
            Row2 = new Row(Squares[3], Squares[4], Squares[5]);
            Row3 = new Row(Squares[6], Squares[7], Squares[8]);

            Column1 = new Row(Squares[0], Squares[3], Squares[6]);
            Column2 = new Row(Squares[1], Squares[4], Squares[7]);
            Column3 = new Row(Squares[2], Squares[5], Squares[8]);

            Diagonal1 = new Row(Squares[0], Squares[4], Squares[8]);
            Diagonal2 = new Row(Squares[2], Squares[4], Squares[6]);
        }
    }
}