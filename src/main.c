#include <stdio.h>
#include "String/my_string.h"

void append_auto() {
    struct String* hello = string_new_auto("Hello");
    struct String* space = string_new_auto(" ");
    struct String* world = string_new_auto("World!");

    struct String* all = string_new_auto("");

    string_append(all, hello);
    string_append(all, space);
    string_append(all, world);

    printf("%s\n", string_read(all));

    string_reverse(all);

    printf("%s\n", string_read(all));

    string_free_multi(4, all, hello, world, space);
}

int main() {
    append_auto();

    return 0;
}