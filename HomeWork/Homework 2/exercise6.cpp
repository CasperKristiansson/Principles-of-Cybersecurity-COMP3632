#include <iostream>
#include <string>

float number_ration(std::string s) {
    int n = 0;

    for (int i = 0; i < s.size(); i++) {
        if (s[i] >= '0' && s[i] <= '9') {
            n++;
        }
    }

    return n / s.size();
}

int main() {
    std::string s = "1234567890a";
    std::cout << number_ration(s);

    return 0;
}