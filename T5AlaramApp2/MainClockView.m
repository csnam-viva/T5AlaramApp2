//
//  MainClockView.m
//  T5AlaramApp2
//
//  Created by 비바 on 2022/12/01.
//

#import "MainClockView.h"
#define SECOND_WIDTH 100
@implementation MainClockView
@synthesize phour;
@synthesize pMinute;
@synthesize pSecond;

-(id)initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    UIImage *img =[UIImage imageNamed:@"clock.png"];
    imgClock = CGImageRetain(img.CGImage);
    return self;
}

-(void)drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self drawClockBitmap:context];
    [self drawLine:context];
}



-(void) drawLine:(CGContextRef) context{
    int centerX = self.bounds.size.width/2;
    int centerY = self.bounds.size.height/2;
    [self DrawSecond:context CenterX:centerX CenterY:centerY];
}
-(void) drawClockBitmap:(CGContextRef)context{
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, 0.0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextClipToRect(context,CGRectMake(0, 0, self.bounds.size.width,self.bounds.size.height));
    CGContextDrawImage(context,CGRectMake(0,0,CGImageGetWidth(imgClock),CGImageGetHeight(imgClock)),imgClock);
    CGContextRestoreGState(context);
}
-(void) DrawSecond:(CGContextRef)context CenterX:(int)pCenterX CenterY:(int)pCenterY{
    int newX,newY;
    newX = (int)(sin(pSecond*6*3.14/180)*SECOND_WIDTH+ pCenterX);
    newY = (int)(pCenterY- (cos(pSecond*6*3.14/180)*SECOND_WIDTH));
    CGContextSetRGBStrokeColor(context,0,0,0,1.0);
    CGContextSetLineWidth(context,2.0);
    CGContextMoveToPoint(context,pCenterX,pCenterY);
    CGContextAddLineToPoint(context,newX,newY);
    CGContextStrokePath(context);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


@end
