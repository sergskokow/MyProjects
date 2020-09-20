#include <stdio.h>
#define MAX_SIZE 1000

void reverse(char*);
int get_size(char*);

int main(void) {
    char str[MAX_SIZE];
    for(int i=0; (str[i]=getchar())!=EOF && i<MAX_SIZE-1; ++i)
        if(str[i] == '\n') {
            str[i] = '\0';
            reverse(str);
            printf("%s\n", str);
            i = -1;
        }
}

void reverse(char* source) {
    int size = get_size(source);
    char buf;
    if(!size)
        return;
    else
        for(int i=0; i < size/2; ++i) {
            buf = source[i];
            source[i] = source[size-i-1];
            source[size-i-1] = buf;
        }
}

int get_size(char* source) {
    int size = 0;
    for(; source[size]!='\0'; ++size)
        ;
    return size;
}