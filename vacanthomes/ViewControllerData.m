//
//  ViewControllerData.m
//  vacanthomes
//
//  Created by Jennifer on 01/11/2017.
//  Copyright © 2017 codeforireland. All rights reserved.
//

#import "ViewControllerData.h"
#import "ViewController.h"


@interface ViewControllerData () {
    NSArray *_pickerDataPropertyType;
    NSArray *_pickerDataCounty;
    NSArray *_pickerDataHowLongVacant;
    NSArray *_pickerDataAboutYou;
    
}

@end

@implementation ViewControllerData

@synthesize scrollview, contentview, propertyType, county, howLongVacant, aboutYou, houseno, streetname, townname, eircode, saleRentSign, grassOvergrown, roofDamaged, windowsBoarded, paintPeeling, propertyActivity, wasteBins, accessToProperty, canContact, name, email, phone, tandc, message, locationManager, lon, lat, geoLocationLbl, imageView, base64image;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _pickerDataPropertyType = @[@"-- Select Property Type --", @"Detached", @"Semi Detached", @"Terraced", @"Flat / Apartment", @"Other"];
    
    self.propertyType.dataSource = self;
    self.propertyType.delegate = self;
    
    _pickerDataCounty = @[@"-- Select County --", @"Carlow", @"Cavan", @"Clare", @"Cork City", @"Cork County", @"Donegal", @"Dublin City", @"South Dublin", @"Dún Laoghaire-Rathdown", @"Fingal", @"Galway City", @"Galway County", @"Kerry", @"Kildare", @"Kilkenny", @"Laois", @"Leitrim", @"Limerick City and County", @"Longford", @"Louth", @"Mayo", @"Meath", @"Monaghan", @"Offaly", @"Roscommon", @"Sligo", @"Tipperary", @"South Tipperary", @"Waterford City", @"Waterford County", @"Westmeath", @"Wexford", @"Wicklow"];
    
    self.county.dataSource = self;
    self.county.delegate = self;
    
    _pickerDataHowLongVacant = @[@"Vacant for how long?", @"Unknown", @"0 to 6 months", @"7 to 12 months", @"13 to 24 months", @"Greater than 24 months"];
    
    self.howLongVacant.dataSource = self;
    self.howLongVacant.delegate = self;
    
    _pickerDataAboutYou = @[@"I Represent a ...", @"Local Authority ", @"Individual / Private Citizen ", @"Tidy Towns Group ", @"Community Volunteer Group ", @"Business Group ", @"Residents Association", @"I am the Property Owner", @"Other"];
    
    self.aboutYou.dataSource = self;
    self.aboutYou.delegate = self;
    
    lat = @"";
    lon = @"";
    
    //Chekcs if Location Services are Enabled
    if ([CLLocationManager locationServicesEnabled]) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        // Check for iOS 8. Without this guard the code will crash with "unknown selector" on iOS 7.
        if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
            [self.locationManager requestWhenInUseAuthorization];
        }
        [self.locationManager startUpdatingLocation];
        NSLog(@"Location Services enabled");
        
    } else{
        //Location Services are available we will need software to ask to turn this On
        NSLog(@"Location Services not enabled");
        
        
    }
    geoLocationLbl.text = @"Geolocation";
    
}
- (IBAction)Back
{
    [self dismissViewControllerAnimated:YES completion:nil]; // ios 6
}
- (void)viewDidAppear:(BOOL)animated {
    scrollview.delegate = self;
    scrollview.contentSize = contentview.frame.size;
    scrollview.scrollEnabled = YES;
    [geoLocationLbl layoutIfNeeded];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

// pickerViews
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if ([pickerView isEqual: propertyType]) {
        return _pickerDataPropertyType.count;
    }
    if ([pickerView isEqual: county]) {
        return _pickerDataCounty.count;
    }
    if ([pickerView isEqual: howLongVacant]) {
        return _pickerDataHowLongVacant.count;
    }
    if ([pickerView isEqual: aboutYou]) {
        return _pickerDataAboutYou.count;
    }
    return 0;
}
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if ([pickerView isEqual: propertyType]) {
        return _pickerDataPropertyType[row];
    }
    if ([pickerView isEqual: county]) {
        return _pickerDataCounty[row];
    }
    if ([pickerView isEqual: howLongVacant]) {
        return _pickerDataHowLongVacant[row];
    }
    if ([pickerView isEqual: aboutYou]) {
        return _pickerDataAboutYou[row];
    }
    return 0;
}

