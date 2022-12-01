//
//  MainClockView.h
//  T5AlaramApp2
//
//  Created by 비바 on 2022/12/01.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainClockView : UIView{
    
    CGImageRef imgClock;
    int pHour;
    int pMinute;
    int pSecond;
    
}
-(void) drawLine:(CGContextRef) context;
-(void) drawClockBitmap:(CGContextRef)contex;
-(void) DrawSecond:(CGContextRef)context CenterX:(int)pCenterX CenterY:(int)pCenterY;
@property   int phour;
@property   int pMinute;
@property   int pSecond;


@end

NS_ASSUME_NONNULL_END
