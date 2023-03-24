import processing.core.PApplet;
import processing.core.PImage;

import java.awt.*;

public class WORLD extends PApplet {
    public static boolean wall, wall2;
    PImage viseur, sky, sky2;

    public static void main(String[] args) {
        String[] prossesingArgs = {"fr.redmine4404.lol.truc"};
        WORLD world = new WORLD();
        PApplet.runSketch(prossesingArgs, world);
    }

    public void world() {
        //background(sky);
        boxes(0, 0, 0, 5000, 5000, 5000, new Color(255, 255, 255));
        wall = false;//reset les deux hitbox en début de boucle
        wall2 = false;
        ground();
        boxes(0, 0, 500, 200, 100, 50, new Color(82, 21, 21));//boxe
        boxes(500, 0, 0, 200, 800, 50, new Color(57, 61, 234));//boxe
        boxes(-500, 0, 0, 200, 50, 50, new Color(86, 100, 78));//boxe
        boxes(0, 0, -500, 200, 200, 200, new Color(86, 100, 78));//boxe
        //  propre(0, 0, 500, 200);

        println(wall, wall2);
    }

    public void boxes(int xx, int yy, int zz, int h, int p, int l, Color couleur) {
        push();
        translate(xx, yy, zz); // place la boxe
        fill(couleur.getColor(1), couleur.getColor(2), couleur.getColor(3)); // choisit une couleur
        if (-deplacements.x > xx - h / 1.2 && -deplacements.x < xx + h / 1.2
                && -deplacements.z > zz - l / 1.2 && -deplacements.z < zz + l / 1.2 && -deplacements.y > yy - p / 1 && -deplacements.y < yy + p / 1) { // on inverse les X et Z car c'est le décors qui bouge et non le joueur
            //  fill(0); // choisit une couleur
            wall = true;
        }
        if (-deplacements.x > xx - h / 1.2 && -deplacements.x < xx + h / 1.2
                && -deplacements.z > zz - l / 1.2 && -deplacements.z < zz + l / 1.2) { // hitbox sans l'axe Y pour le saut, savoir si on est ou non dans l'objet
            // fill(0); // choisit une couleur
            wall2 = true;
        }
  /*
   if ( dist ((-x), (-z), xx, zz) < l) {  // pour les sphères
   fill(0); // choisit une couleur
   }
   */
        box(h, p, l); //créer une boxe aux dimensions suivantes
        pop();
    }

    public void ground() {
        push();
        fill(101, 93, 103);
        box(2000, 1, 2000);
        translate(0, 100, 0);
        pop();

    }
}