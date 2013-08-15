#include "foo_stub.h"

void tk_init(int argc, char *argv[])
{
  hs_init(&argc, &argv);
}

void tk_exit()
{
  hs_exit();
}
