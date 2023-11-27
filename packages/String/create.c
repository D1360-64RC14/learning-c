#include <stdlib.h>
#include "my_string.h"

// Create an empty String struct.
// It doesn't allocate the 'data' field!
inline
String* string_empty() {
    String* string = malloc(sizeof(String));
    string->data = NULL;
    string->length = 0;

    return string;
}

inline
String* string_new_auto(const char* text) {
    size_t size = 0;

    while (text[size] != '\0') {
        size++;
    }

    return string_new(text, size);
}

String* string_new(const char* text, const size_t size) {
    String* string = string_empty();
    string->data = malloc(sizeof(char) * (size + 1));
    string->length = size;

    for (size_t i = 0; i < size; i++) {
        string->data[i] = text[i];
    }
    string->data[size] = '\0';

    return string;
}

String* string_slice(const String* string, size_t start, size_t end) {
    if (start > end) {
        exit(1);
    }

    size_t slice_length = end - start;

    String* slice = string_empty();
    string_resize(slice, slice_length);

    for (size_t i = 0; i < slice_length; i++) {
        slice->data[i] = string->data[i + start];
    }

    return slice;
}
