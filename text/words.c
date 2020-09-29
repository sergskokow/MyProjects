#include <stdio.h>
#define MAX_SIZE 1000

int get_char(FILE*);
int word_count(char[]);
int is_separator(char);

int main(int argc, char const *argv[]) {
    char str[MAX_SIZE];
    FILE *f = NULL;
    if(argc == 2)
        if((f = fopen(argv[1], "r")) == NULL)
            return -1;

    for(int i = 0, c; ; i = 0) {
        for(; i < MAX_SIZE-1 && (c=get_char(f))!='\n' && c!=EOF; i++)
            str[i] = c;
        str[i] = '\0';
        printf("%d\n", word_count(str));
        if(c == EOF || i >= MAX_SIZE-1)
            break;
    }

    if(f != NULL)
        fclose(f);
    return 0;
}

int get_char(FILE *f) {
    if(f == NULL)
        return getchar();
    else
        return fgetc(f);
}

int word_count(char str[]) {
    int count = 0, in = 0;
    for(char *c = str; !(*c=='\0' || *c==EOF); c++) {
        if(is_separator(*c))
            in = 0;
        else if(!in) {
            in = 1;
            count++;
        }
    }
    return count;
}

char separators[] = " ,.;\"\t";
int is_separator(char c) {
    for(char *sep=separators; *sep != '\0'; sep++)
        if(c==*sep)
            return 1;
    return 0;
}