class Obstaculo extends FBox  {

  Obstaculo (float anch, float alt)
  {
    super(anch, alt);
  }
}



void agregarObstaculosUno() {

  FCircle enemigo = new FCircle( 40 );
  enemigo.setPosition( random(100, width-100), -30 );
  enemigo.setName("ObstaculosUno");
  enemigo.setFill(10);
  enemigo.setVelocity(0, 10);
  enemigo.setRotation(random(50, 700));
  enemigo.attachImage(asteroide_mor);
  enemigo.setRestitution(0.5);
  mundo.add(enemigo);
}

void agregarObstaculosDos() {

  FCircle enemigoDos = new FCircle( 30 );
  enemigoDos.setPosition( random(100, width-100), -30 );
  enemigoDos.setName("ObstaculosDos");
  enemigoDos.setFill(150, 0, 0);
  enemigoDos.setVelocity(0, 100);
  enemigoDos.setRotation(random(50, 700));
  enemigoDos.attachImage(asteroide_celes);
  enemigoDos.setRestitution(0.5);
  mundo.add(enemigoDos);
}

void agregarObstaculosTres() {

  FCircle enemigoTres = new FCircle( 30 );
  enemigoTres.setPosition( random(100, width-100), -30 );
  enemigoTres.setName("ObstaculosTres");
  enemigoTres.setFill(150, 240, 0);
  enemigoTres.setVelocity(0, 50);
  enemigoTres.setRotation(random(50, 700));
  enemigoTres.attachImage(asteroide_nara);
  enemigoTres.setRestitution(0.5);
  mundo.add(enemigoTres);
}
