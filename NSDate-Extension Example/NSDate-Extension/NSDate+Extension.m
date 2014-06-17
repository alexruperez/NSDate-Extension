//
//  NSDate+Extension.m
//  NSDate-Extension Example
//
//  Created by Alejandro Rupérez on 16/06/14.
//  Copyright (c) 2014 alexruperez. All rights reserved.
//

#import "NSDate+Extension.h"

#define NSCalendarUnitsKeyPaths @{ @(NSCalendarUnitEra): @"era", @(NSCalendarUnitYear): @"year", @(NSCalendarUnitMonth): @"month", @(NSCalendarUnitDay): @"day", @(NSCalendarUnitHour): @"hour", @(NSCalendarUnitMinute): @"minute", @(NSCalendarUnitSecond): @"second", @(NSCalendarUnitWeekday): @"weekday", @(NSCalendarUnitWeekdayOrdinal): @"weekdayOrdinal", @(NSCalendarUnitQuarter): @"quarter", @(NSCalendarUnitWeekOfMonth): @"weekOfMonth", @(NSCalendarUnitWeekOfYear): @"weekOfYear", @(NSCalendarUnitYearForWeekOfYear): @"yearForWeekOfYear" }

@implementation NSNumber (Extension)

- (NSDateComponents *)dateComponentsForCalendarUnit:(NSCalendarUnit)calendarUnit
{
    NSDateComponents *components = NSDateComponents.new;
    [components setValue:self forKeyPath:NSCalendarUnitsKeyPaths[@(calendarUnit)]];
    return components;
}

- (NSDateComponents *)eras
{
    return [self dateComponentsForCalendarUnit:NSCalendarUnitEra];
}

- (NSDateComponents *)years
{
    return [self dateComponentsForCalendarUnit:NSCalendarUnitYear];
}

- (NSDateComponents *)months
{
    return [self dateComponentsForCalendarUnit:NSCalendarUnitMonth];
}

- (NSDateComponents *)days
{
    return [self dateComponentsForCalendarUnit:NSCalendarUnitDay];
}

- (NSDateComponents *)hours
{
    return [self dateComponentsForCalendarUnit:NSCalendarUnitHour];
}

- (NSDateComponents *)minutes
{
    return [self dateComponentsForCalendarUnit:NSCalendarUnitMinute];
}

- (NSDateComponents *)seconds
{
    return [self dateComponentsForCalendarUnit:NSCalendarUnitSecond];
}

- (NSDateComponents *)weekdays
{
    return [self dateComponentsForCalendarUnit:NSCalendarUnitWeekday];
}

- (NSDateComponents *)weekdaysOrdinal
{
    return [self dateComponentsForCalendarUnit:NSCalendarUnitWeekdayOrdinal];
}

- (NSDateComponents *)quarters
{
    return [self dateComponentsForCalendarUnit:NSCalendarUnitQuarter];
}

- (NSDateComponents *)weeksOfMonth
{
    return [self dateComponentsForCalendarUnit:NSCalendarUnitWeekOfMonth];
}

- (NSDateComponents *)weeksOfYear
{
    return [self dateComponentsForCalendarUnit:NSCalendarUnitWeekOfYear];
}

- (NSDateComponents *)yearsForWeekOfYear
{
    return [self dateComponentsForCalendarUnit:NSCalendarUnitYearForWeekOfYear];
}

@end

@implementation NSDateComponents (Extension)

- (void)invertValueForCalendarUnit:(NSCalendarUnit)calendarUnit
{
    NSString *keyPath = NSCalendarUnitsKeyPaths[@(calendarUnit)];
    NSInteger value = [[self valueForKeyPath:keyPath] integerValue];
    if (value != LONG_MAX)
    {
        [self setValue:@(-value) forKeyPath:keyPath];
    }
}

