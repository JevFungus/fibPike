#! /usr/bin/env pike

//sorry for lack of comments, I may add them in the future.

void fibFetch (int num)
{
  int n = 0;
  int m = 1;
  int fib;

  write("Fetching fibonacci number " + num + "\n");

  for (int i = num; i > 0; i--)
  {
    fib = m;
    m += n;
    n = m - n;
  }
  write(fib + "\n");
}

void fibCount (int num)
{
  int n = 0;
  int m = 1;
  int fib;

  write("Counting to " + num + "\n");

  for (int i = num; i > 0; i--)
  {
    fib = m;
    m += n;
    n = m - n;
    write(fib + "\n");
  }
}

int main (int argc, array(string) argv)
{
  string mode;
  int num;

  if (argc == 1)
  {
    do
    {
      write("Choose mode [count/fetch]\n");
      mode = Stdio.stdin->gets();
      if (mode != ("count" || "fetch"))
      {
        write("Invalid command, try again\n");
        mode = "";
      }
    } while (sizeof(mode) == 0);
    if (mode == "count")
    {
      do
      {
        write("What would you like to count to? [positive integers only]\n");
        num = (int)Stdio.stdin->gets();
      } while (num == 0);
    } else if (mode == "fetch")
    {
      do
      {
        write("What one shoud I fetch? [positive integers only]\n");
        num = (int)Stdio.stdin->gets();
      } while (num == 0);
    } else
    {
      write("Unknown mode. Terminating...");
      exit(0);
    }
  } else if (argc == 2)
  {
    mode = argv[1];
    if (mode == "count")
    {
      do
      {
        write("What would you like to count to? [positive integers only]\n");
        num = (int)Stdio.stdin->gets();
      } while (num == 0);
    } else if (mode == "fetch")
    {
      do
      {
        write("What one shoud I fetch? [positive integers only]\n");
        num = (int)Stdio.stdin->gets();
      } while (num == 0);
    } else
    {
      write("Unknown mode. Terminating...");
      exit(0);
    }
  } else if (argc == 3)
  {
    mode = argv[1];
    num = (int)argv[2];
  } else
  {
    write("Too many arguments. Should be './fib.pike <mode> <number>'");
    exit(0);
  }
  
  if (mode == "count")
    fibCount(num);
  else if (mode == "fetch")
    fibFetch(num);
  return 0;
}
