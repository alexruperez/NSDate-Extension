//
//  NSDate_Extension_Example_Tests.m
//  NSDate-Extension Example Tests
//
//  Created by alexruperez on 19/9/14.
//  Copyright (c) 2014 alexruperez. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSDate+Extension.h"


static NSInteger const iterateFrom = -100;
static NSInteger const iterateTo = 100;


@interface NSDate_Extension_Example_Tests : XCTestCase

@end

@implementation NSDate_Extension_Example_Tests

- (void)setUp
{
    [super setUp];
    
}

- (void)tearDown
{
    
    [super tearDown];
}

- (void)testEra
{
    for (NSInteger i = iterateFrom; i < iterateTo; i++)
    {
        XCTAssertTrue(@(i).era.era == i);
        XCTAssertTrue(@(i).era.later.era == i);
        XCTAssertTrue(@(i).era.after.era == i);
    }
}

- (void)testEraBefore
{
    for (NSInteger i = iterateFrom; i < iterateTo; i++)
    {
        XCTAssertTrue(@(i).era.before.era == -i);
        XCTAssertTrue(@(i).era.ago.era == -i);
    }
}

- (void)testYear
{
    for (NSInteger i = iterateFrom; i < iterateTo; i++)
    {
        XCTAssertTrue(@(i).year.year == i);
        XCTAssertTrue(@(i).year.later.year == i);
        XCTAssertTrue(@(i).year.after.year == i);
    }
}

- (void)testYearBefore
{
    for (NSInteger i = iterateFrom; i < iterateTo; i++)
    {
        XCTAssertTrue(@(i).year.before.year == -i);
        XCTAssertTrue(@(i).year.ago.year == -i);
    }
}

- (void)testMonth
{
    for (NSInteger i = iterateFrom; i < iterateTo; i++)
    {
        XCTAssertTrue(@(i).month.month == i);
        XCTAssertTrue(@(i).month.later.month == i);
        XCTAssertTrue(@(i).month.after.month == i);
    }
}

- (void)testMonthBefore
{
    for (NSInteger i = iterateFrom; i < iterateTo; i++)
    {
        XCTAssertTrue(@(i).month.before.month == -i);
        XCTAssertTrue(@(i).month.ago.month == -i);
    }
}

- (void)testDay
{
    for (NSInteger i = iterateFrom; i < iterateTo; i++)
    {
        XCTAssertTrue(@(i).day.day == i);
        XCTAssertTrue(@(i).day.later.day == i);
        XCTAssertTrue(@(i).day.after.day == i);
    }
}

- (void)testDayBefore
{
    for (NSInteger i = iterateFrom; i < iterateTo; i++)
    {
        XCTAssertTrue(@(i).day.before.day == -i);
        XCTAssertTrue(@(i).day.ago.day == -i);
    }
}

- (void)testHour
{
    for (NSInteger i = iterateFrom; i < iterateTo; i++)
    {
        XCTAssertTrue(@(i).hour.hour == i);
        XCTAssertTrue(@(i).hour.later.hour == i);
        XCTAssertTrue(@(i).hour.after.hour == i);
    }
}

- (void)testHourBefore
{
    for (NSInteger i = iterateFrom; i < iterateTo; i++)
    {
        XCTAssertTrue(@(i).hour.before.hour == -i);
        XCTAssertTrue(@(i).hour.ago.hour == -i);
    }
}

- (void)testMinute
{
    for (NSInteger i = iterateFrom; i < iterateTo; i++)
    {
        XCTAssertTrue(@(i).minute.minute == i);
        XCTAssertTrue(@(i).minute.later.minute == i);
        XCTAssertTrue(@(i).minute.after.minute == i);
    }
}

- (void)testMinuteBefore
{
    for (NSInteger i = iterateFrom; i < iterateTo; i++)
    {
        XCTAssertTrue(@(i).minute.before.minute == -i);
        XCTAssertTrue(@(i).minute.ago.minute == -i);
    }
}

- (void)testSecond
{
    for (NSInteger i = iterateFrom; i < iterateTo; i++)
    {
        XCTAssertTrue(@(i).second.second == i);
        XCTAssertTrue(@(i).second.later.second == i);
        XCTAssertTrue(@(i).second.after.second == i);
    }
}

- (void)testSecondBefore
{
    for (NSInteger i = iterateFrom; i < iterateTo; i++)
    {
        XCTAssertTrue(@(i).second.before.second == -i);
        XCTAssertTrue(@(i).second.ago.second == -i);
    }
}

- (void)testWeekday
{
    for (NSInteger i = iterateFrom; i < iterateTo; i++)
    {
        XCTAssertTrue(@(i).weekday.weekday == i);
        XCTAssertTrue(@(i).weekday.later.weekday == i);
        XCTAssertTrue(@(i).weekday.after.weekday == i);
    }
}

- (void)testWeekdayBefore
{
    for (NSInteger i = iterateFrom; i < iterateTo; i++)
    {
        XCTAssertTrue(@(i).weekday.before.weekday == -i);
        XCTAssertTrue(@(i).weekday.ago.weekday == -i);
    }
}

- (void)testWeekdayOrdinal
{
    for (NSInteger i = iterateFrom; i < iterateTo; i++)
    {
        XCTAssertTrue(@(i).weekdayOrdinal.weekdayOrdinal == i);
        XCTAssertTrue(@(i).weekdayOrdinal.later.weekdayOrdinal == i);
        XCTAssertTrue(@(i).weekdayOrdinal.after.weekdayOrdinal == i);
    }
}

