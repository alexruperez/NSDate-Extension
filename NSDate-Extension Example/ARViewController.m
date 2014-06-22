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
@property (weak, nonatomic) IBOutlet UILabel *lapseLabel;

@end

@implementation ARViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self refresh];
}

- (IBAction)refresh
{
    self.numberLabel.text = [NSString stringWithFormat:@"%.0f", self.stepper.value];
    
    NSNumber *stepperValue = @(self.stepper.value);
    NSDateComponents *components = nil;
    NSCalendarUnit calendarUnit = 0;
    
    switch (self.unitControl.selectedSegmentIndex)
    {
        case 0:
            components = stepperValue.years;
            calendarUnit = NSCalendarUnitYear;
            break;
        case 1:
            components = stepperValue.months;
            calendarUnit = NSCalendarUnitMonth;
            break;
        case 2:
            components = stepperValue.days;
            calendarUnit = NSCalendarUnitDay;
            break;
        case 3:
            components = stepperValue.hours;
            calendarUnit = NSCalendarUnitHour;
            break;
        case 4:
            components = stepperValue.minutes;
            calendarUnit = NSCalendarUnitMinute;
            break;
        case 5:
            components = stepperValue.seconds;
            calendarUnit = NSCalendarUnitSecond;
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
    
    NSDate *date = [self.datePicker.date get:components];
    
    self.resultLabel.text = [NSString stringWithFormat:@"%@", date];
    self.lapseLabel.text = [NSString stringWithFormat:@"Lapse:\n%@", [self.datePicker.date lapse:calendarUnit fromDate:date]];
}

@end
