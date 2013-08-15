syscall:::entry 
{
  printf("%s(%d) called %s\n", execname, pid, probefunc)
}
