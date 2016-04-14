//
//  ViewController.m
//  BSNumbersSample
//
//  Created by 张亚东 on 16/4/6.
//  Copyright © 2016年 blurryssky. All rights reserved.
//

#import "ViewController.h"
#import "Flight.h"
#import "BSNumbersView.h"
#import <AFNetworking/AFNetworking.h>
#import "NSObject+BSNumbersExtension.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet BSNumbersView *numbersView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"航班信息";
    
    NSArray<NSDictionary *> *flightsInfo = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"flightsInfo" ofType:@"plist"]];
    
    NSMutableArray<Flight *> *flights = @[].mutableCopy;
    for (NSDictionary *flightInfo in flightsInfo) {
        Flight *flight = [[Flight alloc]initWithDictionary:flightInfo];
        [flights addObject:flight];
    }
    
    self.numbersView.headerData = @[@"航空公司", @"航班号", @"飞机大小", @"日期", @"起始地", @"目的地", @"出发时间", @"抵达时间", @"价格"];
    self.numbersView.bodyData = flights;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.numbersView reloadData];
    });
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
}

@end
