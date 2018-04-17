//
//  ViewControllerData.h
//  vacanthomes
//
//  Created by Jennifer on 01/11/2017.
//  Copyright © 2017 codeforireland. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewControllerData : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, UIScrollViewDelegate, CLLocationManagerDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate> {
    IBOutlet UIScrollView *scrollview;
    IBOutlet UIView *contentview;
    IBOutlet UIPickerView *propertyType;
    IBOutlet UIPickerView *county;
    IBOutlet UIPickerView *howLongVacant;
    IBOutlet UIPickerView *aboutYou;
    IBOutlet UITextField *houseno;
    IBOutlet UITextField *streetname;
    IBOutlet UITextField *townname;
    IBOutlet UITextField *eircode;
    IBOutlet UITextField *name;
    IBOutlet UITextField *email;
    IBOutlet UITextField *phone;
    IBOutlet UISwitch *saleRentSign;
    IBOutlet UISwitch *grassOvergrown;
    IBOutlet UISwitch *roofDamaged;
    IBOutlet UISwitch *windowsBoarded;
    IBOutlet UISwitch *paintPeeling;
    IBOutlet UISwitch *propertyActivity;
    IBOutlet UISwitch *wasteBins;
    IBOutlet UISwitch *accessToProperty;
    IBOutlet UISwitch *canContact;
    IBOutlet UISwitch *tandc;
    IBOutlet UITextView *message;
    IBOutlet UILabel *geoLocationLbl;
    IBOutlet UIImageView *imageView;
    NSString *lat;
    NSString *lon;
    NSString *base64image;
    CLLocationManager *locationManager;
}

@property (nonatomic, retain) IBOutlet UIScrollView *scrollview;
@property (nonatomic, retain) IBOutlet UIView *contentview;
@property (nonatomic, retain) IBOutlet UIPickerView *propertyType;
@property (nonatomic, retain) IBOutlet UIPickerView *county;
@property (nonatomic, retain) IBOutlet UIPickerView *howLongVacant;
@property (nonatomic, retain) IBOutlet UIPickerView *aboutYou;
@property (nonatomic, retain) IBOutlet UITextField *houseno;
@property (nonatomic, retain) IBOutlet UITextField *streetname;
@property (nonatomic, retain) IBOutlet UITextField *townname;
@property (nonatomic, retain) IBOutlet UITextField *eircode;
@property (nonatomic, retain) IBOutlet UITextField *name;
@property (nonatomic, retain) IBOutlet UITextField *email;
@property (nonatomic, retain) IBOutlet UITextField *phone;
@property (nonatomic, retain) IBOutlet UISwitch *saleRentSign;
@property (nonatomic, retain) IBOutlet UISwitch *grassOvergrown;
@property (nonatomic, retain) IBOutlet UISwitch *roofDamaged;
@property (nonatomic, retain) IBOutlet UISwitch *windowsBoarded;
@property (nonatomic, retain) IBOutlet UISwitch *paintPeeling;
@property (nonatomic, retain) IBOutlet UISwitch *propertyActivity;
@property (nonatomic, retain) IBOutlet UISwitch *wasteBins;
@property (nonatomic, retain) IBOutlet UISwitch *accessToProperty;
@property (nonatomic, retain) IBOutlet UISwitch *canContact;
@property (nonatomic, retain) IBOutlet UISwitch *tandc;
@property (nonatomic, retain) IBOutlet UITextView *message;
@property (nonatomic, retain) NSString *lat;
@property (nonatomic, retain) NSString *lon;
@property (nonatomic, retain) IBOutlet UILabel *geoLocationLbl;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) NSString *base64image;
@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic, copy) void (^didDismiss)(NSString *data);
@end
