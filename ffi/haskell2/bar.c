#include "foo_stub.h"

void my_init()
{
  int argc = 2;
  char *argv[] = { "+RTS", "-A32m", 0 };
  char **pargv = argv;
  hs_init(&argc, &pargv);
}

void my_exit()
{
  hs_exit();
}
