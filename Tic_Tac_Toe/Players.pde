class Players {
  PImage x, o; //images for x and o

  Players() {
    x=loadImage("x.png");
    x.resize(size, size); //resizes x to fit into the squares
    o=loadImage("o.png");
    o.resize(size, size); //resizes o to fit into the squares
  }

  void displayPlayers() {
    for (int index1=0; index1<squares.length; index1++) { //index1 variable has an initial value of 0, must be less than the length of squares array, and increases by increments of 1
      for (int index2=0; index2<squares.length; index2++) { //index2 variable has an initial value of 0, must be less than the length of squares array, and increases by increments of 1
        if (squares[index1][index2]==1) //if the square clicked is assigned to be an x
          image(x, index1*size, index2*size); //display an x in the square clicked
        if (squares[index1][index2]==2) //if the square clicked is assigned to be an o
          image(o, index1*size, index2*size); //display and o in the square clicked
      }
    }
  }

  void playerMousePressed() {
    if (pressed==true) {  //of the mouse has been pressed
      pressed=false; //the mouse is no longer pressed

      if (xPlay==false) //if it is not x's turn
        xPlay=true; //it is x's turn
      else
        xPlay=false; //it is not x's turn
    }
  }
}
