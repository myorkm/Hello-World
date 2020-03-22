using System;

namespace Hello_World
{
    class Program
    {
        static void Main(string[] args)
        {
            string output = "";

            if (args.Length > 0)
                output = args[0];

            Console.WriteLine($@"Hello World!{output}");
        }
    }
}
