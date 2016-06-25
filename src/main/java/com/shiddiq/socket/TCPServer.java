package com.shiddiq.socket;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Date;

/**
 * A TCP server that runs on port 9090.  When a client connects, it
 * sends the client the request and response, then closes the
 * connection with that client.\
 * Create by Muhammad Shiddiq Azis 
 * shiddiqitt@gmail.com  
 */

public class TCPServer {
	 /**
     * Runs the server.
	 * @return 
	 * @return 
     */
    public static void main(String argv[]) throws Exception {
    	String serverout="Hello ";
    	String clientSentence;
        String capitalizedSentence;
        ServerSocket welcomeSocket = new ServerSocket(8080);

        while(true)
        {
           Socket connectionSocket = welcomeSocket.accept();
           BufferedReader inFromClient =
              new BufferedReader(new InputStreamReader(connectionSocket.getInputStream()));
           DataOutputStream outToClient = new DataOutputStream(connectionSocket.getOutputStream());
           clientSentence = inFromClient.readLine();
           System.out.println("*********************************");
           System.out.println("Received Data From Controller ");
           System.out.println("Received: " + clientSentence);
           //capitalizedSentence = clientSentence.toUpperCase() + '\n';
           outToClient.writeBytes(serverout);
        }
        //return clientSentence;
     }

}
