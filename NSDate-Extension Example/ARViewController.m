//
//  ARViewController.m
//  NSDate-Extension Example
//
//  Created by Alejandro Rupérez on 16/06/14.
//  Copyright (c) 2014 alexruperez. All rights reserved.
//

#import "NSDate+Extension.h"

#import "ARViewController.h"

@interface ARViewController ()

@end

@implementation ARViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    NSLog(@"%lu", [[NSDate date] get:[@(3).years and:@(2).months].later].year);
    NSLog(@"%@", [[NSDate date] get:[@(11).days and:@(2).months].ago]);
    NSLog(@"%@", [[[NSDate date] get:[@(11).days and:@(2).months].ago] lapse:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSCalendarUnitHour fromDate:[NSDate date]]);
    NSLog(@"%@", [[NSDate date] lapse:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSCalendarUnitHour toDate:[[NSDate date] get:[@(11).days and:@(2).months].ago]]);
}

@end
