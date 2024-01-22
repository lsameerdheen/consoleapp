namespace consoleapp;
using System;
using System.IO;
using System.Net;
using System.Net.Sockets;



class Program
{
    static void Main(string[] args)
    {
         EchoServer server = new EchoServer();
         server.StartListening();
         Console.WriteLine("use 'stop' to stop server");         
        String command = Console.ReadLine();
        while(command != null && command != "stop"){
            command = Console.ReadLine();
        };       
         server.StopListening();
    }
}
