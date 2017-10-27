//
//  FaceView.h
//  FaceGame
//
//  Created by Ivan Vasilevich on 5/23/15.
//  Copyright (c) 2015 Ivan Vasilevich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FaceView : UIView

@property (nonatomic) UIColor *faceColor;
@property (nonatomic) float happyLevel; // from - 40 (sad) to 40 (very happy)

- (void)changeHappyFaceWithHappLevel:(float)happLevel andColor:(UIColor *)color;

@end
