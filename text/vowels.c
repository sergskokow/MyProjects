#include <stdio.h>
#include <stdlib.h>
#define MAX_SIZE 1000
#define VOWELS   6
const char vowel[] = "AaEeIiOoUuy";

int* count_vowel(char*);

int main(void) {
    char str[MAX_SIZE];
    for (int i = 0; (str[i]=getchar())!=EOF && i < MAX_SIZE-1; i++)
        if(str[i]=='\n') {
            str[i]='\0';
            int *count = count_vowel(str);
            int sum = 0;
            printf("\n");
            for(int i = 0; i < VOWELS; i++) {
                printf("%c: %d\n", vowel[i*2], count[i]);
                sum += count[i];
            }
            printf("Total: %d\n\n", sum);
            free(count);

            i = -1;
        }

    return 0;
}

/* Returns an array of vowels count. */
int* count_vowel(char* str) {
    int* count = calloc(VOWELS, sizeof(int));
    for(int i = 0; i < VOWELS; i++)
        count[i] = 0;

    for (char* c = str; *c != '\0'; c++)
        for (char *v = vowel; *v != '\0'; v++)
            if(*c == *v)
                if(!(*v=='y' && c==str)) { // TODO y is a consonant, other variants e.g. "beyond"
                    count[(v-vowel)/2]++;
                }

    return count;
}