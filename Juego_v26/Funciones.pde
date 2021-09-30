FBox caja;
FMouseJoint puntero;
PImage Astronauta;

boolean hayColisionEntre( FContact contact, String nombreUno, String nombreDos ) {
  boolean resultado = false;
  FBody uno = contact.getBody1();
  FBody dos = contact.getBody2();
  String etiquetaUno = uno.getName();
  String etiquetaDos = dos.getName();

  if ( etiquetaUno != null && etiquetaDos != null ) {
    //println( etiquetaUno+" <-> "+etiquetaDos);

    if ( 
      ( nombreUno.equals( etiquetaUno ) && nombreDos.equals( etiquetaDos ) ) ||
      ( nombreDos.equals( etiquetaUno ) && nombreUno.equals( etiquetaDos ) )
      ) {
      resultado = true;
    }
  }
  return resultado;
}



void actualizarObjetos() {

  Astronauta = loadImage("Ast_quieto_izq.png");

  if ( agregar ) {
    caja = new FBox( 50, 150 );
    caja.setPosition( x, y );
    caja.setFill( 255, 0, 0 );
    caja.setRotation(radians(5));
    caja.setName("player");
    caja.attachImage( Astronauta );
    caja.setRotatable(false);

    //inicializo un MouseJoint para arrastrar el FBox con el fiducial
    puntero = new FMouseJoint( caja, x, y );
    mundo.add( caja );
    mundo.add( puntero );
  } else if ( presente ) {
    puntero.setTarget( x, y );
  } else if ( quitar ) {
    mundo.remove( puntero );
    mundo.remove( caja );
  }


  agregar = false;
  quitar = false;
}



void contactStarted( FContact colision ) {

  if ( hayColisionEntre( colision, "plataforma", "ObstaculosTraje")) {

    FBody dos = colision.getBody2();
    mundo.remove( dos );
  }

  if ( hayColisionEntre( colision, "plataforma", "ObstaculosTraje")) {

    FBody dos = colision.getBody2();
    mundo.remove( dos );
  }


  if ( hayColisionEntre( colision, "plataforma", "ObstaculosUno")) {

    RocaUno.trigger();
    FBody dos = colision.getBody2();
    mundo.remove( dos );
  }

  if ( hayColisionEntre( colision, "plataforma", "ObstaculosDos" ) ) {
    FBody dos = colision.getBody2();
    mundo.remove( dos );
  }

  if ( hayColisionEntre( colision, "plataforma", "ObstaculosTres" ) ) {
    FBody dos = colision.getBody2();
    mundo.remove( dos );
  }

  if ( hayColisionEntre( colision, "player", "ObstaculosUno" ) ) {
    println("HOLA NEGRO");
    println(vidas);
    GolpeAstro.trigger();
    vidas -= 1;
    FBody dos = colision.getBody2();
    mundo.remove( dos );
  }
  if ( hayColisionEntre( colision, "player", "ObstaculosDos" ) ) {
    println("HOLA ROJO");
    GolpeAstro.trigger();
    vidas -= 1;
    FBody dos = colision.getBody2();
    mundo.remove( dos );
  }
  if ( hayColisionEntre( colision, "player", "ObstaculosTres" ) ) {
    println("HOLA VERDE");
    vidas -= 1;
    FBody dos = colision.getBody2();
    mundo.remove( dos );
  }

  if ( hayColisionEntre( colision, "pisoDos", "ObstaculosUno" ) ) {
    FBody dos = colision.getBody2();
    metalHit.trigger();
    mundo.remove( dos );
  }
  if ( hayColisionEntre( colision, "pisoDos", "ObstaculosDos" ) ) {
    FBody dos = colision.getBody2();
    metalHit.trigger();
    mundo.remove( dos );
  }
  if ( hayColisionEntre( colision, "pisoDos", "ObstaculosTres" ) ) {
    FBody dos = colision.getBody2();
    metalHit.trigger();
    mundo.remove( dos );
  }
  if ( hayColisionEntre( colision, "pisoTres", "ObstaculosUno" ) ) {
    FBody dos = colision.getBody2();
    metalHit.trigger();
    mundo.remove( dos );
  }
  if ( hayColisionEntre( colision, "pisoTres", "ObstaculosDos" ) ) {
    FBody dos = colision.getBody2();
    metalHit.trigger();
    mundo.remove( dos );
  }
  if ( hayColisionEntre( colision, "pisoTres", "ObstaculosTres" ) ) {
    FBody dos = colision.getBody2();
    metalHit.trigger();
    mundo.remove( dos );
  }

  if ( hayColisionEntre( colision, "player", "ObstaculosTraje1" ) ) {
    puntos.trigger();
    puntaje -= 1;
    FBody dos = colision.getBody2();
    mundo.remove( dos );
  }
  if ( hayColisionEntre( colision, "player", "ObstaculosTraje2" ) ) {
    puntos.trigger();
    puntaje -= 1;
    FBody dos = colision.getBody2();
    mundo.remove( dos );
  }
  if ( hayColisionEntre( colision, "player", "ObstaculosTraje3" ) ) {
    puntos.trigger();
    puntaje -= 1;
    FBody dos = colision.getBody2();
    mundo.remove( dos );
  }
}

void agujeroDeAtraccion() {

  ArrayList<FBody> cuerpos = mundo.getBodies();
  for (FBody cuerpo : cuerpos) {
    float dx = 500 - cuerpo.getX();
    float dy = 300 - cuerpo.getY();

    if (dist(400, height/4, cuerpo.getX(), cuerpo.getY()) < 300) {
      cuerpo.addForce(dx*30, dy*30);
    }
  }
}

void agujeroDeRepulsion() {

  ArrayList<FBody> cuerpos = mundo.getBodies();
  for (FBody cuerpo : cuerpos) {
    float dx = 500 - cuerpo.getX();
    float dy = 300 - cuerpo.getY();

    if (dist(400, height/4, cuerpo.getX(), cuerpo.getY()) < 300) {
      cuerpo.addForce(dx*-100, dy*-100);
    }
  }
}

void volverNormalidad() {

  ArrayList<FBody> cuerpos = mundo.getBodies();
  for (FBody cuerpo : cuerpos) {
    float dx = cuerpo.getX();
    float dy = cuerpo.getY();

    if (dist(400, height/4, cuerpo.getX(), cuerpo.getY()) < 300) {
      cuerpo.setForce(0, 0);
    }
  }
}
