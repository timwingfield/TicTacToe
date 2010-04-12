namespace TicTacToe
{
    public class Square
    {
        public string CurrentValue { get; private set; }
        public bool CanBeSet { get; private set;}

        public Square()
        {
            CurrentValue = "empty";
            CanBeSet = true;
        }

        public void SetToX()
        {
            if (!CanBeSet) return;
            CurrentValue = "X";
            CanBeSet = false;
        }

        public void SetToO()
        {
            if (!CanBeSet) return;
            CurrentValue = "O";
            CanBeSet = false;
        }
    }
}
