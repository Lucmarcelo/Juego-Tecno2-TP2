
/*
class Personaje extends FBox

{

  Boolean izqPresionado, derPresionado;

  int velocidad;
  
  String direccion; 
  PImage AstroQuietoDer, AstroQuietoIzq;
  PImage[] AstroDer, AstroIzq;
  int frameCaminata;

  Personaje (float anch, float alt)
  {
    super(anch, alt);
  }

  void inicializar(float x, float y) {



    izqPresionado = false;
    derPresionado = false;
    
    velocidad = 250;
    
    
    setName("Jugador");
    setPosition(x, y);
    setDamping(0);
    setRestitution(0);
    setFriction(0);
    setRotatable(false);
    setGrabbable(false);
    setNoStroke();
    setFill(255, 140, 0);

    direccion = "der";
    direccion = "der";
    AstroDer = new PImage[3];
    AstroIzq = new PImage[3];
    for (int i = 0; i < 3; i++) {
      AstroDer[i] = loadImage("Ast_der_"+i+".png");
      AstroIzq[i] = loadImage("Ast_izq_"+i+".png");
    }

    AstroQuietoDer = loadImage("Ast_quieto_der.png");
    AstroQuietoIzq = loadImage("Ast_quieto_izq.png");
    attachImage(AstroDer[0]);
  }

  void actualizar() {


    //defino un arreglo de "personas"/blobs/manchas
    TSPSPerson[] ArrayPersonas= TodasLasPersonas.getPeopleArray();
    //recorrer el arreglo
    for (int i=0; i<ArrayPersonas.length; i++) {
      float edad=ArrayPersonas[i].age%255;
      stroke(edad, 255, 255);
      float velx=map(ArrayPersonas[i].velocity.x, 0, 80, 10, 160);
      float vely=map(ArrayPersonas[i].velocity.y, 0, 80, 10, 160);
      float promedio= (velx+vely)/2;
      int ID=ArrayPersonas[i].oid;
      if (ID==0) {
        ellipse(ArrayPersonas[i].centroid.x*width, ArrayPersonas[i].centroid.y*height, 120, 120);
      } else {
      }
    }

    if (izqPresionado) {
      
      setVelocity(-velocidad, getVelocityY());
      direccion = "izq";
    }
    if (derPresionado) {
      
      setVelocity(velocidad, getVelocityY());
      direccion = "der";
    }
    if (!izqPresionado && !derPresionado) {
      
      setVelocity (0, getVelocityY());
    }
    if (frameCount % 4 == 0) {
      
      frameCaminata = (frameCaminata + 1) % 3;
    }
    if (direccion == "der") {
      
      if (getVelocityX() == 0) {

        attachImage(AstroQuietoIzq);
      } else {

        attachImage(AstroDer[frameCaminata]);
      }
    } else {

      if (getVelocityX() == 0) {
        
        attachImage(AstroQuietoDer);
      } else {

        attachImage(AstroIzq[frameCaminata]);
      }
    }
  }
}
*/
