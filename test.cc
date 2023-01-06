
#include<iostream>



//========================================================================
///
//========================================================================
int main(int argc, char **argv)
{
 std::cout << "hello world" << std::endl;

#ifdef PARANOID
 std::cout << "with paranoia" << std::endl;
#else
 std::cout << "without paranoia" << std::endl;
#endif

 return 0;
} //end of main
