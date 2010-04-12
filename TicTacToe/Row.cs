using System.Collections.Generic;

namespace TicTacToe
{
    public class Row
    {
        public List<Square> Cells { get; set; }

        public Row(Square cell1, Square cell2, Square cell3)
        {
            Cells = new List<Square>{cell1, cell2, cell3};
        }

        public bool GameWinner()
        {
            if(HasAnEmpty()) return false;
            return (Cells[0].CurrentValue == Cells[1].CurrentValue && Cells[1].CurrentValue == Cells[2].CurrentValue);
        }

        private bool HasAnEmpty()
        {
            return Cells[0].CurrentValue == "empty" 
                    || Cells[1].CurrentValue == "empty" 
                    || Cells[2].CurrentValue == "empty";
        }
    }
}