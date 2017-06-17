//
//  ViewController.h
//  Dayh3_mapLocations
//
//  Created by Student P_08 on 20/05/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>


@interface ViewController : UIViewController<MKMapViewDelegate,CLLocationManagerDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *myMapView;
- (IBAction)detect_Button:(id)sender;
- (IBAction)selectMapType:(id)sender;
@property (strong, nonatomic) IBOutlet UISegmentedControl *mySegment;

@property CLLocationManager *locationManager;

@end

