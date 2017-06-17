//
//  ViewController.m
//  Dayh3_mapLocations
//
//  Created by Student P_08 on 20/05/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)startUpdateLocations
{
    self.locationManager=[[CLLocationManager alloc]init];
    self.locationManager.desiredAccuracy=kCLLocationAccuracyBest;
    [self.locationManager requestWhenInUseAuthorization];
    self.locationManager.delegate=self;
    [self.locationManager startUpdatingLocation];
}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    CLLocation *currentLocation=[locations lastObject];
    CLLocationCoordinate2D co_ordinate2d=CLLocationCoordinate2DMake(currentLocation.coordinate.latitude, currentLocation.coordinate.longitude);
    if (currentLocation!=nil)
    {
        NSLog(@"%f %f",currentLocation.coordinate.latitude,currentLocation.coordinate.longitude);
        [self.locationManager stopUpdatingLocation];
    }
    MKCoordinateSpan span=MKCoordinateSpanMake(1,1);
    MKCoordinateRegion region=MKCoordinateRegionMake(co_ordinate2d, span);
    [self.myMapView setRegion:region];
}

- (IBAction)detect_Button:(id)sender
{
    [self startUpdateLocations];
}

- (IBAction)selectMapType:(id)sender {
    switch (self.mySegment.selectedSegmentIndex)
    {
        case 0:self.myMapView.mapType=MKMapTypeStandard;
               break;
            
        case 1: self.myMapView.mapType=MKMapTypeSatellite;
            break;
            
        case 2: self.myMapView.mapType=MKMapTypeHybrid;
            break;
            
        default:
            break;
    }
}
@end
