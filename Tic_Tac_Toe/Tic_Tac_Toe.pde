int squareGrid=3; //number of squares in each row and column
int size=200; //size of the squares
int pressedX, pressedY; //x and y to store mouseX and mouseY coordinates when clicked
int pressedCounter; //tracks the number of turns played
boolean startGame, endGame; //booleans to start the game and end the game
boolean xPlay, xWin; //booleans for if it is x's turn and if x has won
boolean tie; //boolean for if neither x nor o wins
boolean pressed; //boolean for if the mouse is pressed
Board b; //contructs 1 object from the Board class
Players p; //constructs 1 object from the Players class

int[][] squares=new int[squareGrid][squareGrid]; //2D array for the grid of squares

void setup() {
  background(255); //white background colour
  size(600, 600); //size of the run window
  b=new Board(); //initializes the Board class
  p=new Players(); //initializes the Player class
}

void draw () {
  if (startGame==false) //if the game has not started
    b.startPlay(); //displays the start screen and starts the game
  if (startGame==true && endGame==false) { //if the game has started and the game has not ended
    b.displayBoard(); //displays the board
    p.displayPlayers(); //displays x and o
    b.checkWin(); //checks if x or o has won or if there is a tie
  }
  b.endPlay(); //displays the end game screens
}

void mousePressed() {
  if (startGame==true) { //if the game has started
    pressedX=mouseX/size; //stores the x-coordinate of which square the mouse was pressed in
    pressedY=mouseY/size; //stores the y-coordinate of which square the mouse was pressed in

    if (squares[pressedX][pressedY]==0) { //if the square pressed is not an x or an o
      if (xPlay==true) //if it is x's turn
        squares[pressedX][pressedY]=1; //the square clicked is assgined to be an x
      else
        squares[pressedX][pressedY]=2; //the square clicked is assigned to be an o

      pressed=true; //the mouse has been clicked
      pressedCounter++; //increases the number of times pressed
      p.playerMousePressed(); //allows x and o to take turns
    }
  }
}

void keyPressed() {
  if (key=='r' && endGame==true) { //if 'r' is pressed and the game has ended
    startGame=false; //the game has not started
    endGame=false; //the game has not ended
    xWin=false; //x has not won
    tie=false; //there has not been a tie
    pressedCounter=0; //the mouse has not been pressed

    for (int index1=0; index1<squares.length; index1++) { //index1 variable has an initial value of 0, must be less than the length of squares array, and increases by increments of 1
      for (int index2=0; index2<squares.length; index2++) { //index2 variable has an initial value of 0, must be less than the length of squares array, and increases by increments of 1
        squares[index1][index2]=0; //every square does is not assigned to be an x or o
      }
    }
  }
}