- (void)testWeekdayOrdinalBefore
{
    for (NSInteger i = iterateFrom; i < iterateTo; i++)
    {
        XCTAssertTrue(@(i).weekdayOrdinal.before.weekdayOrdinal == -i);
        XCTAssertTrue(@(i).weekdayOrdinal.ago.weekdayOrdinal == -i);
    }
}

- (void)testQuarter
{
    for (NSInteger i = iterateFrom; i < iterateTo; i++)
    {
        XCTAssertTrue(@(i).quarter.quarter == i);
        XCTAssertTrue(@(i).quarter.later.quarter == i);
        XCTAssertTrue(@(i).quarter.after.quarter == i);
    }
}

- (void)testQuarterBefore
{
    for (NSInteger i = iterateFrom; i < iterateTo; i++)
    {
        XCTAssertTrue(@(i).quarter.before.quarter == -i);
        XCTAssertTrue(@(i).quarter.ago.quarter == -i);
    }
}

- (void)testWeekOfMonth
{
    for (NSInteger i = iterateFrom; i < iterateTo; i++)
    {
        XCTAssertTrue(@(i).weekOfMonth.weekOfMonth == i);
        XCTAssertTrue(@(i).weekOfMonth.later.weekOfMonth == i);
        XCTAssertTrue(@(i).weekOfMonth.after.weekOfMonth == i);
    }
}

- (void)testWeekOfMonthBefore
{
    for (NSInteger i = iterateFrom; i < iterateTo; i++)
    {
        XCTAssertTrue(@(i).weekOfMonth.before.weekOfMonth == -i);
        XCTAssertTrue(@(i).weekOfMonth.ago.weekOfMonth == -i);
    }
}

- (void)testWeekOfYear
{
    for (NSInteger i = iterateFrom; i < iterateTo; i++)
    {
        XCTAssertTrue(@(i).weekOfYear.weekOfYear == i);
        XCTAssertTrue(@(i).weekOfYear.later.weekOfYear == i);
        XCTAssertTrue(@(i).weekOfYear.after.weekOfYear == i);
    }
}

- (void)testWeekOfYearBefore
{
    for (NSInteger i = iterateFrom; i < iterateTo; i++)
    {
        XCTAssertTrue(@(i).weekOfYear.before.weekOfYear == -i);
        XCTAssertTrue(@(i).weekOfYear.ago.weekOfYear == -i);
    }
}

- (void)testYearForWeekOfYear
{
    for (NSInteger i = iterateFrom; i < iterateTo; i++)
    {
        XCTAssertTrue(@(i).yearForWeekOfYear.yearForWeekOfYear == i);
        XCTAssertTrue(@(i).yearForWeekOfYear.later.yearForWeekOfYear == i);
        XCTAssertTrue(@(i).yearForWeekOfYear.after.yearForWeekOfYear == i);
    }
}

- (void)testYearForWeekOfYearBefore
{
    for (NSInteger i = iterateFrom; i < iterateTo; i++)
    {
        XCTAssertTrue(@(i).yearForWeekOfYear.before.yearForWeekOfYear == -i);
        XCTAssertTrue(@(i).yearForWeekOfYear.ago.yearForWeekOfYear == -i);
    }
}

- (void)testAnd
{
    for (NSInteger i = iterateFrom; i < iterateTo; i++)
    {
        NSDateComponents *result = [@(i).era and:[@(i).year and:[@(i).month and:[@(i).day and:[@(i).hour and:[@(i).minute and:[@(i).second and:[@(i).weekday and:[@(i).weekdayOrdinal and:[@(i).quarter and:[@(i).weekOfMonth and:[@(i).weekOfYear and:@(i).yearForWeekOfYear]]]]]]]]]]]];
        XCTAssertTrue(result.era == i);
        XCTAssertTrue(result.year == i);
        XCTAssertTrue(result.month == i);
        XCTAssertTrue(result.day == i);
        XCTAssertTrue(result.hour == i);
        XCTAssertTrue(result.minute == i);
        XCTAssertTrue(result.second == i);
        XCTAssertTrue(result.weekday == i);
        XCTAssertTrue(result.weekdayOrdinal == i);
        XCTAssertTrue(result.quarter == i);
        XCTAssertTrue(result.weekOfMonth == i);
        XCTAssertTrue(result.weekOfYear == i);
        XCTAssertTrue(result.yearForWeekOfYear == i);
    }
}

- (void)testAndBefore
{
    for (NSInteger i = iterateFrom; i < iterateTo; i++)
    {
        NSDateComponents *result = [@(i).era.before and:[@(i).year.before and:[@(i).month.before and:[@(i).day.before and:[@(i).hour.before and:[@(i).minute.before and:[@(i).second.before and:[@(i).weekday.before and:[@(i).weekdayOrdinal.before and:[@(i).quarter.before and:[@(i).weekOfMonth.before and:[@(i).weekOfYear.before and:@(i).yearForWeekOfYear.before]]]]]]]]]]]];
        XCTAssertTrue(result.era == -i);
        XCTAssertTrue(result.year == -i);
        XCTAssertTrue(result.month == -i);
        XCTAssertTrue(result.day == -i);
        XCTAssertTrue(result.hour == -i);
        XCTAssertTrue(result.minute == -i);
        XCTAssertTrue(result.second == -i);
        XCTAssertTrue(result.weekday == -i);
        XCTAssertTrue(result.weekdayOrdinal == -i);
        XCTAssertTrue(result.quarter == -i);
        XCTAssertTrue(result.weekOfMonth == -i);
        XCTAssertTrue(result.weekOfYear == -i);
        XCTAssertTrue(result.yearForWeekOfYear == -i);
    }
}

@end
