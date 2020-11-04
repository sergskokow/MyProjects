#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

#define SOURCE_SIZE 10000
#define ALGORITHMS  4
#define SEPARATOR "=========================\n"

void fill_random(int*, int size);
void copy(int *from, int *to, int size);
void swap(int *a, int *b);
double get_time();
void print_array(int*, int size);

void bubble_sort(int*, int size);
void merge_sort(int*, int size);
void shaker_sort(int*, int size);
void odd_even_sort(int*, int size);

int main(int argc, char const *argv[]) {
    int extended_output = argc == 2 && !strcmp(argv[1], "-V");

    void (*sorting_function[ALGORITHMS])(int*, int size) = {
        bubble_sort,
        merge_sort,
        shaker_sort,
        odd_even_sort
    };
    char *function_name[ALGORITHMS] = {
        "Bubble sort",
        "Merge sort",
        "Shaker sort",
        "Odd-even sort"
    };

    int source[SOURCE_SIZE], current[SOURCE_SIZE];
    fill_random(source, SOURCE_SIZE);
    if(extended_output)
        print_array(source, SOURCE_SIZE);

    printf("Source array size: %d\n", SOURCE_SIZE);
    printf(SEPARATOR);

    for(int i = 0; i < ALGORITHMS; i++) {
        copy(source, current, SOURCE_SIZE);

        get_time();
        sorting_function[i](current, SOURCE_SIZE);
        double estimate = get_time();

        printf("%s: %g sec.\n", function_name[i], estimate);
        if(extended_output)
            print_array(current, SOURCE_SIZE);

        printf("Checking...");
        int check_result = check(current, SOURCE_SIZE);
        if(check_result == -1)
            printf(" OK.\n");
        else
            printf(" Error at %d\n", check_result);
        printf(SEPARATOR);
    }

    return 0;
}

/* sorting algorithms */

void bubble_sort(int* source, int size) {
    for(int i = size-1; i > 0; i--)
        for(int j = 0; j < i; j++)
            if(source[j+1] < source[j])
                swap(&source[j+1], &source[j]);
}

/*
recursive calls
@
requires buffer arrays
@
fast af
*/
void merge_sort(int* source, int size) {
    /* division */
    int first_part = size / 2,
        second_part = size - first_part;
    if(first_part > 1)
        merge_sort(source, first_part);
    if(second_part > 1)
        merge_sort(source + first_part, second_part);

    /* merging */
    int *buffer = (int*) calloc(size, sizeof(int));
    int *buf = buffer;
    int *first_min = source,
        *first_end = source + first_part - 1;
    int *second_min = first_end + 1,
        *second_end = second_min + second_part - 1;
    /* comparing values of the second part with values of the first part */
    for(; first_min <= first_end; first_min++) {
        for(; *first_min > *second_min && second_min <= second_end; second_min++)
            *(buf++) = *second_min;
        *(buf++) = *first_min;
    }
    /* adding values of the second part if the end of the first part is reached */
    for(; second_min <= second_end; second_min++)
        *(buf++) = *second_min;

    /* applying changes to the main array */
    copy(buffer, source, size);
    free(buffer);
}

void shaker_sort(int* source, int size) {
    for(int *begin = source, *end = source+size-1; begin < end; begin++, end--) {
        int *cur = begin;
        for(; cur < end; cur++)     /* left to right */
            if(*cur > *(cur+1))
                swap(cur+1, cur);
        cur--; // last pair already sorted
        for(; cur > begin; cur--)   /* right to left */
            if(*(cur-1) > *cur)
                swap(cur, cur-1);
    }
}

void odd_even_sort(int* source, int size) {
    for(int start = 0, without_swaps = 0; without_swaps < 2; start = start?0:1) {
        int swapped = 0;
        for(int i = start; i < size-1; i += 2)
            if(source[i] > source[i+1]) {
                swap(&source[i+1], &source[i]);
                swapped = 1;
            }
        if(!swapped)
            without_swaps++;
        else
            without_swaps = 0;
    }
}

/* other */

void fill_random(int* empty, int size) {
    for(int i = 0; i < size; i++)
        empty[i] = rand();
}

void copy(int *from, int *to, int size) {
    for(int i = 0; i < size; i++)
        to[i] = from[i];
}

void swap(int *a, int *b) {
    int buf = *a;
    *a = *b;
    *b = buf;
}

clock_t old = 0;
double get_time() {
    clock_t new = clock();
    double result = ((double)(new-old))/CLOCKS_PER_SEC;
    old = new;
    return result;
}

void print_array(int* source, int size) {
    for(int i = 0; i < size; i++)
        printf("%d ", source[i]);
    printf("\n");
}

int check(int* source, int size) {
    for(int i = 1; i < size; i++)
        if(source[i-1] > source[i])
            return i;
    return -1;
}