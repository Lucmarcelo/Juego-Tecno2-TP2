
import tsps.*;
import ddf.minim.*;

Minim minim;
AudioPlayer musicaFondo;
AudioPlayer musicaInicio;
AudioSample RocaUno;
AudioSample RocaDos;
AudioSample RocaTres;
AudioSample GolpeAstro;
AudioSample GolpeAstroDos;
AudioSample metalHit;
AudioSample victory;
AudioSample puntos;

static final int FADE = 500;

import fisica.*;

FWorld mundo; 
TuioProcessing tuio;

Plataforma piso;
Obstaculo rocas;
/*
Personaje jugador;
 */
TSPS TodasLasPersonas;
long tiempo;

int estado;
PImage inicio, perdiste, ganaste, fin, agujero, asteroide_mor, asteroide_celes, asteroide_nara, fondoEspacial, suelo, fondo, barandillaUno, barandillaDos, guantes, casco, botas;

int vidas = 3;

int puntaje = 3;

void setup() { 

  tuio = new TuioProcessing(this);

  size(780, 1000);

  // INICIALIZAR EL SONIDO
  minim = new Minim(this);
  musicaFondo = minim.loadFile("MusicaFondo.mp3", 2048);
  musicaInicio = minim.loadFile("SonidoInicio.mp3", 2048);
  RocaUno = minim.loadSample("AsteroideUno.mp3", 512);
  RocaDos = minim.loadSample("AsteroideDos.mp3", 512);
  RocaTres = minim.loadSample("AsteroideTres.mp3", 512);
  GolpeAstro = minim.loadSample("GolpeAstroUno.mp3", 512);
  metalHit = minim.loadSample("metalhit.mp3", 512);
  victory = minim.loadSample("victory.mp3", 512);
  puntos = minim.loadSample("puntos.mp3", 512);


  // VOLUMEN AUDIO
  RocaUno.shiftGain(RocaUno.getGain(), -20, FADE);
  RocaDos.shiftGain(RocaDos.getGain(), -20, FADE);
  RocaTres.shiftGain(RocaTres.getGain(), -20, FADE);
  musicaFondo.shiftGain(musicaFondo.getGain(), -20, FADE);
  GolpeAstro.shiftGain(GolpeAstro.getGain(), -20, FADE);
  metalHit.shiftGain(metalHit.getGain(), -20, FADE);
  victory.shiftGain(victory.getGain(), -8, FADE);
  puntos.shiftGain(puntos.getGain(), -20, FADE);

  // CARGAR IMAGENES ----------------------------------------------------
  agujero = loadImage("agujeroNegro.png");
  asteroide_mor = loadImage("Asteroides_mor.png");
  asteroide_celes = loadImage("Asteroides_celes.png");
  asteroide_nara = loadImage("Asteroides_nara.png");
  fondoEspacial = loadImage("fondoEspacial.png");
  inicio = loadImage("Inicio.png");
  suelo = loadImage("Suelo.png");
  fondo = loadImage("Fondo.png");
  barandillaUno = loadImage("barandillaUno.png");
  barandillaDos = loadImage("barandillaDos.png");
  perdiste = loadImage("Perdiste.png");
  ganaste = loadImage("Ganaste.png");
  guantes = loadImage("guantes.png");
  casco = loadImage("casco.png");
  botas = loadImage("botas.png");
  //---------------------------------------------------------------------
  Fisica.init (this); // inicializamos la libreria

  mundo = new FWorld();
  mundo.remove(mundo.bottom);
  mundo.setGravity(10, 0);

  image(suelo, 0, 0, 0, 50);
  piso = new Plataforma (1000, 3);
  piso.inicializar(width/2, height -8);
  mundo.add(piso);

  FBox pisoDos = new FBox(200, 20);
  pisoDos.setPosition(90, 500);
  pisoDos.setName("pisoDos");
  pisoDos.setGrabbable(false);
  pisoDos.setStatic(true);
  pisoDos.setRestitution(0.5);
  //pisoDos.setRotation(radians(5));
  pisoDos.attachImage(barandillaUno);
  pisoDos.setFriction(20);
  mundo.add(pisoDos);

  FBox pisoTres = new FBox(150, 20);
  pisoTres.setPosition(710, 600);
  pisoTres.setGrabbable(false);
  pisoTres.setStatic(true);
  pisoTres.setName("pisoTres");
  pisoTres.setRestitution(0.5);
  //pisoTres.setRotation(radians(-5));
  pisoTres.attachImage(barandillaDos);
  pisoTres.setFriction(20);
  mundo.add(pisoTres);

  /*
  jugador = new Personaje (50, 150);
   jugador.inicializar(width/2, height-150);
   mundo.add(jugador);
   */
}

void draw() { 
  actualizarObjetos();
  println( tiempo );

  if ( estado == 0) {
    background (inicio);
    tiempo = -100000000;
  } else if ( estado == 1) {
    tiempo = 0;
    background (fondo);

    /*
    jugador.actualizar();
     */
    mundo.step();
    mundo.draw();
    mundo.setGravity(0, 150);

    pushMatrix();
    fill(255);
    textSize(18);
    text("vidas: "+ vidas, 30, 40);
    textSize(18);
    text("Partes recuperadas del traje: "+ puntaje, 475, 40);
    popMatrix();

    if (puntaje <= 0) {
      noLoop();
      pushMatrix();
      background (ganaste);
      victory.trigger();
      musicaFondo.pause();
      popMatrix();
    }

    if (vidas <= 0) {
      noLoop();
      pushMatrix();
      background (perdiste);
      musicaFondo.pause();
      popMatrix();
    }
    //----------------------------------------  

    if (millis() >= tiempo+2000) {
      if ( frameCount % 60 == 0 ) {
        agregarObstaculosUno();
      }
    }
    if (millis() >= tiempo+3500) {
      if ( frameCount % 900 == 0 ) {
        if (random(3) < 1) {
          agregarTrajeUno();
        } else {
          agregarTrajeDos();
          agregarTrajeTres();
        } 
      }
      if (millis() >= tiempo+15000) {
        fill (255, 1000-frameCount);
        textSize(25);
        text("Parece que viene un agujero negro", 200, height/2);
      }
      if (millis() >= tiempo+30000) {
        image(agujero, 500, 300);
        agujeroDeAtraccion();
      }

      if (millis() >= tiempo+40000) {
        agujeroDeRepulsion();
      }
      if (millis() >= tiempo+41000) {
        volverNormalidad();
      }
      if (millis() >= tiempo+55000) {
        if ( frameCount % 200 == 0 ) {
          agregarObstaculosDos();
        }
      }
      if (millis() >= tiempo+60000) {
        if ( frameCount % 250 == 0 ) {
          agregarObstaculosTres();
        }
      }
      if (millis() >= tiempo+80000) {
        mundo.setGravity(0, -20);
        agujeroDeAtraccion();
      }

      if (millis() >= tiempo+95000) {
        mundo.setGravity(0, 150);
        agujeroDeRepulsion();
      }
      if (millis() >= tiempo+96000) {
        volverNormalidad();
      }
      if (millis() >= tiempo+150000) {
      }
    }
  }
}
