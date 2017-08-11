//
//  ONEDateTool.m
//  CWOne
//
//  Created by Coulson_Wang on 2017/8/4.
//  Copyright © 2017年 Coulson_Wang. All rights reserved.
//

#import "ONEDateTool.h"
#import "ONEMainTabBarController.h"
#import "ONEHomeWeatherItem.h"
#import "NSString+ONEComponents.h"

static ONEDateTool *_instance;

@implementation ONEDateTool

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[ONEDateTool alloc] init];
    });
    return _instance;
}

- (NSString *)currentDateString {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *currentDate = [formatter dateFromString:self.dateOriginStr];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSString *currentDateString = [formatter stringFromDate:currentDate];
    return currentDateString;
}

- (NSString *)getDateStringFromCurrentDateWihtDateInterval:(NSInteger)dateInterval {
    NSDate *newDate = [self getDateFromCurrentDateWithDateInterval:dateInterval];
    return [NSString getDateStringWithDate:newDate];
}

- (NSDate *)getDateFromCurrentDateWithDateInterval:(NSInteger)dateInterval {
    NSDate *currentDate = [self.currentDateString getDate];
    NSTimeInterval intervalInSeconds = dateInterval * 24.0 * 60 * 60;
    NSDate *newDate = [currentDate dateByAddingTimeInterval:-intervalInSeconds];
    return newDate;
}

- (NSString *)yesterdayDateStr {
    return [self getDateStringFromCurrentDateWihtDateInterval:1];
}

- (NSString *)getCommentDateStringWithOriginalDateString:(NSString *)dateString {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *date = [formatter dateFromString:dateString];
    formatter.dateFormat = @"yyyy.MM.dd HH:mm";
    return [formatter stringFromDate:date];
}

- (NSString *)getFeedsRequestDateStringWithOriginalDateString:(NSString *)dateString {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSDate *date = [formatter dateFromString:dateString];
    formatter.dateFormat = @"yyyy-MM";
    return [formatter stringFromDate:date];
}

- (NSString *)getFeedsDateStringWithOriginalDateString:(NSString *)originalDateString {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSDate *date = [formatter dateFromString:originalDateString];
    formatter.dateFormat = @"yyyy / MM / dd";
    return [formatter stringFromDate:date];
}

- (NSString *)getNextMonthDateStringWithCurrentMonthDateString:(NSString *)currentMonthDateString {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM";
    NSDate *date = [formatter dateFromString:currentMonthDateString];
    NSDate *nextMonthDate = [date dateByAddingTimeInterval:31*24*60*60];
    return [formatter stringFromDate:nextMonthDate];
}

- (NSString *)getLastMonthDateStringWithCurrentMonthDateString:(NSString *)currentMonthDateString {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM";
    NSDate *date = [formatter dateFromString:currentMonthDateString];
    NSDate *nextMonthDate = [date dateByAddingTimeInterval:-31*24*60*60];
    return [formatter stringFromDate:nextMonthDate];
}

@end
