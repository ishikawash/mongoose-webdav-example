#import "ViewController.h"
#import "HttpServer.h"

@interface ViewController ()

@end

@implementation ViewController

NSString* documentRoot_ = nil;

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray<NSURL*>* urls = [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    if (urls.count > 0) {
        NSURL* url = urls.firstObject;
        documentRoot_ = url.path;
    }
}

- (IBAction)buttonDidPressed:(UIButton *)sender {
    if (HttpServerIsRunning()) {
        HttpServerStop();
        [self changeButtonState:sender by:NO];
    } else {
        const char* path = (documentRoot_ != nil) ? [documentRoot_ UTF8String] : NULL;
        if (HttpServerStart(10080, path)) {
            [self changeButtonState:sender by:YES];
        }
    }
}

- (void)changeButtonState:(UIButton*)button by:(BOOL)enabled {
    NSString* title = enabled ? @"Stop" : @"Start";
    [button setTitle:title forState:UIControlStateNormal];
}

@end
