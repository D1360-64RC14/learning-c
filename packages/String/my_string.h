#ifndef STRING_LIB
#define STRING_LIB

#include <stddef.h>

struct String {
    size_t length;
    char* data;
};

typedef struct String String;

String* string_empty();
String* string_new(const char* text, const size_t size);
String* string_new_auto(const char* text);
String* string_slice(const String* string, size_t start, size_t end);

void string_resize(String* string, size_t new_size);
void string_append(String* string, const String* stringToAppend);
void string_reverse(String* string);

void string_free_multi(size_t quantity, const String* string, ...);
void string_free(const String* string);
char* string_read(const String* string);

#endif