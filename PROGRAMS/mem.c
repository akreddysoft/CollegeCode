#include <stdlib.h>
#include <stdio.h>
#include <errno.h>

#define C2P(c) ((char *)(c) + 4)
#define P2C(p) (struct cell *)((char *)(p) - 4)
#define ISADJ(c1,c2) ((struct cell *)(C2P(c1) + (c1)->size) == (struct cell *)(c2)) 

struct cell {
    size_t size;
    struct cell *next;
};
struct simple {
    struct cell *tail;
};

void
simple_init(struct simple *s, void *mem, size_t size)
{
    s->tail = mem;
    s->tail->size = size - 4;
    s->tail->next = s->tail;
}
void *
simple_alloc(struct simple *s, size_t size, int zero)
{
    struct cell *c1, *c2, *c3;
    zero = 0;

    if (size < 4) {
        size = 4;     /* must accomodate next pointer */
    }

    c1 = s->tail;
    while (c1->next->size < size) { 
        if (c1->next == s->tail) {
            errno = ENOMEM; 
            return NULL;
        }
        c1 = c1->next;
    }
    c2 = c1->next;
    if (c2->size > (4 + size)) {    /* split new cell */ 
        c3 = (struct cell *)(C2P(c2) + size);
        c3->size = c2->size - (size + 4);
        c3->next = c2->next;
        c2->size = size; 
        c1->next = c3;
    } else {                   /* use the entire cell */ 
        c1->next = c2->next;
        if (c2 == s->tail) {
            s->tail = c1;
        }
    }

    return C2P(c2);
}
int
simple_free(struct simple *s, void *ptr)
{
    struct cell *c1, *c2, *c3;
    int j1, j2; 

                /* splice the cell back into the list */ 
    c1 = s->tail;
    c2 = P2C(ptr);

    if (c2 > c1) {           /* append to end of list */ 
        if (ISADJ(c1,c2)) {    /* join with last cell */ 
            c1->size += 4 + c2->size;
            return 0;
        }
        c2->next = c1->next;
        c1->next = c2;
        s->tail = c2;
        return 0;
    }

    while (c1->next < c2) {   /* find insertion point */
        c1 = c1->next;
    }
    c3 = c1->next;

    j1 = ISADJ(c1,c2); /* c1 and c2 need to be joined */
    j2 = ISADJ(c2,c3); /* c2 and c3 need to be joined */

    if (j1) {
        if (j2) {  /* splice all three cells together */
            c1->next = c3->next;
            c1->size += 4 + c3->size;
        }
        c1->size += 4 + c2->size;
    } else {
        c1->next = c2;
        if (j2) {
            c2->next = c3->next;
            c2->size += 4 + c3->size;
        } else {
            c2->next = c3;
        }
    }

    return 0;
}

int
main(void)
{
    char mem[0xFFFFF];
    struct simple s;
    void *ptr;
    int i;
    size_t size;

    errno = 0;

    simple_init(&s, mem, 0xFFFFF);

    for (i = 0; i < 10000; i++) {
        if (i % 2) {
            simple_free(&s, ptr);
        }
        size = (3 << (i & 3)) + (i & 0xA8); /* generate quantized sizes */
printf("size=%d\n", size);
        if ((ptr = simple_alloc(&s, size, 0)) == NULL) {
            perror("simple_alloc");
            break;
        }
    }

    return EXIT_SUCCESS;
}