// Location Manager Delegate Methods
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    NSLog(@"%@", [locations lastObject]);
    
    lat  = [[NSNumber numberWithDouble:locationManager.location.coordinate.latitude] stringValue];
    
    lon = [[NSNumber numberWithDouble:locationManager.location.coordinate.longitude] stringValue];
    
    //geoLocationLbl.text = [[lat stringByAppendingString:@", "] stringByAppendingString:lon];
}

- (IBAction) getLocation:(id)sender {
    NSLog(@"pressed");
    //[locationManager requestLocation];
    
    geoLocationLbl.text = [[[@"Geolocation: " stringByAppendingString:lat] stringByAppendingString:@", "] stringByAppendingString:lon];
    
}

- (IBAction)takePhoto:(id)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}

- (IBAction)selectPhoto:(id)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    
    self.imageView.image = chosenImage;
    
    base64image = [UIImagePNGRepresentation(chosenImage) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];

    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (IBAction)postData:(id)sender {
    NSInteger row = [propertyType selectedRowInComponent:0];
    NSString *_propertyType = [_pickerDataPropertyType objectAtIndex:row];
    row = [county selectedRowInComponent:0];
    NSString *_county = [_pickerDataCounty objectAtIndex:row];
    row = [howLongVacant selectedRowInComponent:0];
    NSString *_howLongVacant = [_pickerDataHowLongVacant objectAtIndex:row];
    row = [aboutYou selectedRowInComponent:0];
    NSString *_aboutYou = [_pickerDataAboutYou objectAtIndex:row];
    
    
    NSDictionary *json = [NSDictionary dictionaryWithObjectsAndKeys:
                          _propertyType, @"propertyType",
                          houseno.text , @"houseNo",
                          streetname.text, @"streetName",
                          townname.text, @"townName",
                          _county, @"county",
                          eircode.text, @"eircode",
                          geoLocationLbl.text, @"geoLocateText",
                          _howLongVacant, @"vacantTime",
                          (saleRentSign.isOn ? @"1" : @"0"), @"saleRentSign",
                          (grassOvergrown.isOn ? @"1" : @"0"), @"grassOvergrown",
                          (roofDamaged.isOn ? @"1" : @"0"), @"roofDamaged",
                          (windowsBoarded.isOn ? @"1" : @"0"), @"windowsBoarded",
                          (paintPeeling.isOn ? @"1" : @"0"), @"paintPeeling",
                          (propertyActivity.isOn ? @"1" : @"0"), @"propertyActivity",
                          (wasteBins.isOn ? @"1" : @"0"), @"wasteBins",
                          (accessToProperty.isOn ? @"1" : @"0"), @"accessToProperty",
                          _aboutYou, @"aboutYou",
                          message.text, @"message",
                          (canContact.isOn ? @"1" : @"0"), @"canContact",
                          name.text, @"editName",
                          email.text, @"editEmail",
                          phone.text, @"editPhone",
                          (tandc.isOn ? @"1" : @"0"), @"tandc",
                          base64image, @"image",
                          nil];
    
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:json
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    //NSLog (jsonString);
    
    NSMutableURLRequest *request =
    [[NSMutableURLRequest alloc] initWithURL: [NSURL URLWithString:@"http://ceall.com/vacanthomes/api/postdata.php"]];
    [request setHTTPMethod:@"POST"];
    [request setValue:[NSString stringWithFormat:@"%d", (int)[jsonString length]] forHTTPHeaderField:@"Content-length"];
    [request setHTTPBody:[jsonString dataUsingEncoding:NSUTF8StringEncoding]];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                      {
                                          [self dismissViewControllerAnimated:NO completion:nil];
                                          if (self.didDismiss)
                                              self.didDismiss(@"some extra data");
                                      }];
    [dataTask resume];
    
    
    
}


@end
