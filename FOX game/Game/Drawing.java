package Game;

import java.awt.Graphics;

public class Drawing {
	

	protected void drawing(Graphics g,int x,int y,int z,int i,int a,int b,int c,int d,int e,int f,int gg,int h,
			boolean eat,
			boolean eat1,
			boolean eat2,
			boolean eat3,
			boolean eat4) {
	
	g.drawImage(ImageLoader.loadImage("/img/g.jpg"), 0, 0, null);
	
	if (eat) {
		g.drawImage(ImageLoader.loadImage("/img/4.png"), x,y, null);
	}
	
	if (eat1) {
		g.drawImage(ImageLoader.loadImage("/img/5.png"), x,y, null);	
	}
	if (eat2) {
		g.drawImage(ImageLoader.loadImage("/img/6.png"), x,y, null);	
	}
	if (eat3) {
		g.drawImage(ImageLoader.loadImage("/img/7.png"), x,y, null);	
	}
	if (eat4) {
		g.drawImage(ImageLoader.loadImage("/img/8.png"), x,y, null);	
	}
		
	if (eat) {
		g.drawImage(ImageLoader.loadImage("/img/4.png"), z,i, null);
	}
	if (eat1) {
		g.drawImage(ImageLoader.loadImage("/img/5.png"), a,b, null);
	}
	if (eat2) {
		g.drawImage(ImageLoader.loadImage("/img/6.png"), c,d, null);
	}
	if (eat3) {
		g.drawImage(ImageLoader.loadImage("/img/7.png"), e,f, null);
	}
	
	if (eat4) {
		g.drawImage(ImageLoader.loadImage("/img/8.png"), gg,h, null);
	}
	}
}
