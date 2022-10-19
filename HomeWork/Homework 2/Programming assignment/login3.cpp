#include <cstdio>
#include <cstring>
#include <cstdlib>
#include <unistd.h>
#include <stdint.h>
#include <time.h>
using namespace std;

// 20938643111111111111111111111111 11111111111111111111111111111111dbkejhfe111111111111111111111111111111112093864311111111111111111111111120938643111111111111111111111111
// 11111111111111111111111111111111 11111111111111111111111111111111        1111111111111111111111111111111120938643111111111111111111111111


void login3(char * input1, char * input2) {
	struct {
		char goodcanary[8];
		char password[32];
		char canary[8];
		char good_password[32];
		char good_username[32];
		char username[32];
	} v;

	//read correct username and password
	FILE * fp = fopen("password.txt", "r");
	fgets(v.good_username, 32, fp);
	fgets(v.good_password, 32, fp);
	fclose(fp);
	v.good_username[strlen(v.good_username)-1] = '\0';
	v.good_password[strlen(v.good_password)-1] = '\0';

	//load username
	strcpy(v.username, input1);

	//mimic a "random" canary
	for (int i = 0; i < 8; ++i)
	{
		v.goodcanary[i] =  (v.username[i] - '0' + 'a' + 1);
		v.canary[i] = v.goodcanary[i];
		// printf("%c\n", v.goodcanary[i]);
	}

	//load password
	strcpy(v.password, input2);

	//terminate strings properly for strcmp
	v.username[31] = '\0';
	v.password[31] = '\0';
	v.good_username[31] = '\0';
	v.good_password[31] = '\0';

	//check canary and login success
	if (strncmp(v.goodcanary, v.canary, 8) != 0) {
	  printf("Stack overflow detected, exiting.\n\r");
          exit(-1);
	}
	if (strcmp(v.username, v.good_username) == 0 && strcmp(v.password, v.good_password) == 0)
        printf("Login successful!\n\r");
    else
        printf("Try again.\n\r");
}

int main(int argc, char* argv[]) {
	if (argc < 3) {
		return -1;
	}

	if(access("password.txt", F_OK) == -1) {
		printf("password.txt not found; please download it and put it in this directory.\n\r");
		return -1;
	}

	if (strlen(argv[1]) < 2) {
    // invalid input
		return -1;
	}

	login3(argv[1], argv[2]);
	return 0;
}
