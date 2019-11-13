extern void abort();
extern void puts(const char*);

void test0()
{
    int a = -12;
    char c = 1;
    void* p = 0;
    char b = 2;
    char* cp = &c;

    *cp = 42;
}

char test1()
{
    int a = -12;
    char c = 12;

    if (a + c == 0)
    {
        return 1;
    }
    else
    {
        return 3;
    }
}

void main(int argc, char** argv)
{
    test0();
    if (test1() == 1)
    {
        /* Ok */
        puts("test 1 passed");
    }
    else
    {
        abort();
    }
}
