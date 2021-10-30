import java.io.*;
import java.net.*;

class Client {
    public static void main(String[] args) {
        try {
            Socket s = new Socket("127.0.0.1",1201);
            DataInputStream dIn = new DataInputStream(s.getInputStream());
            DataOutputStream dOut = new DataOutputStream(s.getOutputStream());

            BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
            String msgIn = "", msgOut = "";
            while (!msgIn.equals("end")){
                msgOut = br.readLine();
                dOut.writeUTF(msgOut);
                msgIn = dIn.readUTF();
                System.out.println(msgIn);
            }

        } catch (Exception e) {

        }
    }
}
