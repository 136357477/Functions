//
//  FunctionsViewController.m
//  Functions
//
//  Created by guohui on 15/4/8.
//  Copyright (c) 2015年 guohui. All rights reserved.
//

#import "FunctionsViewController.h"

@interface FunctionsViewController ()

@end

@implementation FunctionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self strToNSDate];
    
}
#pragma mark - 自己写的一些常用的函数
#pragma mark 计算指定时间与当前的时间差
/**
 * 计算指定时间与当前的时间差
 * @param compareDate   某一指定时间
 * @return 多少(秒or分or天or月or年)+前 (比如，3天前、10分钟前)
 */
-(NSString *) compareCurrentTime:(NSDate*) compareDate
//
{
    NSTimeInterval  timeInterval = [compareDate timeIntervalSinceNow];
    timeInterval = -timeInterval;
    long temp = 0;
    NSString *result;
    if (timeInterval < 60) {
        result = [NSString stringWithFormat:@"刚刚"];
        
        
    }
    else if((temp = timeInterval/60) <60){
        result = [NSString stringWithFormat:@"%ld分前",temp];
    }
    
    else if((temp = temp/60) <24){
        result = [NSString stringWithFormat:@"%ld小前",temp];
    }
    
    else if((temp = temp/24) <30){
        result = [NSString stringWithFormat:@"%ld天前",temp];
    }
    
    else if((temp = temp/30) <12){
        result = [NSString stringWithFormat:@"%ld月前",temp];
    }
    else{
        temp = temp/12;
        result = [NSString stringWithFormat:@"%ld年前",temp];
    }
    
    return  result;
}
//以下是NSDate中的常用方法:
/**
 
 - (id)initWithTimeInterval:(NSTimeInterval)secs sinceDate:(NSDate *)refDate;
 初始化为以refDate为基准，然后过了secs秒的时间
 
 - (id)initWithTimeIntervalSinceNow:(NSTimeInterval)secs;
 初始化为以当前时间为基准，然后过了secs秒的时间
 
 
 - (NSTimeInterval)timeIntervalSinceDate:(NSDate *)refDate;
 以refDate为基准时间，返回实例保存的时间与refDate的时间间隔
 
 - (NSTimeInterval)timeIntervalSinceNow;
 以当前时间(Now)为基准时间，返回实例保存的时间与当前时间(Now)的时间间隔
 
 - (NSTimeInterval)timeIntervalSince1970;
 以1970/01/01 GMT为基准时间，返回实例保存的时间与1970/01/01 GMT的时间间隔
 
 - (NSTimeInterval)timeIntervalSinceReferenceDate;
 以2001/01/01 GMT为基准时间，返回实例保存的时间与2001/01/01 GMT的时间间隔
 
 
 + (NSTimeInterval)timeIntervalSinceReferenceDate;
 
 */


//秒
// - (NSTimeInterval)timeIntervalSinceNow;
//    以当前时间(Now)为基准时间，返回实例保存的时间与当前时间(Now)的时间间隔

#pragma mark NSString 于 NSDate 之间的转换
- (void)strToNSDate{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];//当地时区
    [formatter setTimeZone:timeZone];
    [formatter setDateFormat:@"yyyy-M-d H:m:s"];
    
    
    //string to nsdate
    NSString *stringTime = @"2015-04-08 14:20:06";
    NSDate *dateTime = [formatter dateFromString:stringTime];
    NSLog(@"dateTime:%@",dateTime);
    
    //求时差
    NSString *str = [self compareCurrentTime:dateTime];
    NSLog(@"%@",str);
    
    
    
    
    //nsdate To String
    NSDate *dateNow = [NSDate date];

    NSLog(@"dateNow:%@",dateNow);

//    [formatter setDateFormat:@"yyyy年M月d日 H点m分"];

    [formatter setDateFormat:@"yyyy-M-d H:m:s"];
    NSLog(@"%@",[formatter stringFromDate:dateNow]);

    
    
    
    
}



#pragma mark - 内存警告
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
