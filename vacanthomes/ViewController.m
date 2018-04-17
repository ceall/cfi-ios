//
//  ViewController.m
//  vacanthomes
//
//  Created by Jennifer on 01/11/2017.
//  Copyright © 2017 codeforireland. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController
@synthesize launch, thanks;

-(id)init {
    self = [super initWithNibName:@"home"  bundle:nil];
    if (self != nil) {
        // further initialization needed
    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    viewControllerData=[[ViewControllerData alloc] initWithNibName:@"ViewControllerData" bundle:nil];
    [thanks setHidden: YES];
    
}

- (void) viewDidAppear:(BOOL)animated {
     [self performSelector:@selector(hideLabel) withObject:nil afterDelay:15];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)launchPressed:(id)sender {
    ViewControllerData* viewControllerData = [[ViewControllerData alloc] init];
    viewControllerData.didDismiss = ^(NSString *data) {
        // this method gets called in MainVC when your SecondVC is dismissed
        NSLog(@"%@", data);
        [thanks setHidden: NO];
    };
    
    [self presentViewController:viewControllerData  animated:YES completion:nil];
}

-(void) hideLabel {
    thanks.hidden= YES;
}
@end
