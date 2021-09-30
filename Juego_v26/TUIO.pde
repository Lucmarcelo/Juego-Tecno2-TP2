int id = 1;
float x, y;
boolean agregar = false;
boolean presente = false;
boolean quitar = false;

void addTuioObject( TuioObject tobj) {
  if ( tobj.getSymbolID() == id ) {
    x = tobj.getX() * width;
    y = tobj.getY() * height;
    agregar = true;
    presente = true;
  }
}
void updateTuioObject( TuioObject tobj) {
  if ( tobj.getSymbolID() == id ) {
    x = tobj.getX() * width;
    y = tobj.getY() * height;
    presente = true;
  }
}
void removeTuioObject( TuioObject tobj) {
  
    if (  tobj.getSymbolID() == id ) if ( estado == 0 ) {
    musicaFondo.loop();
    estado = estado + 1;
  }



  if ( tobj.getSymbolID() == id ) {
    presente = false;
    quitar = true;
  }
}
void addTuioCursor( TuioCursor tcur) {
}
void updateTuioCursor( TuioCursor tcur) {
}
void removeTuioCursor( TuioCursor tcur) {
}
void addTuioBlob( TuioBlob tblob) {
}
void updateTuioBlob( TuioBlob tblob) {
}
void removeTuioBlob( TuioBlob tblob) {
}
void refresh(TuioTime bundleTime) {
}