- (void)addComponents:(NSDateComponents *)components forCalendarUnit:(NSCalendarUnit)calendarUnit
{
    NSString *keyPath = NSCalendarUnitsKeyPaths[@(calendarUnit)];
    NSInteger currentValue = [[self valueForKeyPath:keyPath] integerValue];
    NSInteger componentsValue = [[components valueForKeyPath:keyPath] integerValue];
    NSInteger newValue = currentValue != LONG_MAX ? currentValue : LONG_MAX;
    if (componentsValue != LONG_MAX)
    {
        newValue = newValue != LONG_MAX ? newValue + componentsValue : componentsValue;
    }
    if (newValue != LONG_MAX)
    {
        [self setValue:@(newValue) forKeyPath:keyPath];
    }
}

- (NSDateComponents *)before
{
    for (NSNumber *calendarUnit in NSCalendarUnitsKeyPaths.allKeys)
    {
        [self invertValueForCalendarUnit:[calendarUnit integerValue]];
    }
    return self;
}

- (NSDateComponents *)and:(NSDateComponents *)components
{
    for (NSNumber *calendarUnit in NSCalendarUnitsKeyPaths.allKeys)
    {
        [self addComponents:components forCalendarUnit:[calendarUnit integerValue]];
    }
    return self;
}

@end

@implementation NSDate (Extension)

- (NSUInteger)calendarUnits
{
    NSUInteger calendarUnits;
    for (NSNumber *calendarUnit in NSCalendarUnitsKeyPaths.allKeys)
    {
        calendarUnits |= [calendarUnit integerValue];
    }
    return calendarUnits;
}

- (NSDateComponents *)dateComponents
{
    return [NSCalendar.autoupdatingCurrentCalendar components:self.calendarUnits fromDate:self];
}

- (NSInteger)dateComponentForCalendarUnit:(NSCalendarUnit)calendarUnit
{
    return [[self.dateComponents valueForKeyPath:NSCalendarUnitsKeyPaths[@(calendarUnit)]] integerValue];
}

- (NSInteger)era
{
    return [self dateComponentForCalendarUnit:NSCalendarUnitEra];
}

- (NSInteger)year
{
    return [self dateComponentForCalendarUnit:NSCalendarUnitYear];
}

- (NSInteger)month
{
    return [self dateComponentForCalendarUnit:NSCalendarUnitMonth];
}

- (NSInteger)day
{
    return [self dateComponentForCalendarUnit:NSCalendarUnitDay];
}

- (NSInteger)hour
{
    return [self dateComponentForCalendarUnit:NSCalendarUnitHour];
}

- (NSInteger)minute
{
    return [self dateComponentForCalendarUnit:NSCalendarUnitMinute];
}

- (NSInteger)second
{
    return [self dateComponentForCalendarUnit:NSCalendarUnitSecond];
}

- (NSInteger)weekday
{
    return [self dateComponentForCalendarUnit:NSCalendarUnitWeekday];
}

- (NSInteger)weekdayOrdinal
{
    return [self dateComponentForCalendarUnit:NSCalendarUnitWeekdayOrdinal];
}

- (NSInteger)quarter
{
    return [self dateComponentForCalendarUnit:NSCalendarUnitQuarter];
}

- (NSInteger)weekOfMonth
{
    return [self dateComponentForCalendarUnit:NSCalendarUnitWeekOfMonth];
}

- (NSInteger)weekOfYear
{
    return [self dateComponentForCalendarUnit:NSCalendarUnitWeekOfYear];
}

- (NSInteger)yearForWeekOfYear
{
    return [self dateComponentForCalendarUnit:NSCalendarUnitYearForWeekOfYear];
}

- (NSDate *)get:(NSDateComponents *)components
{
    return [NSCalendar.autoupdatingCurrentCalendar dateByAddingComponents:components toDate:self options:NSCalendarWrapComponents];
}

- (NSDateComponents *)lapse:(NSCalendarUnit)calendarUnit fromDate:(NSDate *)date
{
    return [NSCalendar.autoupdatingCurrentCalendar components:calendarUnit fromDate:date toDate:self options:NSCalendarWrapComponents];
}

- (NSDateComponents *)lapse:(NSCalendarUnit)calendarUnit toDate:(NSDate *)date
{
    return [NSCalendar.autoupdatingCurrentCalendar components:calendarUnit fromDate:self toDate:date options:NSCalendarWrapComponents];
}

@end
