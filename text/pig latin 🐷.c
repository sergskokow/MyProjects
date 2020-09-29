#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MAX_SIZE    1000

void 🐷(char str[]);
void find_word(char* pos, char** start, char** end);
int is_separator(char);
char* 🐽(char* start, char* end);
char* find_vowel(char* start, char* end);

int main(void)
{
    char str[MAX_SIZE];
    for (int i = 0; (str[i]=getchar())!=EOF && i < MAX_SIZE-1; i++)
        if(str[i]=='\n') {
            str[i]='\0';
            🐷(str);
            printf("%s\n", str);
            i = -1;
        }

    return 0;
}

/* Translate a string into pig latin. Oink-oink! 🐷 */
void 🐷(char str[]) {
    if(str[0]=='\0')
        return;
    char buf[MAX_SIZE];

    // transform each word separately
    char *cur = str, *cur_buf = buf, *first = NULL, *last = NULL, *🐽word;
    find_word(str, &first, &last);
    while (first != NULL) {
        if(first > cur) // separators before word
            for(; cur!=first; cur++, cur_buf++)
                *cur_buf = *cur;
        cur += last - first + 1; // skip the old word in the source array
        🐽word = 🐽(first, last); // transform
        for(char *w = 🐽word; *w != '\0'; w++, cur_buf++)
            *cur_buf = *w;
        free(🐽word);
        find_word(last+1, &first, &last);
    }
    if(*cur != '\0') // separators after last word
        for(; *cur != '\0'; cur++, cur_buf++)
            *cur_buf = *cur;
    *cur_buf = '\0';

    // copying result to source array
    for (cur = str, cur_buf = buf; (*cur = *cur_buf) != '\0'; cur++, cur_buf++)
        ;
}

/*
Sets the start and end of a word. If no words are found, start is NULL.
pos: position in array where it needs to find word
*/
void find_word(char* pos, char** start, char** end) {
    *start = *end = NULL;
    for(char *s = pos; *s != '\0'; s++)
        if(!is_separator(*s)) {
            *start = s;
            break;
        }
    if(*start == NULL)
        return;
    char *e = *start;
    for(; *e != '\0'; e++)
        if(is_separator(*e)) {
            *end = e - 1;
            return;
        }
    *end = e - 1;
}

char separators[] = " ,.;\"\t";
int is_separator(char c) {
    for(char *sep=separators; *sep != '\0'; sep++)
        if(c==*sep)
            return 1;
    return 0;
}

/* Translate current word into pig latin.
Returns a pointer to an array with the translated word. */
char* 🐽(char* start, char* end) {
    int size = end - start + 1 + 2; // -ay
    char *res = calloc(size + 1, sizeof(char));
    char *current = res;
    char *first_vowel = find_vowel(start, end);
    if(first_vowel != NULL && first_vowel-start > 0) { // first letter is a consonant
        for(char *c = first_vowel; c <= end; c++, current++)
            *current = *c;
        for(char *c = start; c < first_vowel; c++, current++)
            *current = *c;
    } else // first letter is a vowel; empty line or end of line
        for(char *c = start; c <= end; c++, current++)
            *current = *c;
    *(current++) = 'a';
    *(current++) = 'y';
    *current =     '\0';
    return res;
}

const char vowel[] = "AaEeIiOoUuy";
/* Returns a pointer to a vowel, NULL if vowel not found. */
char* find_vowel(char* start, char* end) {
    for (char *c = start; c <= end; c++)
        for (char *v = vowel; *v != '\0'; v++)
            if(*c == *v)
                if(!(*v=='y' && c==start)) // TODO y is a consonant, other variants e.g. "beyond"
                    return c;
    return NULL;
}