//
//  ViewController.m
//  mongoose-webdav-example
//
//  Created by ishikawa shinya on 2020/08/31.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)buttonDidPressed:(UIButton *)sender {
    sender.selected = ! sender.selected;
    if (sender.selected) {
        NSLog(@"Selected");
    } else {
        NSLog(@"Not Selected");
    }
}

@end
