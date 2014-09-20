//
//  NSDate+Extension.m
//  NSDate-Extension Example
//
//  Created by Alejandro Rupérez on 16/06/14.
//  Copyright (c) 2014 alexruperez. All rights reserved.
//

#import "NSDate+Extension.h"

#define NSCalendarUnitsKeys @{ @(NSCalendarUnitEra): @"era", @(NSCalendarUnitYear): @"year", @(NSCalendarUnitMonth): @"month", @(NSCalendarUnitDay): @"day", @(NSCalendarUnitHour): @"hour", @(NSCalendarUnitMinute): @"minute", @(NSCalendarUnitSecond): @"second", @(NSCalendarUnitWeekday): @"weekday", @(NSCalendarUnitWeekdayOrdinal): @"weekdayOrdinal", @(NSCalendarUnitQuarter): @"quarter", @(NSCalendarUnitWeekOfMonth): @"weekOfMonth", @(NSCalendarUnitWeekOfYear): @"weekOfYear", @(NSCalendarUnitYearForWeekOfYear): @"yearForWeekOfYear" }

@implementation NSNumber (Extension)

- (NSDateComponents *)dateComponentsForCalendarUnit:(NSCalendarUnit)calendarUnit
{
    NSDateComponents *components = NSDateComponents.new;
    [components setValue:self forKey:NSCalendarUnitsKeys[@(calendarUnit)]];
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
    NSString *key = NSCalendarUnitsKeys[@(calendarUnit)];
    NSInteger value = [[self valueForKey:key] integerValue];
    value = value != NSIntegerMax ? -value : NSIntegerMax;
    if (value != NSIntegerMax)
    {
        [self setValue:@(value) forKey:key];
    }
}

- (void)addComponents:(NSDateComponents *)components forCalendarUnit:(NSCalendarUnit)calendarUnit
{
    NSString *key = NSCalendarUnitsKeys[@(calendarUnit)];
    NSInteger value = [[self valueForKey:key] integerValue];
    NSInteger componentsValue = [[components valueForKey:key] integerValue];
    if (componentsValue != NSIntegerMax)
    {
        value = value != NSIntegerMax ? value + componentsValue : componentsValue;
    }
    if (value != NSIntegerMax)
    {
        [self setValue:@(value) forKey:key];
    }
}

- (NSDateComponents *)before
{
    for (NSNumber *calendarUnit in NSCalendarUnitsKeys.allKeys)
    {
        [self invertValueForCalendarUnit:[calendarUnit unsignedIntegerValue]];
    }
    return self;
}

- (NSDateComponents *)and:(NSDateComponents *)components
{
    for (NSNumber *calendarUnit in NSCalendarUnitsKeys.allKeys)
    {
        [self addComponents:components forCalendarUnit:[calendarUnit unsignedIntegerValue]];
    }
    return self;
}

@end

@implementation NSDate (Extension)

- (NSCalendar *)calendar
{
    NSCalendar *calendar = NSCalendar.autoupdatingCurrentCalendar;
    calendar.locale = NSLocale.autoupdatingCurrentLocale;
    return calendar;
}

- (NSCalendarUnit)calendarUnits
{
    NSCalendarUnit calendarUnits = 0;
    for (NSNumber *calendarUnit in NSCalendarUnitsKeys.allKeys)
    {
        calendarUnits |= [calendarUnit unsignedIntegerValue];
    }
    return calendarUnits;
}

- (NSDateComponents *)dateComponents
{
    return [NSCalendar.autoupdatingCurrentCalendar components:self.calendarUnits fromDate:self];
}

- (NSInteger)dateComponentForCalendarUnit:(NSCalendarUnit)calendarUnit
{
    return [[self.dateComponents valueForKey:NSCalendarUnitsKeys[@(calendarUnit)]] integerValue];
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
    return [self.calendar dateByAddingComponents:components toDate:self options:kNilOptions];
}

- (NSDateComponents *)lapse:(NSCalendarUnit)calendarUnit fromDate:(NSDate *)date
{
    return [self.calendar components:calendarUnit fromDate:date toDate:self options:kNilOptions];
}

- (NSDateComponents *)lapse:(NSCalendarUnit)calendarUnit toDate:(NSDate *)date
{
    return [self.calendar components:calendarUnit fromDate:self toDate:date options:kNilOptions];
}

@end
