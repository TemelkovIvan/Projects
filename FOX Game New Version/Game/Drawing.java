package Game;

import java.awt.Graphics;

public class Drawing {

	//Mushroom
	public static boolean poisoning1,poisoning2,poisoning3,poisoning4,poisoning5,poisoning6;
	int MushroomOne_X,MushroomOne_Y,MushroomTwo_X,MushroomTwo_Y,MushroomThree_X,MushroomThree_Y,
		MushroomFour_X,MushroomFour_Y,MushroomFive_X,MushroomFive_Y,MushroomSix_X, MushroomSix_Y;
	//Chicken
	public static int chicken_X, chicken_Y;
	int TextDown;
	public static int SizeFox = 4;

	public static boolean eat = true;
	public static boolean eat1,eat2,eat3,eat4,eat5;

	protected void drawing(Graphics g,int x,int y, int TextMove) {

		TextDown = 580;

		MushroomOne_X = 560; MushroomOne_Y = 120;
		MushroomTwo_X = 360; MushroomTwo_Y = 280;
		MushroomThree_X = 690; MushroomThree_Y = 80;
		MushroomFour_X = 40; MushroomFour_Y = 0;
		MushroomFive_X = 50; MushroomFive_Y = 480;
		MushroomSix_X = 130; MushroomSix_Y = 200;

		g.drawImage(ImageLoader.loadImage("/img/g.jpg"), 0, 0, null);
		g.drawImage(ImageLoader.loadImage("/img/IT.png"), TextMove, TextDown, null);

		if (SizeFox == 0) {
			SizeFox = 1;
		}
		g.drawImage(ImageLoader.loadImage("/img/"+ SizeFox +".png"), x,y, null);

		g.drawImage(ImageLoader.loadImage("/img/chicken.png"), chicken_X, chicken_Y, null);

		if (!poisoning1) {
			g.drawImage(ImageLoader.loadImage("/img/X.png"), MushroomOne_X, MushroomOne_Y, null);
			if ((x > MushroomOne_X - 10) & (x < MushroomOne_X + 20) & (y > MushroomOne_Y - 10) & (y < MushroomOne_Y + 20)) {
				poisoning1 = true;
			}
		}

	if (!poisoning2) {
		g.drawImage(ImageLoader.loadImage("/img/X.png"), MushroomTwo_X, MushroomTwo_Y, null);
		if ((x > MushroomTwo_X - 10) & (x < MushroomTwo_X + 20) & (y > MushroomTwo_Y - 10) & (y < MushroomTwo_Y + 20)) {
			poisoning2 = true;
			SizeFox--;
		}
	}
	if (!poisoning3) {
		g.drawImage(ImageLoader.loadImage("/img/X.png"), MushroomThree_X, MushroomThree_Y, null);
		if ((x > MushroomThree_X - 10) & (x < MushroomThree_X + 20) & (y > MushroomThree_Y - 10) & (y < MushroomThree_Y + 20)) {
			poisoning3 = true;
			SizeFox--;
		}
	}
	if (!poisoning4) {
		g.drawImage(ImageLoader.loadImage("/img/X.png"), MushroomFour_X, MushroomFour_Y, null);
		if ((x > MushroomFour_X - 10) & (x < MushroomFour_X + 20) & (y > MushroomFour_Y - 10) & (y < MushroomFour_Y + 20)) {
			poisoning4 = true;
			SizeFox--;
		}
	}
	if (!poisoning5) {
		g.drawImage(ImageLoader.loadImage("/img/X.png"), MushroomFive_X, MushroomFive_Y, null);
		if ((x > MushroomFive_X - 10) & (x < MushroomFive_X + 20) & (y > MushroomFive_Y - 10) & (y < MushroomFive_Y + 20)) {
			poisoning5 = true;
			SizeFox--;
		}
	}
	if (!poisoning6) {
		g.drawImage(ImageLoader.loadImage("/img/X.png"), MushroomSix_X, MushroomSix_Y, null);
		if ((x > MushroomSix_X - 10) & (x < MushroomSix_X + 20) & (y > MushroomSix_Y - 10) & (y < MushroomSix_Y + 20)) {
			poisoning6 = true;
			SizeFox--;
		}
	}

	if (eat) {
		chicken_X = 650; chicken_Y = 400;
			if (x< chicken_X +20 & x> chicken_X -10 & y< chicken_Y +20 & y> chicken_Y -10) {
				eat=false;
				eat1 = true;
				SizeFox++;
			}
		}
	if (eat1) {
		chicken_X = 120; chicken_Y = 60;
			if (x< chicken_X +20 & x> chicken_X -10 & y< chicken_Y +20 & y> chicken_Y -10) {
				eat1=false;
				eat2 = true;
				SizeFox++;
			}
		}
	if (eat2) {
		chicken_X = 60; chicken_Y = 280;
			if (x< chicken_X +20 & x> chicken_X -10 & y< chicken_Y +20 & y> chicken_Y -10) {
				eat2 = false;
				eat3 = true;
				SizeFox++;
			}
		}
	if (eat3) {
		chicken_X = 0; chicken_Y = 500;
			if (x< chicken_X +20 & x> chicken_X -10 & y< chicken_Y +20 & y> chicken_Y -10) {
				eat3 = false;
				eat4 = true;
				SizeFox++;
			}
		}
		if (eat4) {
			chicken_X = 623; chicken_Y = 121;
			if (x< chicken_X +20 & x> chicken_X -10 & y< chicken_Y +20 & y> chicken_Y -10) {
				eat4 = false;
				eat5 = true;
				SizeFox++;
			}
		}
		if (eat5) {
			chicken_X = 810; chicken_Y = 0;
			poisoning1 = true;
			poisoning2 = true;
			poisoning3 = true;
			poisoning4 = true;
			poisoning5 = true;
			poisoning6 = true;
			}
	}
}
