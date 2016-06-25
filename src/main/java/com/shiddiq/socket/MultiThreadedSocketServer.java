package com.shiddiq.socket;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scripting.config.LangNamespaceHandler;

import com.shiddiq.entity.Lamp;
import com.shiddiq.service.impl.CheckConnectionSchedulerImpl;
import com.shiddiq.service.LampService;

/**
 * A TCP server that runs on port 8080. Using Multiple Threaded Socket Connection
 * When a client.sensor connects, it
 * sends the client the request and response, then closes the
 * connection with that client.
 * Create by Muhammad Shiddiq Azis 18.06.2016
 * shiddiqitt@gmail.com  
 */

public class MultiThreadedSocketServer {

	 private static final Logger logger = Logger.getLogger(MultiThreadedSocketServer.class);
	 private static String IPHW="";
	 private static String ASCIImsg="";
	 
	 @Autowired
	 private LampService lampService;
	
    ServerSocket myServerSocket;
    boolean ServerOn = true;
    
    public MultiThreadedSocketServer(){
    
    }


    public void RunMultiThreadedSocketServer() 
    { 
        try 
        { 
            myServerSocket = new ServerSocket(8080); 
        } 
        catch(IOException ioe) 
        { 
            System.out.println("Could not create server socket on port 8080. Quitting."); 
            System.exit(-1); 
        } 




        Calendar now = Calendar.getInstance();
        SimpleDateFormat formatter = new SimpleDateFormat("E yyyy.MM.dd 'at' hh:mm:ss a zzz");
        logger.info("It is now : " + formatter.format(now.getTime()));
        System.out.println("It is now : " + formatter.format(now.getTime()));




        // Successfully created Server Socket. Now wait for connections. 
        while(ServerOn) 
        {                        
            try 
            { 
                // Accept incoming connections. 
                Socket clientSocket = myServerSocket.accept(); 

                // accept() will block until a client connects to the server. 
                // If execution reaches this point, then it means that a client 
                // socket has been accepted. 

                // For each client, we will start a service thread to 
                // service the client requests. This is to demonstrate a 
                // Multi-Threaded server. Starting a thread also lets our 
                // MultiThreadedSocketServer accept multiple connections simultaneously. 

                // Start a Service thread 

                ClientServiceThread cliThread = new ClientServiceThread(clientSocket);
                cliThread.start(); 

            } 
            catch(IOException ioe) 
            { 
                System.out.println("Exception encountered on accept. Ignoring. Stack Trace :"); 
                ioe.printStackTrace(); 
            } 

        }

        try 
        { 
            myServerSocket.close(); 
            System.out.println("Server Stopped"); 
        } 
        catch(Exception ioe) 
        { 
            System.out.println("Problem stopping server socket"); 
            System.exit(-1); 
        } 



    } 

    public static  void runsocketconn () 
    { 
        new MultiThreadedSocketServer();
        
//        String message = IPHW+","+ASCIImsg;
//		return message;
    } 


    class ClientServiceThread extends Thread 
    { 
        Socket myClientSocket;
        boolean m_bRunThread = true; 

        public ClientServiceThread() 
        { 
            super(); 
        } 

        ClientServiceThread(Socket s) 
        { 
            myClientSocket = s; 

        } 

        public void run() 
        {            
            // Obtain the input stream and the output stream for the socket 
            // A good practice is to encapsulate them with a BufferedReader 
            // and a PrintWriter as shown below.
        	 String input="";
            BufferedReader in = null; 
            PrintWriter out = null; 

            // Print out details of this connection 
            System.out.println("Accepted Client Address - " + myClientSocket.getInetAddress().getHostName()); 
            logger.info("Accepted Client Address - " + myClientSocket.getInetAddress().getHostName());
             IPHW=myClientSocket.getInetAddress().getHostName();
             System.out.println("Accepted Client Address IPHW - " + IPHW); 
             logger.info("Accepted Client Address - IPHW " + IPHW);
            
            
			

            try 
            {                                
                in = new BufferedReader(new InputStreamReader(myClientSocket.getInputStream())); 
                out = new PrintWriter(new OutputStreamWriter(myClientSocket.getOutputStream())); 
                
              //add method to update table lamp
                
             
                // At this point, we can read for input and reply with appropriate output. 

                // Run in a loop until m_bRunThread is set to false 
                while(m_bRunThread) 
            	
                {                    
                    // read incoming stream 
                    String clientCommand = in.readLine();
                    if(clientCommand!=null)	{
                    System.out.println("Client Says :" + clientCommand);
                    
                    List<Lamp> lampList;
					lampList = lampService.getAllLamps();
                    
                  
        		//List<Lamp> lamplist  = lampService.getAllLamps();
        			 System.out.println("Accepted Client Address 2- " +IPHW); 
        			 ASCIImsg=clientCommand;
//        	            logger.info("Accepted Client Address 2- " + IPHW);
//		        			if(lampList.indexOf(IPHW)>=0){
					        				
//					        				  
//			        			}

                   

                    if(!ServerOn) 
                    { 
                        // Special command. Quit this thread 
                        System.out.print("Server has already stopped"); 
                        out.println("Server has already stopped"); 
                        out.flush(); 
                        m_bRunThread = false;   

                    } 
                    //edited by sid 24.06.2016
                    //try{
		                    if(clientCommand.equalsIgnoreCase("quit")) { 
		                        // Special command. Quit this thread 
		                        m_bRunThread = false;   
		                        System.out.print("Stopping client thread for client : "); 
		                    } else if(clientCommand.equalsIgnoreCase("end")) { 
		                        // Special command. Quit this thread and Stop the Server
		                        m_bRunThread = false;   
		                        System.out.print("Stopping client thread for client : "); 
		                        ServerOn = false;
		                    } else if(clientCommand==null){
		                    	clientCommand="waiting for command";
		                    	//NOTHIG TO DO
		                    }
		                    
		                    else {
		                    	clientCommand="no connection";
		                            // Process it \
		                            out.println("Server Says : " + clientCommand); 
		                            out.flush(); 
		                    }
                  // }catch(java.lang.NullPointerException Ex){
                    	//TO DO 
                    	//edited by sid 24.06.2016
                    	//System.out.println("Null pointer = "+Ex);
                    	
                    //}
                	} 
                } 
            } 
            catch(Exception e) 
            { 
                e.printStackTrace(); 
            } 
            finally 
            { 
                // Clean up 
                try 
                {                    
                    in.close(); 
                    out.close(); 
                    myClientSocket.close(); 
                    System.out.println("...Stopped"); 
                   
					
                } 
                catch(IOException ioe) 
                { 
                    ioe.printStackTrace(); 
                } 
                
              
            } 
        } 


    } 
    
  
}