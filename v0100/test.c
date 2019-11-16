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

int test5(int a, int b, int c)
{
    return a + b + c;
}

int test6(int a)
{
    if (a > 0)
    {
        return a + test6(a-1);
    }

    return 0;
}

void main(int argc, char** argv)
{
    int  a  = 50;
    char c1 = 21;
    int  b  = 70;
    char c2 = 31;

    if (sizeof(char) != 1)
    {
        puts("Wrong size for char");
        abort();
    }

    if (sizeof(short) != 2)
    {
        puts("Wrong size for short");
        abort();
    }

    if (sizeof(int) != 4)
    {
        puts("Wrong size for int");
        abort();
    }

    if (sizeof(long) != 8)
    {
        puts("Wrong size for long");
        abort();
    }

    puts("checking sum of the locals.."); 
    if (a + 21 + b + 31 == 50 + c1 + 70 + c2) 
        puts("ok"); 
    else 
        abort(); 

    puts("Running test 0");

    test0();

    puts("checking sum of the locals.."); 
    if (a + 21 + b + 31 == 50 + c1 + 70 + c2) 
        puts("ok"); 
    else 
        abort(); 

    if (test1() == 1)
        puts("test 1 passed");
    else
        abort();

    if (1 == test1())
        puts("test 1' passed");
    else
        abort();

    if (test1() + test1() + test1() == 3)
        puts("test 1'' passed");
    else
        abort();

    // if (test1() + test1() == test1() + test1())
    //     puts("test 1''' passed");
    // else
    //     abort();

    puts("checking sum of the locals.."); 
    if (a + 21 + b + 31 == 50 + c1 + 70 + c2) 
        puts("ok"); 
    else 
        abort(); 

    if (test2() == 2)
        puts("test 2 passed");
    else
        abort();

    puts("checking sum of the locals.."); 
    if (a + 21 + b + 31 == 50 + c1 + 70 + c2) 
        puts("ok"); 
    else 
        abort(); 

    if (test3() == 4)
        puts("test 3 passed");
    else
        abort();

    puts("checking sum of the locals.."); 
    if (a + 21 + b + 31 == 50 + c1 + 70 + c2) 
        puts("ok"); 
    else 
        abort(); 

    if (test4() == 6)
        puts("test 4 passed");
    else
        abort();

    int  x  = -150;
    char y1 = 121;
    int  z  = -170;
    char w2 = 110;
    char w3 = -100;

    puts("checking sum of the newly declared locals.."); 
    if (x + 121 + z + 110 + w3 == -150 + y1 - 170 + w2 - 100)
        puts("ok"); 
    else 
    {
        if (x  != -150)
            puts("x changed!");
        if (y1 != 121)
            puts("y1 changed!");
        if (z  != -170)
            puts("z changed!");
        if (w2 != 0)
            puts("w2 changed!");
        if (w3 != -100)
            puts("w3 changed!");

        abort();
    }

    puts("checking sum of the locals.."); 
    if (a + 21 + b + 31 == 50 + c1 + 70 + c2) 
        puts("ok"); 
    else 
        abort(); 

    if (test5(3, 1,-5) + 1== 0)
        puts("test 5 passed");
    else
        abort();

    if (1 + y1 + test5(3, 1,-5) == y1)
        puts("test 5' passed");
    else
        abort();

    // if (y1 + test5(3, 1,-5) == y1 + test5(3, 1,-5))
    //     puts("test 5'' passed");
    // else
    //     abort();

    if (5050 + test6(100) == 10100)
        puts("test 6 (recursion) passed");
    else
        abort();
}
