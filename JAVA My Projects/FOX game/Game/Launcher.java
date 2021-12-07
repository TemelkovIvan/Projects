package Game;

import javax.swing.JFrame;

public class Launcher {

	public static void main(String[] args) {
		Fox fox = new Fox();
		fox.frame = new JFrame();
		fox.frame.setResizable(false);
		fox.frame.setTitle("Together We can do so much");
		fox.frame.add(fox);
		fox.frame.pack();
		fox.frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		fox.frame.setLocationRelativeTo(null);
		fox.frame.setVisible(true);
		fox.start();
	}

}
