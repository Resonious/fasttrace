#ifndef FASTTRACE_TRACE_H
#define FASTTRACE_TRACE_H 1

#include "fasttrace.h"
#include "measure.h"
#include <stdio.h>

typedef struct trace_t {
    VALUE tracepoint;

    FILE *trace_header_file;
    void *trace_header;
    size_t trace_header_i;
    size_t trace_header_len;

    FILE *trace_data_file;
    void *trace_data;
    size_t trace_data_i;
    size_t trace_data_len;

    int running;
} trace_t;

// Source relation bit offsets.
enum {
    kModuleIncludee = 0x1,  // Included in module
    kClassSingleton = 0x2,  // Singleton of a class
    kModuleSingleton = 0x4, // Singleton of a module
    kObjectSingleton = 0x8, // Singleton of an object
    kOtherSingleton = 0x10  // Singleton of unkown object
};
extern const unsigned int kSingleton;

void ft_init_trace(void);

#endif /* FASTTRACE_TRACE_H */
