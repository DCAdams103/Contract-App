#import "LinearInterpView.h"

@implementation LinearInterpView
{
    
    CGContextRef context;
    CGPathRef cgPath;
}

// Class to make signature box

- (id)initWithCoder:(NSCoder *)aDecoder{
    
    if (self = [super initWithCoder:aDecoder]){
        // Sets settings for pen to draw with
        self.backgroundColor = UIColor.whiteColor;
        [self setMultipleTouchEnabled:NO];
        [self setBackgroundColor:[UIColor whiteColor]];
        _path = [UIBezierPath bezierPath];
        [_path setLineWidth:2.0];
    }
    return self;
}

// Draws
- (void)drawRect:(CGRect)rect{
    
    [[UIColor blackColor] setStroke];
    [_path stroke];
    
}

// Path begins
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    [_path moveToPoint:p];
    
}

// Path follows finger
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    [_path addLineToPoint:p]; // (4)
    [self setNeedsDisplay];
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [self touchesMoved:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [self touchesEnded:touches withEvent:event];
}

// The Clear button
-(void) clearPath{
    
    _path = nil;
    _path = [UIBezierPath bezierPath];
    [_path setLineWidth:2.0];
    [self setNeedsDisplay];
    
}

@end
