#include <stdio.h>
#include <stdlib.h>
#include <math.h>

double* addc(double[2], double[2]);
double* mulc(double[2], double[2]);
double* subc(double[2], double[2]);
double* divc(double[2], double[2]);
double  modc(double[2]);

int main(void) {
    double a[] = {1, 2};
    double b[] = {3, 4};

    double* c = addc(a, b);
    printf("(%g + %gj) + (%g + %gj) = %g + %gj\n", a[0], a[1], b[0], b[1], *c, *(c+1));
    free(c);

    c = mulc(a, b);
    printf("(%g + %gj) * (%g + %gj) = %g + %gj\n", a[0], a[1], b[0], b[1], *c, *(c+1));
    free(c);

    c = subc(b, a);
    printf("(%g + %gj) - (%g + %gj) = %g + %gj\n", b[0], b[1], a[0], a[1], *c, *(c+1));
    free(c);

    c = divc(b, a);
    printf("(%g + %gj) / (%g + %gj) = %g + %gj\n", b[0], b[1], a[0], a[1], *c, *(c+1));
    free(c);

    printf("|%g + %gj| = %g\n", b[0], b[1], modc(b));

    return 0;
}

double* addc(double a[2], double b[2]) {
    double* c = (double*) calloc(2, sizeof(double));
    c[0] = a[0]+b[0];
    c[1] = a[1]+b[1];
    return c;
}

double* mulc(double a[2], double b[2]) {
    double* c = (double*) calloc(2, sizeof(double));
    c[0] = a[0]*b[0] - a[1]*b[1];
    c[1] = a[0]*b[1] + a[1]*b[0];
    return c;
}

double* subc(double a[2], double b[2]) {
    double* c = (double*) calloc(2, sizeof(double));
    c[0] = a[0]-b[0];
    c[1] = a[1]-b[1];
    return c;
}

double* divc(double a[2], double b[2]) {
    double* c = (double*) calloc(2, sizeof(double));
    c[0] = (a[0]*b[0] + a[1]*b[1]) / (b[0]*b[0] + b[1]*b[1]);
    c[1] = (b[0]*a[1] - a[0]*b[1]) / (b[0]*b[0] + b[1]*b[1]);
    return c;
}

double modc(double a[2]) {
    return sqrt(a[0]*a[0] + a[1]*a[1]);
}