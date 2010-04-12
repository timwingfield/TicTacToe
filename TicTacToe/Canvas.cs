using System.Collections.Generic;

namespace TicTacToe
{
    public class Canvas
    {
        public List<Square> Squares { get; set; }

        public Canvas()
        {
            Squares = new List<Square>();
            for (var i = 0; i <= 8; i++)
            {
                Squares.Add(new Square());
            }
        }


    }
}