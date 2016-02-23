//
//  ViewController.m
//  BirdFly
//
//  Created by AragonUit on 2/23/16.
//  Copyright © 2016 AragonUit. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIImageView* bird;
}@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self drawJungle];
    [self addBird];
    [self birdFlyUpAndDown];
}

-(void) drawJungle{
   UIImageView* imgJungle=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"jungle.jpg"]];
    imgJungle.frame =self.view.bounds;
    [self.view addSubview:imgJungle];
}
-(void)addBird
{
    bird =[[UIImageView alloc]initWithFrame:CGRectMake(0,0,110,68)];
    NSMutableArray* birdFly=[[NSMutableArray alloc]initWithCapacity:6];
    for (int i=0; i<=5; i++) {
        UIImage* imgBird=[UIImage imageNamed:[NSString stringWithFormat:@"bird%d.png",i]];
        [birdFly addObject:imgBird];
    }
    bird.animationImages = birdFly;
    bird.animationRepeatCount=-1;
    bird.animationDuration=1;
    [bird startAnimating];
    [self.view addSubview:bird];
}
-(void)birdFlyUpAndDown{
    bird.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:5 animations:^{
        bird.center = CGPointMake(self.view.bounds.size.width -30, self.view.bounds.size.height - 30);
    } completion:^(BOOL finished) {
        bird.transform = CGAffineTransformConcat(
                                                 CGAffineTransformMakeScale(-1, 1),
                                                 CGAffineTransformMakeRotation(M_PI_4));
        [UIView animateWithDuration:5 animations:^{
            bird.center = CGPointMake(0, 0);
        } completion:^(BOOL finished) {
            [self birdFlyUpAndDown];
        }];
    }];
}
    
@end
