pragma ^0.5.11;

contract tictac{
    address p1;     //address of player 1 
    address p2;     //address of player 2
    
    uint8 move=0; // to count the moves
    
    enum square {Empty,X,O}  // to create a board
    square[3][3] board;
    
    constructor (address _p2) public {
        require(_p2!=0x0);
        p1=msg.sender;
        p2=_p2;
    }
    
    
    //string representation of a square on the board
     function squaretostring(unit8 xpos, unit8 ypos) public view returns (string){
         require (positionisinbounds(xpos,ypos));
         
         if (board[xpos][ypos]==square.Empty){
             return " ";
         }
         
         if (board[xpos][ypos]==square.X){
             return "X";
         }
         
         if (board[xpos][ypos]==square.O){
             return "O";
         }
    }
     
     
     //string representation of a new board row, string concatination
     function rowtostring (uint8 ypos) public view returns (string){
         
         return string(abi.encodePacked(squaretostring(0, ypos), "|" , squaretostring(1, ypos), "|" , squaretostring(2, ypos));
    }
     
     
     //this will show each row in a nice manner to as to know whats on the board, string concatination
     //it concatinates all the rows together in new lines
     function statetostring() public view returns (string){
        return string(abi.encodePacked("\n",
            rowtostring(0), "\n"
            rowtostring(1), "\n"
            rowtostring(2), "\n"
             
            ));
         }
     
     //this will check if the board is in bpundary limits or not. should be greater than 0 and less than 3
     function positionisinbounds(uint8 xpos, uint8 ypos) public view returns{
         
         return(xpos>=0 && xpos<3 && ypos>=0 && ypos<3);
     }
     
     //this will perform the move i.e, players moving
     function performmove(uint8 xpos, uint8 ypos){
         require(msg.sender==p1 || msg.sender==p2);     //move is either has to be by player 1 or player 2. 
         require(!isgameover());                        //perform move only when game is not over.
         require(msg.sender==currentplayeraddress());
         require (positionisinbounds(xpos,ypos));       //position of X or O is greater than 0 and less than 3.
         require(board[xpos][ypos]==state.Empty);       //and position we placing X or O has to be empty.
         board[xpos][ypos]= state.X;
         current_move=current_move+1;
         
     }
     
     
     //in tic tac toe we win only if we complete a row or column or a diagonal with either X or O. so this function checks that
     function winningplayershape() public view returns(state){
         //columns
         if (board[0][0]!=state.Empty && board[0][0]==board[0][1] && board[0][0]==board[0][2]{
             return board[0][0];
         }
         if (board[1][0]!=state.Empty && board[1][0]==board[1][1] && board[1][0]==board[1][2]{
             return board[1][0];
         }
         if (board[2][0]!=state.Empty && board[2][0]==board[2][1] && board[2][0]==board[2][2]{
             return board[2][0];
         }
         
         //rows
         if (board[0][0]!=state.Empty && board[0][0]==board[1][0] && board[0][0]==board[2][0]{
             return board[0][0];
         }
         if (board[0][1]!=state.Empty && board[0][1]==board[1][1] && board[0][1]==board[2][1]{
             return board[1][0];
         }
         if (board[0][2]!=state.Empty && board[0][2]==board[1][2] && board[0][2]==board[2][2]{
             return board[2][0];
         }
     
         //diagonals
         if board[0][0]!=state.Empty && board[0][0]==board[1][1] && board[0][0]==board[2][2]{
             return(board[0][0]);
         }
         if board[0][2]!=state.Empty && board[0][2]==board[1][1] && board[0][2]==board[2][2]{
             return(board[0][2]);
         }
        return state.Empty;
     }
     
     
     //this checks if the game is over or not. it is over only when the board is full ot winning shape i.e column, row or diagonal is won
     function isgameover() public view returns(bool){
         return(winningplayershape()!=state.Empty || current_move>8);
     }
     
     
     //this returns the current address of the player
     function currentplayeraddress() public view returns(address) {
         if (current_move%2==0){
             return p1;
        }
        else {
            return p2;
        }
 
    //it returns who is the winner of the game
    function winner() public view returns(address){
        state winning_shape = winningplayershape();
        if(winning_shape==state.O)
        {
            return p1;
        }
        else{
            return p2;
        }
        return 0x0;
    }
     
}