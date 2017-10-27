//
//  FaceView.m
//  FaceGame
//
//  Created by Ivan Vasilevich on 5/23/15.
//  Copyright (c) 2015 Ivan Vasilevich. All rights reserved.
//

#import "FaceView.h"

@implementation FaceView

- (void)setHappyLevel:(float)happyLevel{
    
    if (happyLevel > -40 && happyLevel < 40) {
        _happyLevel = happyLevel;
        [self setNeedsDisplay];
    }
   
}

- (void)changeHappyFaceWithHappLevel:(float)happLevel andColor:(UIColor *)color {
    self.happyLevel = happLevel;
    self.faceColor = color;
}

- (void)setup{
    self.faceColor = self.backgroundColor;
    self.backgroundColor = [UIColor clearColor];
    self.contentMode = UIViewContentModeRedraw;
	
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(changeHappyLevel:)];
    [self addGestureRecognizer:pan];
    
}

- (void)changeHappyLevel:(UIPanGestureRecognizer *)sender{
    
    self.happyLevel = [sender locationInView:self].y - self.bounds.size.height/2;
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setup];
}

#define MARGIN 4
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGFloat width = self.bounds.size.width, height = self.bounds.size.height;
    CGRect edgeRect = self.bounds;
    edgeRect.size.width -= MARGIN * 2;
    edgeRect.size.height -= MARGIN * 2;
    edgeRect.origin.x += MARGIN;
    edgeRect.origin.y += MARGIN;
    UIBezierPath *edge = [UIBezierPath bezierPathWithRoundedRect:edgeRect cornerRadius:self.bounds.size.width/20];
    [[UIColor blackColor] setStroke];
    [self.faceColor setFill];
    [edge fill];
    [edge stroke];
    
    UIBezierPath *rightSide = [UIBezierPath new];
    [rightSide moveToPoint:CGPointMake(width/2, MARGIN)];
    [rightSide addCurveToPoint:CGPointMake(width/2 - width/10, height/2)
                 controlPoint1:CGPointMake(width/2 - width/15, height/4)
                 controlPoint2:CGPointMake(width/2 - width/12, height/4)];
    [rightSide addLineToPoint:CGPointMake(width/2 + width/10, height/2)];
    [rightSide addCurveToPoint:CGPointMake(width/2 + width/10 + width/20, height - MARGIN)
                 controlPoint1:CGPointMake(width/2 + width/10 , height/10 * 6.5)
                 controlPoint2:CGPointMake(width/2 + width/10 , height/10 * 8)];
    [rightSide addLineToPoint:CGPointMake(width - MARGIN, height - MARGIN)];
    [rightSide addLineToPoint:CGPointMake(width - MARGIN, MARGIN)];
    rightSide.lineWidth = MARGIN;
    [rightSide stroke];
    
    CGFloat red = 0.0, green = 0.0, blue = 0.0, alpha =0.0;
    [self.faceColor getRed:&red green:&green blue:&blue alpha:&alpha];
    red += .70;
    blue += .70;
    green += .70;
    
    [[UIColor colorWithRed:red green:green blue:blue alpha:1]  setFill];
    [rightSide fill];
    
    UIBezierPath *leftEye = [UIBezierPath new];
    [leftEye moveToPoint:CGPointMake(width/4, height/4)];
    [leftEye addLineToPoint:CGPointMake(width/4, height/4 + height/10)];
    leftEye.lineWidth = MARGIN;
    [leftEye stroke];
    
    UIBezierPath *rightEye = [UIBezierPath new];
    [rightEye moveToPoint:CGPointMake(width/4 * 3, height/4)];
    [rightEye addLineToPoint:CGPointMake(width/4 * 3, height/4 + height/10)];
    rightEye.lineWidth = MARGIN;
    [rightEye stroke];
    
    UIBezierPath *mouth = [UIBezierPath new];
    [mouth moveToPoint:CGPointMake(width/100*20, height/100*75)];
    [mouth addCurveToPoint:CGPointMake(width/100*80, height/100*75)
             controlPoint1:CGPointMake(width/100*40, height/100*75+self.happyLevel)
             controlPoint2:CGPointMake(width/100*60, height/100*75+self.happyLevel)];
    mouth.lineWidth = MARGIN;
    [mouth stroke];
  
}


@end
