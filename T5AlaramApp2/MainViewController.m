//
//  MainViewController.m
//  T5AlaramApp2
//
//  Created by 비바 on 2022/12/01.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [self onTimer];
    timer = [NSTimer scheduledTimerWithTimeInterval:(1.0) target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)onTimer{
    
    int phour,pminute,psecond;
    NSCalendar *pCalendar= [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    unsigned unitFlags = NSCalendarUnitYear| NSCalendarUnitMonth|
    NSCalendarUnitDay| NSCalendarUnitHour | NSCalendarUnitMinute| NSCalendarUnitSecond;
    NSDate *date = [NSDate date];
    NSDateComponents *comps = [pCalendar components:unitFlags fromDate:date];
    phour = (int)[comps hour];
    pminute = (int)[comps minute];
    psecond = (int)[comps second];
    clockDisplay.text= [NSString stringWithFormat:@"%02d:%02d:%02d",phour,pminute,psecond];
    
    pClockView.phour= phour;
    pClockView.pMinute= pminute;
    pClockView.pSecond =psecond;
    [pClockView setNeedsDisplay];
    
    if (self.pAlarmOnOff==YES){
        if (self.pAlaramHour == phour && self.pAlaramMinute == pminute && psecond == 0){
            [self messageDisplay];
        }
    }
    
}
-(void)messageDisplay{
    UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:@"clockTitle" message:@"time on" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *OK =[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertControl addAction:OK];
    [self presentViewController:alertControl animated:YES completion:nil];
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
