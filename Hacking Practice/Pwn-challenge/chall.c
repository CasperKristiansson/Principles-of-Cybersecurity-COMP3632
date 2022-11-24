#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h>

void getflag(void) {
    char flag[100];

    FILE *fp = fopen("./flag", "r");
    if (fp == NULL) {
        puts("get flag error");
        exit(0);
    }  

    fgets(flag, 100, fp);
    puts(flag);
}

void init() {
    setbuf(stdin, NULL);
    setbuf(stdout, NULL);
    setbuf(stderr, NULL);
    alarm(0x100);
}

void fun(void) {
    char buffer[100];

    read(STDIN_FILENO, buffer, 120);
}

int main(void) {
    init();
    puts("Please enter your name: ");
    char str[256];
    scanf("%s", str );
    printf("Hi ");
    printf(str);
    pid_t pid;
    int *status;

    while(1) {
        pid = fork();

        if(pid < 0) {
            puts("fork error");
            exit(0);
        }
        else if(pid == 0) {
            puts("\nwelcome");
            fun();
            puts("recv sucess");
            return 0;
        }
        waitpid(pid, status, WUNTRACED);
    }
}

