#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

int main(void) {
    // Read the text file "strings.txt"
    FILE *fp = fopen("strings.txt", "r");
    if (fp == NULL) {
        puts("get flag error");
        exit(0);
    }

    // For each line run the command ./crypt4 <line>
    char line[100];
    while (fgets(line, sizeof(line), fp)) {
        line[strcspn(line, "\n")] = 0;

        char command[100];
        printf("Running command: ./crypt4 %s", line);
        
        // If the command shows "Congratulations your password was correct!" then we have the flag
        sprintf(command, "./crypt4 %s", line);

        FILE *fp2 = popen(command, "r");
        if (fp2 == NULL) {
            puts("get flag error");
            exit(0);
        }

        char output[100];
        fgets(output, sizeof(output), fp2);

        if (strstr(output, "Congratulations your password was correct!")) {
            printf("Flag: %s", output);
            exit(0);

        }

        pclose(fp2);
    }

    return 0;
}