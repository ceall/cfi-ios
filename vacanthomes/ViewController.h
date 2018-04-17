//
//  ViewController.h
//  vacanthomes
//
//  Created by Jennifer on 01/11/2017.
//  Copyright © 2017 codeforireland. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewControllerData.h"

@interface ViewController : UIViewController {
    ViewControllerData *viewControllerData;
    IBOutlet UILabel *thanks;
}
- (IBAction)launchPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *launch;
@property (nonatomic, retain) IBOutlet UILabel *thanks;


@end

