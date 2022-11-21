class Board {
  PImage ticTacToe; //tic tac toe start screen image
  PImage xWon, oWon, tieGame; //end game screens for if x or o has won, or if the game has tied

  Board() {
    ticTacToe=loadImage("ticTacToe.png");
    xWon=loadImage("xWon.png");
    oWon=loadImage("oWon.png");
    tieGame=loadImage("tieGame.png");
  }

  void startPlay() {
    if (startGame==false) { //if the game has not started
    image(ticTacToe, 0, 0); //displays the tic tac toe start screen
      if (key=='x') { //if 'x' is pressed
        startGame=true; //the game has started
        xPlay=true; //it is x's turn
      }
      if (key=='o') { //if 'o' is pressed
        startGame=true; //the game has started
      }
    }
  }

  void displayBoard() {
    for (int index1=0; index1<squares.length; index1++) { //index1 variable has an initial value of 0, must be less than the length of squares array, and increases by increments of 1
      for (int index2=0; index2<squares.length; index2++) { //index2 variable has an initial value of 0, must be less than the length of squares array, and increases by increments of 1
        square(index1*size, index2*size, size); //creates the grid of squares
      }
    }
  }

  void checkWin() {
    if (((squares[0][0]==1)&&(squares[0][1]==1)&&(squares[0][2]==1))||((squares[1][0]==1)&&(squares[1][1]==1)&&(squares[1][2]==1))||((squares[2][0]==1)&&(squares[2][1]==1)&&(squares[2][2]==1))  ||  ((squares[0][0]==1)&&(squares[1][0]==1)&&(squares[2][0]==1))||((squares[0][1]==1)&&(squares[1][1]==1)&&(squares[2][1]==1))||((squares[0][2]==1)&&(squares[1][2]==1)&&(squares[2][2]==1))  ||  ((squares[0][0]==1)&&(squares[1][1]==1)&&(squares[2][2]==1))||((squares[0][2]==1)&&(squares[1][1]==1)&&(squares[2][0]==1))) { //if there are 3 'x's in a row in any direction
      xWin=true; //x has won
      endGame=true; //the game has ended
    }
    if (((squares[0][0]==2)&&(squares[0][1]==2)&&(squares[0][2]==2))||((squares[1][0]==2)&&(squares[1][1]==2)&&(squares[1][2]==2))||((squares[2][0]==2)&&(squares[2][1]==2)&&(squares[2][2]==2))  ||  ((squares[0][0]==2)&&(squares[1][0]==2)&&(squares[2][0]==2))||((squares[0][1]==2)&&(squares[1][1]==2)&&(squares[2][1]==2))||((squares[0][2]==2)&&(squares[1][2]==2)&&(squares[2][2]==2))  ||  ((squares[0][0]==2)&&(squares[1][1]==2)&&(squares[2][2]==2))||((squares[0][2]==2)&&(squares[1][1]==2)&&(squares[2][0]==2))) //if there are 3 'o's in a row in any direction
      endGame=true; ///the game has ended

    if (pressedCounter>8) { //if all squares are filled by x or o
      endGame=true; //the game has ended
      tie=true; //neither x nor o has won
    }
  }

  void endPlay() {
    if (endGame) { //if the game has ended
      if (xWin) //if x wins
        image(xWon, 0, 0); //display x win screen
      else if (tie) //otherwise, if neither x nor o wins
        image(tieGame, 0, 0); //display tie screen
      else
        image(oWon, 0, 0); //display o win screen
    }
  }
}
