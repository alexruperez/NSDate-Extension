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
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UISegmentedControl *unitControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *timeControl;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation ARViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    [self refresh];
    
    NSLog(@"%@", [[[NSDate date] get:[@(11).days and:@(2).months].ago] lapse:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSCalendarUnitHour fromDate:[NSDate date]]);
    NSLog(@"%@", [[NSDate date] lapse:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSCalendarUnitHour toDate:[[NSDate date] get:[@(11).days and:@(2).months].ago]]);
}

- (IBAction)refresh
{
    self.numberLabel.text = [NSString stringWithFormat:@"%.0f", self.stepper.value];
    
    NSNumber *stepperValue = @(self.stepper.value);
    NSDateComponents *components;
    
    switch (self.unitControl.selectedSegmentIndex)
    {
        case 0:
            components = stepperValue.years;
            break;
        case 1:
            components = stepperValue.months;
            break;
        case 2:
            components = stepperValue.days;
            break;
        case 3:
            components = stepperValue.hours;
            break;
        case 4:
            components = stepperValue.minutes;
            break;
        case 5:
            components = stepperValue.seconds;
            break;
        default:
            break;
    }
    
    if (self.timeControl.selectedSegmentIndex)
    {
        components = components.later;
    }
    else
    {
        components = components.ago;
    }
    
    self.resultLabel.text = [NSString stringWithFormat:@"%@", [self.datePicker.date get:components]];
}

@end
