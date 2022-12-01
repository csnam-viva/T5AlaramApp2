//
//  MainViewController.h
//  T5AlaramApp2
//
//  Created by 비바 on 2022/12/01.
//

#import <UIKit/UIKit.h>
#import "MainClockView.h"
NS_ASSUME_NONNULL_BEGIN

@interface MainViewController : UIViewController
{
    NSTimer      *timer;
    IBOutlet    UILabel *clockDisplay;
    IBOutlet    MainClockView  *pClockView;
}
-(void)onTimer;

@property Boolean pAlarmOnOff;
@property int pAlaramHour;
@property int pAlaramMinute;
@end

NS_ASSUME_NONNULL_END
