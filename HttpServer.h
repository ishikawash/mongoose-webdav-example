#ifndef HttpServer_H
#define HttpServer_H

#ifdef __cplusplus
extern "C" {
#endif

int HttpServerStart(const char* documentRoot);
void HttpServerStop(void);

#ifdef __cplusplus
}
#endif

#endif
