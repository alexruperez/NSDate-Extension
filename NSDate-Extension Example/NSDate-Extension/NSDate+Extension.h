//
//  NSDate+Extension.h
//  NSDate-Extension Example
//
//  Created by Alejandro Rupérez on 16/06/14.
//  Copyright (c) 2014 alexruperez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (Extension)

@property (strong, nonatomic, readonly, getter = eras) NSDateComponents *era;
@property (strong, nonatomic, readonly) NSDateComponents *eras;
@property (strong, nonatomic, readonly, getter = years) NSDateComponents *year;
@property (strong, nonatomic, readonly) NSDateComponents *years;
@property (strong, nonatomic, readonly, getter = months) NSDateComponents *month;
@property (strong, nonatomic, readonly) NSDateComponents *months;
@property (strong, nonatomic, readonly, getter = days) NSDateComponents *day;
@property (strong, nonatomic, readonly) NSDateComponents *days;
@property (strong, nonatomic, readonly, getter = hours) NSDateComponents *hour;
@property (strong, nonatomic, readonly) NSDateComponents *hours;
@property (strong, nonatomic, readonly, getter = minutes) NSDateComponents *minute;
@property (strong, nonatomic, readonly) NSDateComponents *minutes;
@property (strong, nonatomic, readonly, getter = seconds) NSDateComponents *second;
@property (strong, nonatomic, readonly) NSDateComponents *seconds;
@property (strong, nonatomic, readonly, getter = weekdays) NSDateComponents *weekday;
@property (strong, nonatomic, readonly) NSDateComponents *weekdays;
@property (strong, nonatomic, readonly, getter = weekdaysOrdinal) NSDateComponents *weekdayOrdinal;
@property (strong, nonatomic, readonly) NSDateComponents *weekdaysOrdinal;
@property (strong, nonatomic, readonly, getter = quarters) NSDateComponents *quarter;
@property (strong, nonatomic, readonly) NSDateComponents *quarters;
@property (strong, nonatomic, readonly, getter = weeksOfMonth) NSDateComponents *weekOfMonth;
@property (strong, nonatomic, readonly) NSDateComponents *weeksOfMonth;
@property (strong, nonatomic, readonly, getter = weeksOfYear) NSDateComponents *weekOfYear;
@property (strong, nonatomic, readonly) NSDateComponents *weeksOfYear;
@property (strong, nonatomic, readonly, getter = yearsForWeekOfYear) NSDateComponents *yearForWeekOfYear;
@property (strong, nonatomic, readonly) NSDateComponents *yearsForWeekOfYear;

@end

@interface NSDateComponents (Extension)

@property (strong, nonatomic, readonly, getter = before) NSDateComponents *ago;
@property (strong, nonatomic, readonly) NSDateComponents *before;
@property (strong, nonatomic, readonly, getter = self) NSDateComponents *later;
@property (strong, nonatomic, readonly, getter = self) NSDateComponents *after;

- (NSDateComponents *)and:(NSDateComponents *)components;

@end

@interface NSDate (Extension)

@property (assign, nonatomic, readonly) NSInteger era;
@property (assign, nonatomic, readonly) NSInteger year;
@property (assign, nonatomic, readonly) NSInteger month;
@property (assign, nonatomic, readonly) NSInteger day;
@property (assign, nonatomic, readonly) NSInteger hour;
@property (assign, nonatomic, readonly) NSInteger minute;
@property (assign, nonatomic, readonly) NSInteger second;
@property (assign, nonatomic, readonly) NSInteger weekday;
@property (assign, nonatomic, readonly) NSInteger weekdayOrdinal;
@property (assign, nonatomic, readonly) NSInteger quarter;
@property (assign, nonatomic, readonly) NSInteger weekOfMonth;
@property (assign, nonatomic, readonly) NSInteger weekOfYear;
@property (assign, nonatomic, readonly) NSInteger yearForWeekOfYear;

- (NSDate *)get:(NSDateComponents *)components;
- (NSDateComponents *)lapse:(NSCalendarUnit)calendarUnit fromDate:(NSDate *)date;
- (NSDateComponents *)lapse:(NSCalendarUnit)calendarUnit toDate:(NSDate *)date;

@end
