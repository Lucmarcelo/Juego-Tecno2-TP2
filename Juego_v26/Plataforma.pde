class Plataforma extends FBox
{
 
  Plataforma (float anch , float alt)
  {
    super(anch, alt);
   
  }
  
  void inicializar(float x , float y) {
    pushMatrix();
    setName("plataforma");
    setPosition(x, y);
    setStatic(true);
    setNoStroke();
    setFill(200);
    attachImage(suelo);
    popMatrix();
  }
  
}
  
