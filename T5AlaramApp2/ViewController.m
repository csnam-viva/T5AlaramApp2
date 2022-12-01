//
//  ViewController.m
//  T5AlaramApp2
//
//  Created by 비바 on 2022/12/01.
//

#import "ViewController.h"
#import "MainViewController.h"
#import "SetupViewController.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize infoButton;
- (void)viewDidLoad {
    MainViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
    _mainViewController = viewController;
    [self.view insertSubview:viewController.view belowSubview:infoButton];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

-(IBAction)setupClick{
    if (_setupViewController == nil){
        _setupViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SetupViewController_a"];

    }
    [self presentViewController:_setupViewController animated:YES completion:nil];
    
}
-(IBAction)closeClick{
    [self AlarmSetting];
    [_setupViewController dismissViewControllerAnimated:YES completion:nil];
}
-(void)AlarmSetting{
    _mainViewController.pAlarmOnOff = _setupViewController.switchControl.on;
    if (_mainViewController.pAlarmOnOff == YES)
    {
        NSCalendar *pCalendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        unsigned unitFlags = NSCalendarUnitYear| NSCalendarUnitMonth| NSCalendarUnitDay|
        NSCalendarUnitHour| NSCalendarUnitMinute | NSCalendarUnitSecond;
        NSDate *date = [_setupViewController.pDatePicker date];
        NSDateComponents *comps = [ pCalendar components:unitFlags fromDate:date];
        _mainViewController.pAlaramHour = (int)[comps hour];
        _mainViewController.pAlaramMinute = (int)[comps minute];
    }
    
}

@end
