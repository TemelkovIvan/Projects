package Game;

import java.awt.Canvas;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.image.BufferStrategy;
import javax.swing.JFrame;

public class Fox extends Canvas implements Runnable, KeyListener {
	public static final int width = 800;
	public static final int height = 600;
	
	public int x = 0;
	public int y = 0;
	protected int speed = 5;
	protected int z = 650, i = 400;
	protected int a = 120, b = 60;
	protected int c = 60, d = 280;
	protected int e = 0, f = 500;
	protected int gg = 623,h = 121;
	public static boolean eat = true;
	public static boolean eat1, eat2,eat3,eat4,water;
	public static boolean isMovingLeft;
	public static boolean isMovingRight;
	public static boolean isMovingUp;
	public static boolean isMovingDown;
	
	private Thread thread;
	JFrame frame;
	private boolean running = false;
	
	public Fox() {
		Dimension size = new Dimension(width, height);
		setPreferredSize(size);
		}
	
	public synchronized void start() {
		running = true;
		thread = new Thread(this, "Display");
		thread.start();
		addKeyListener(this);
		setFocusable(true);
		setFocusTraversalKeysEnabled(false);
	}
	
	public synchronized void stop() {
		running = false;
		try {
			thread.join();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
	
	public void run() {
		while(running) {
			/*try {
				Thread.sleep(0);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			*/	
			tick();
			render();
			}
	}
	
	protected void render() {
		BufferStrategy bs = getBufferStrategy();
		if (bs == null) {
			createBufferStrategy(2);
			return;
		}
		
		Graphics g = bs.getDrawGraphics();
		g.clearRect(0,0,width,height);

		//Start drawing
		Drawing drawing = new Drawing();
		drawing.drawing(g,x,y,z,i,a,b,c,d,e,f,gg,h,eat,eat1,eat2,eat3,eat4);
		//End drawing
		
		g.dispose();
		bs.show();
		}
	
	protected void tick() {
		if (isMovingLeft) {
			x=x-speed;
			if (x< 0) {
				x=width;
			}
		//level1
				if (x>300 & x<315 & y>95 & y<500) {
					x=310;
				}
				
	} else if (isMovingRight) {
		x=x+speed;
		if (x>width) {
			x=0;
		}
		//level1
				if (x>245 & x<300 & y>100 & y<510) {
					x=250;
				}
	} else if (isMovingUp) {
		y=y-speed;
		if (y<0) {
			y=height;
		}
		//level1
				if (x>40 & x<300 & y>100 & y<115) {
					y=110;
				}
				if (x>290 & x<740 & y>500 & y<515) {
					y=510;
				}
	} else if (isMovingDown) {
		y=y+speed;
		if (y>height) {
			y=0;
		}
		//level1
				if (x>40 & x<300 & y>60 & y<100) {
					y=60;
				}
				if (x>290 & x<740 & y>455 & y<500) {
					y=455;
				}
	}
	
	//Start River
		if (x > 30 & x<50 & y>70 & y<90) {
			water = true;	
		}
		if (water) {
			x=x+10;
			if (x>300) {
				x=x-10;
				y=y+10;
				if (y>480) {
					y=y-10;
					x=x+10;
					if (x>750) {
						x=750;
						y=480;
						water = false;
					}
				}
			}
		}
	//Finish River
	
	if (eat == true) {
	if (x<z+10 & x>z-10 & y<i+10 & y>i-10 & eat == true) {
		eat=false;
		eat1 = true;
	}
}
if (eat1 == true) {
	if (x<a+15 & x>a-15 & y<b+15 & y>b-15) {
		eat=false;
		eat1=false;
		eat2 = true;
	}
}
if (eat2 == true) {
	if (x<c+20 & x>c-20 & y<d+20 & y>d-20) {
		eat=false;
		eat1=false;
		eat2 = false;
		eat3 = true;
	}
}
if (eat3 == true) {
	if (x<e+30 & x>e-30 & y<f+30 & y>f-30) {
		eat=false;
		eat1=false;
		eat2 = false;
		eat3 = false;
		eat4 = true;
		}
	}
	
}


	@Override
	public void keyTyped(KeyEvent e) {

	}

	public void keyPressed(KeyEvent e) {
		int keyCode = e.getKeyCode();
		if (keyCode == KeyEvent.VK_LEFT) {
			isMovingLeft = true;
		} else if (keyCode == KeyEvent.VK_RIGHT) {
			isMovingRight = true;
		} else if (keyCode == KeyEvent.VK_UP) {
			isMovingUp = true;
		} else if (keyCode == KeyEvent.VK_DOWN) {
			isMovingDown = true;
		} else if (keyCode == KeyEvent.VK_SPACE) {
			speed = 25;
		}
	}
	
	public void keyReleased(KeyEvent e) {
	int keyCode = e.getKeyCode();
		if (keyCode == KeyEvent.VK_LEFT) {
			isMovingLeft = false;
		} 
		if (keyCode == KeyEvent.VK_RIGHT) {
			isMovingRight = false;
		} 
		if (keyCode == KeyEvent.VK_UP) {
			isMovingUp = false;
		} 
		if (keyCode == KeyEvent.VK_DOWN) {
			isMovingDown = false;
		}
		if (keyCode == KeyEvent.VK_SPACE) {
			speed = 5;
		}		
	}
}
