#include <stdio.h>

int get_item(int idx) {
    int array[1000];
    // Initialize array
    for (int i = 0; i < 1000; i++) {
        array[i] = i;
    }

    if (idx >= 1000) return -1;

    return array[idx];
}

int main() {
    // Exploit integer overflow
    int idx = 1000;
    int result = get_item(idx);
    printf("%d", result);

    
    return 0;
}