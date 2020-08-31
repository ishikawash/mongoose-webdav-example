//
//  ViewController.m
//  mongoose-webdav-example
//
//  Created by ishikawa shinya on 2020/08/31.
//

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
    sender.selected = ! sender.selected;
    if (sender.selected) {
        const char* path = (documentRoot_ != nil) ? [documentRoot_ UTF8String] : NULL;
        HttpServerStart(path);
        NSLog(@"Start...");
    } else {
        HttpServerStop();
        NSLog(@"Stop...");
    }
}


@end
