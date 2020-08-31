#include "HttpServer.h"
#include "mongoose.h"

int HttpServerStart(const char* documentRoot)
{
    // TODO:
    if (documentRoot != NULL) {
        printf("DocmentRoot: %s\n", documentRoot);
    }
    return 0;
}

void HttpServerStop()
{
    // TODO:
}
