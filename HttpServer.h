#ifndef HttpServer_H
#define HttpServer_H

#ifdef __cplusplus
extern "C" {
#endif

int HttpServerStart(int port, const char* documentRootPath);
void HttpServerStop(void);
int HttpServerIsRunning(void);

#ifdef __cplusplus
}
#endif

#endif
