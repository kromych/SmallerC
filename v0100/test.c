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

char test2()
{
    int a = -12;
    char c = 12;
    char b = -31;
    int d = 33;

    if (a + b + c + d == 2)
    {
        return 2;
    }
    else
    {
        return 5;
    }
}

int  test3_a = -12;
char test3_c = 12;
char test3_b = -31;
int  test3_d = 33;

char test3()
{
    if (test3_a + test3_b + test3_c + test3_d == 2)
    {
        return 4;
    }
    else
    {
        return 7;
    }
}

int  test4_a;
char test4_c;
char test4_b;
int  test4_d;

char test4()
{
    test4_a = -12;
    test4_c = 12;
    test4_b = -31;
    test4_d = 33;

    if (test4_a + test4_b + test4_c + test4_d == 2)
    {
        return 6;
    }
    else
    {
        return 9;
    }
}

void main(int argc, char** argv)
{
    test0();

    if (test1() == 1)
        puts("test 1 passed");
    else
        abort();

    if (test2() == 2)
        puts("test 2 passed");
    else
        abort();

    if (test3() == 4)
        puts("test 3 passed");
    else
        abort();

    if (test4() == 6)
        puts("test 4 passed");
    else
        abort();
}
