#include <stdlib.h>
#include "my_string.h"

void string_resize(String* string, size_t new_size) {
    size_t last_size = string->length;
    char* last_data = string->data;

    string->length = new_size;
    string->data = malloc(sizeof(char) * (new_size + 1));

    for (size_t i = 0; i < new_size; i++) {
        if (last_size >= i + 1) {
            string->data[i] = last_data[i];
        } else {
            string->data[i] = ' ';
        }
    }
    string->data[new_size] = '\0';

    free(last_data);
}

void string_append(String* string, const String* string_to_append) {
    size_t old_length = string->length;
    string_resize(string, old_length + string_to_append->length);

    for (size_t i = 0; i < string_to_append->length; i++) {
        string->data[old_length + i] = string_to_append->data[i];
    }
}

void string_reverse(String* string) {
    char* data = string->data;

    size_t start = 0;
    size_t end = string->length - 1;

    while (start < string->length / 2) {
        char lastStart = data[start];

        data[start] = data[end];
        data[end] = lastStart;

        start++;
        end--;
    }
}