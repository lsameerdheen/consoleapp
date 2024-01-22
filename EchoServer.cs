namespace consoleapp;

using System;
using System.IO;
using System.Net;
using System.Net.Sockets;

public class EchoServer
{
    private TcpListener _Server;
    private bool _Active;

    public EchoServer()
    {
        _Server = new TcpListener(IPAddress.Any, 5555);
    }

    public async void StartListening()
    {
        _Active = true;
        _Server.Start();
        await AcceptConnections();
    }

    public void StopListening()
    {
        _Active = false;
        _Server.Stop();
    }

    private async Task AcceptConnections()
    {
        while (_Active)
        {
            var client = await _Server.AcceptTcpClientAsync();
            DoStuffWithClient(client);
        }
    }

    private void DoStuffWithClient(TcpClient client)
    {
        NetworkStream stream = client.GetStream();
        using (StreamReader reader = new StreamReader(stream))
        using (StreamWriter writer = new StreamWriter(stream))
        {
            String line = reader.ReadLine();
            while(line != null && line != "bye"){
                Console.WriteLine("Client said: {0}", line);
                writer.WriteLine("recieved you message:" + line);
                writer.Flush();
                line = reader.ReadLine();
            }
            writer.WriteLine("see you!!");
        }

    }

}