class Ayuda extends FBox {

  Ayuda (float anch, float alt)
  {
    super(anch, alt);
  }
}




void agregarTrajeUno() {

  FPoly myPoly = new FPoly();
  myPoly.vertex(40, 10);
  myPoly.vertex(50, 20);
  myPoly.vertex(60, 30);
  myPoly.vertex(60, 40);
  myPoly.vertex(50, 50);
  myPoly.vertex(40, 60);
  myPoly.vertex(30, 70);

  myPoly.vertex(10, 50);
  myPoly.vertex(10, 40);

  myPoly.vertex(30, 20);
  myPoly.vertex(40, 10);
  mundo.add(myPoly);


  myPoly.setPosition( random(100, width-100), -30 );
  myPoly.setName("ObstaculosTraje1");
  myPoly.setVelocity(0, 50);
  myPoly.setRotation(random(50, 700));
  myPoly.setFill(150);
  myPoly.attachImage(guantes);
}

void agregarTrajeDos() {

  FPoly myPoly = new FPoly();
  myPoly.vertex(40, 10);
  myPoly.vertex(50, 20);
  myPoly.vertex(60, 30);
  myPoly.vertex(60, 40);
  myPoly.vertex(50, 50);
  myPoly.vertex(40, 60);
  myPoly.vertex(30, 70);

  myPoly.vertex(10, 50);
  myPoly.vertex(10, 40);

  myPoly.vertex(30, 20);
  myPoly.vertex(40, 10);
  mundo.add(myPoly);


  myPoly.setPosition( random(100, width-100), -30 );
  myPoly.setName("ObstaculosTraje2");
  myPoly.setVelocity(0, 50);
  myPoly.setRotation(random(50, 700));
  myPoly.setFill(150);
  myPoly.attachImage(casco);
}

void agregarTrajeTres() {

  FPoly myPoly = new FPoly();
  myPoly.vertex(40, 10);
  myPoly.vertex(50, 20);
  myPoly.vertex(60, 30);
  myPoly.vertex(60, 40);
  myPoly.vertex(50, 50);
  myPoly.vertex(40, 60);
  myPoly.vertex(30, 70);

  myPoly.vertex(10, 50);
  myPoly.vertex(10, 40);

  myPoly.vertex(30, 20);
  myPoly.vertex(40, 10);
  mundo.add(myPoly);


  myPoly.setPosition( random(100, width-100), -30 );
  myPoly.setName("ObstaculosTraje3");
  myPoly.setVelocity(0, 50);
  myPoly.setRotation(random(50, 700));
  myPoly.setFill(150);
  myPoly.attachImage(botas);
}




void agregarPuntos1() {

  FBox puntosganar = new FBox( 30, 30 );
  puntosganar.setPosition( random(100, width-100), -30 );
  puntosganar.setName("Puntos1");
  puntosganar.setFill(255, 215, 0);
  puntosganar.setStroke(255, 255, 255);
  puntosganar.setVelocity(0, 500);
  mundo.add(puntosganar);
}
