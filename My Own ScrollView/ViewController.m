//
//  ViewController.m
//  My Own ScrollView
//
//  Created by Luiz on 5/13/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property UIView *myScrollView;
@property UIPanGestureRecognizer *panGestureRecognizer;
@property CGPoint *centerPoint;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupScrollView];
    [self setupPanGestureRecognizer];
}

-(void) setupPanGestureRecognizer{
    self.panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(hanglePanGestureRecognize:)];
    [self.myScrollView addGestureRecognizer: self.panGestureRecognizer];
}
-(void) setupScrollView{
    self.myScrollView = [[UIView alloc] initWithFrame: self.view.frame];
//    [self.myScrollView.topAnchor  constraintEqualToAnchor:self.view.topAnchor].active = YES;
//    [self.myScrollView.leftAnchor  constraintEqualToAnchor:self.view.leftAnchor].active = YES;
//    [self.myScrollView.bottomAnchor  constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
//    [self.myScrollView.rightAnchor  constraintEqualToAnchor:self.view.rightAnchor].active = YES;
//
//    self.myScrollView.backgroundColor = [UIColor grayColor];

    [self.view addSubview: self.myScrollView];
    UIView *redView = [[UIView alloc] initWithFrame: CGRectMake(20, 20, 100, 100)];
    redView.backgroundColor = [UIColor redColor];

    UIView *greenView = [[UIView alloc] initWithFrame: CGRectMake(150,150, 150, 200)];
    greenView.backgroundColor = [UIColor greenColor];

    UIView *blueView = [[UIView alloc] initWithFrame: CGRectMake(40, 400, 200, 150)];
    blueView.backgroundColor = [UIColor redColor];

    UIView *yellowView = [[UIView alloc] initWithFrame: CGRectMake(100, 600, 180, 150)];
    yellowView.backgroundColor = [UIColor yellowColor];

    [self.myScrollView addSubview:redView];
    [self.myScrollView addSubview:greenView];
    [self.myScrollView addSubview:blueView];
    [self.myScrollView addSubview:yellowView];

    self.myScrollView.bounds = CGRectMake(self.myScrollView.frame.origin.x, self.myScrollView.frame.origin.y + 100, self.myScrollView.frame.size.width, self.myScrollView.frame.size.height);

  //  self.myScrollView.contents
    //  self.myScrollView.intrinsicContentSize = self.view.frame.size;
    //self.myScrollView
}


/*


 if sender.state == .began {

 } else if sender.state == .changed {

 } else if sender.state == .ended {

 }

 */

-(void) hanglePanGestureRecognize: (UIPanGestureRecognizer *) recognizer{
    UIView * view = recognizer.view;
    CGPoint translation = [recognizer translationInView: self.myScrollView];
    //CGPoint point = recognizer.;
    switch (recognizer.state) {
        case UIGestureRecognizerStateChanged:

            self.myScrollView.frame = CGRectMake(self.myScrollView.frame.origin.x + translation.x, self.myScrollView.frame.origin.y + translation.y, self.myScrollView.frame.size.width, self.myScrollView.frame.size.height);
            NSLog(@"%@", NSStringFromCGPoint([recognizer locationInView: self.myScrollView]));
            break;

        default:
            break;

    }

    [recognizer setTranslation: CGPointZero inView:self.myScrollView];
}

@end
