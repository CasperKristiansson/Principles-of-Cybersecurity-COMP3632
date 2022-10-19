// strncat is a function with similar functionality of strcat. strncat appends the first num characters of source to destination, plus a terminating
// null-character. destination is the return value. Please give an implementation of
// strncat. Its interface is
// char * strncat ( char * destination, const char * source, size t num );

// Online C++ compiler to run C++ program online
#include <stdio.h>

char* strncatTest( char* destination, const char* source, size_t num ) {
    char* result = destination;
    while (*destination) {
        destination++;
    }
    
    while (num--) {
        *destination = *source;
        *destination++;
        *source++;
    }

    *destination = '\0';
    return result;
}

int main() {   
    char destination[100] = "Hello";
    char source[100] = "World";
    char* result = strncatTest(destination, source, 3);
    printf("%s", result);

    return 0;
}