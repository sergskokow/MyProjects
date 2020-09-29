#include <stdio.h>
#define MAX_SIZE 1000

int is_palindrome(char*);
int get_size(char*);

int main(void) {
    char str[MAX_SIZE];
    for (int i = 0; (str[i]=getchar())!=EOF && i < MAX_SIZE-1; i++)
        if(str[i] == '\n') {
            str[i] = '\0';
            int result = is_palindrome(str);
            printf("%s\n", result?"Palindrome":"Not palindrome");
            i = -1;
        }

    return 0;
}

int is_palindrome(char* source) {
    int size = get_size(source);
    if(size < 2)
        return 0;
    for(int i = 0; i < size/2; ++i)
        if(source[i] != source[size-i-1])
            return 0;
    return 1;
}

int get_size(char* source) {
    int size = 0;
    for(; source[size] != '\0'; ++size)
        ;
    return size;
}