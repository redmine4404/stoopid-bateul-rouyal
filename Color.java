public class Color {
    int rgb1;
    int rgb2;
    int rgb3;
    public Color (int rgb1, int rgb2, int rgb3){
        this.rgb1 = rgb1;
        this.rgb2 = rgb2;
        this.rgb3 = rgb3;
    }

    public int getColor(int number){
        switch(number){
            case 1 : return rgb1;
            case 2 : return rgb2;
            case 3 : return rgb3;
        }
        return 0;
    }


}
