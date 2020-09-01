#include "HttpServer.h"
#include <string>
#include <thread>
#include "mongoose.h"

namespace {

struct mg_serve_http_opts httpOptions_;
std::string address_;
std::string documentRoot_;
bool running_ = false;

void handleEvent(struct mg_connection *nc, int ev, void *p)
{
  if (ev == MG_EV_HTTP_REQUEST) {
    mg_serve_http(nc, (struct http_message *) p, httpOptions_);
  }
}

void mainLoop()
{
    struct mg_mgr mgr;
    mg_mgr_init(&mgr, NULL);

    struct mg_connection* nc = mg_bind(&mgr, address_.c_str(), handleEvent);
    if (nc == NULL) {
        mg_mgr_free(&mgr);
        printf("Failed to bind address '%s' to server.\n", address_.c_str());
        return;
    }
    printf("Starting web server on %s\n", address_.c_str());

    mg_set_protocol_http_websocket(nc);
    httpOptions_.document_root = documentRoot_.c_str();
    httpOptions_.enable_directory_listing = "yes";
    httpOptions_.dav_document_root = httpOptions_.document_root;
    httpOptions_.dav_auth_file = "-";

    running_ = true;
    while (running_) {
        mg_mgr_poll(&mgr, 1000);
    }
    mg_mgr_free(&mgr);
}

}

int HttpServerStart(int port, const char* documentRootPath)
{
    if (running_) {
        return 0;
    }
    if (documentRootPath == NULL) {
        return 0;
    }
    documentRoot_.assign(documentRootPath);

    address_.assign("0.0.0.0:");
    address_.append(std::to_string(port));

    std::thread th(mainLoop);
    th.detach();
    return 1;
}

void HttpServerStop()
{
    running_ = false;
}
