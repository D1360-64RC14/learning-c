#include <stdlib.h>
#include <stdarg.h>
#include "my_string.h"

char* string_read(const String* string) {
    string->data[string->length] = '\0';
    return string->data;
}

void string_free_multi(size_t quantity, const String* string, ...) {
    va_list args;
    va_start(args, string);

    for (size_t i = 0; i < quantity - 1; i++) {
        const String* s = va_arg(args, const String*);

        string_free(s);
    }

    va_end(args);
}

inline
void string_free(const String* string) {
    free(string->data);
    free((String*) string);
}