namespace consoleapp;
using System;
using System.IO;
using System.Net;
using System.Net.Sockets;
using System.Diagnostics.CodeAnalysis;
using System.Runtime.InteropServices;
using static System.Console;

class Program
{
    static void Main(string[] args)
    {
         EchoServer server = new EchoServer();
         server.StartListening();
         WriteLine("use 'stop' to stop server");         
        String command = Console.ReadLine();
        while(command != null && command != "stop"){
            command = Console.ReadLine();
        };       
         server.StopListening();
    }
}
