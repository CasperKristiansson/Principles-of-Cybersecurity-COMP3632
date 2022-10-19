#include <stdio.h>

int opaquePredicates() {
    int x = 100;
    if (x+x >= x*x) {

    }

    time_t now = time(NULL);
    time_t yesterday = now - 24 * 60 * 60;
    if (now < yesterday) {

    }

    // print the current time
    printf("%s", ctime(&now));

}

int main() {
       
    return 0;
}