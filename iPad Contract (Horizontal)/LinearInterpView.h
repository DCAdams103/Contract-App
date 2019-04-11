//
//  LinearInterpView.h
//  iPadTest
//
//  Created by Dylan Adams on 6/8/16.
//  Copyright © 2016 Dylan Adams. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LinearInterpView : UIView

-(void) clearPath;

@property (nonatomic, assign) BOOL hasDrawn;
@property (nonatomic, strong) UIBezierPath *path;

@end
