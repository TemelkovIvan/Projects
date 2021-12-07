import java.io.*;
import java.net.*;

class Server {
    public static void main(String[] args) {
        try {
            ServerSocket ss = new ServerSocket(1201);
            Socket s = ss.accept();

            DataInputStream dIn = new DataInputStream(s.getInputStream());
            DataOutputStream dOut = new DataOutputStream(s.getOutputStream());
            BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

            String msgIn = "", msgOut = "";

            while (!msgIn.equals("end")){
                msgIn = dIn.readUTF();
                System.out.println(msgIn);
                msgOut = br.readLine();
                dOut.writeUTF(msgOut);
                dOut.flush();
            }
            s.close();
        } catch (Exception e) {
    }
    }

}
