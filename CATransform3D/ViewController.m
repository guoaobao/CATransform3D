//
//  ViewController.m
//  CATransform3D
//
//  Created by gab on 17/7/25.
//  Copyright © 2017年 gab. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CGPoint tmpPoint;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSLog(@"========%f,%f",_greenView.layer.bounds.size.width,_greenView.bounds.size.width);
//    CALayer *layer=_greenView.layer;
//    NSLog(@"%@",[layer.delegate class]);//uiview是代理方，calayer是委托方
//    [self animationFunction];
//    NSLog(@"====%f,%f",_greenView.bounds.size.width,_greenView.layer.bounds.size.width);
    
    
//    UIView *v=[[UIView alloc]initWithFrame:CGRectMake(20, 300, 30, 30)];
//    v.backgroundColor=[UIColor yellowColor];
//    [self.view addSubview:v];
//    v.layer.bounds=CGRectMake(0, 0, 30, 15);

    //图层动画
    NSLog(@"++++%lu",_greenView.layer.sublayers.count);
   //    [_greenView.layer addSublayer:subviewView.layer];//这样写的话layer负责view上显示的内容，view负责处理事件。
    _greenView.backgroundColor=[UIColor clearColor];
    [self addSubView];
    NSLog(@"+++%lu",_greenView.layer.sublayers.count);

    UIPanGestureRecognizer *gesture=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(gesturePan:)];
    [_greenView addGestureRecognizer:gesture];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)addSubView
{
    //初始化所有子layer的位置
    CATransform3D transform=CATransform3DIdentity;
    UIView *subviewView=[[UIView alloc]initWithFrame:_greenView.bounds];
    subviewView.backgroundColor=[UIColor greenColor];
    transform=CATransform3DTranslate(transform, 0, 0, 100);//移动
    subviewView.layer.transform=transform;
    [_greenView addSubview:subviewView];

    UIView *subView1=[[UIView alloc]initWithFrame:_greenView.bounds];
    subView1.backgroundColor=[UIColor yellowColor];
    CATransform3D transform1=CATransform3DIdentity;
    transform1=CATransform3DRotate(transform1, M_PI_2, 1, 0, 0);//旋转
    transform1=CATransform3DTranslate(transform1, 0, 0,100);//移动
    subView1.layer.transform=transform1;
    [_greenView  addSubview:subView1];

    
    UIView *subView2=[[UIView alloc]initWithFrame:_greenView.bounds];
    subView2.backgroundColor=[UIColor grayColor];
    CATransform3D transform2=CATransform3DIdentity;
    transform2=CATransform3DRotate(transform2, M_PI_2, 0, 1, 0);//旋转
    transform2=CATransform3DTranslate(transform2, 0, 0, 100);//移动
    subView2.layer.transform=transform2;
    [_greenView addSubview:subView2];
    
    
    UIView *subView3=[[UIView alloc]initWithFrame:_greenView.bounds];
    subView3.backgroundColor=[UIColor blueColor];
    CATransform3D transform3=CATransform3DIdentity;
    transform3=CATransform3DTranslate(transform3, 0, 0, -100);
    subView3.layer.transform=transform3;
    [_greenView addSubview:subView3];
    
    UIView *subView4=[[UIView alloc]initWithFrame:_greenView.bounds];
    subView4.backgroundColor=[UIColor purpleColor];
    CATransform3D transform4=CATransform3DIdentity;
    transform4=CATransform3DRotate(transform4, M_PI_2, 0, 1, 0);//旋转
    transform4=CATransform3DTranslate(transform4, 0, 0, -100);
    subView4.layer.transform=transform4;
    [_greenView addSubview:subView4];
    
    UIView *subView5=[[UIView alloc]initWithFrame:_greenView.bounds];
    subView5.backgroundColor=[UIColor brownColor];
    CATransform3D transform5=CATransform3DIdentity;
    transform5=CATransform3DRotate(transform5, M_PI_2, 1,0, 0);//旋转
    transform5=CATransform3DTranslate(transform5, 0, 0, -100);
    subView5.layer.transform=transform5;
    [_greenView addSubview:subView5];

   
}
-(void)gesturePan:(UIPanGestureRecognizer *)gesture
{
    //对_greenView上所有子layer进行旋转，
    CGPoint point=[gesture locationInView:_greenView];
    CGFloat angleX=tmpPoint.x +(point.x/50);
    CGFloat angleY=tmpPoint.y+(point.y/50);
    CATransform3D transform3D=CATransform3DIdentity;
    transform3D.m34=1.2/-500;   //   m34 用于按比例缩放 x 和 y 的值来呈现视角的远近。
    transform3D = CATransform3DRotate(transform3D, angleX, 0, 1, 0);//x轴方向上的旋转
    transform3D = CATransform3DRotate(transform3D, angleY, 1, 0, 0);//y轴方向上的旋转
    _greenView.layer.sublayerTransform=transform3D;
    NSLog(@"======%f",transform3D.m34);
    if (gesture.state==UIGestureRecognizerStateEnded) {
        tmpPoint.x=angleX;
        tmpPoint.y=angleY;
    }
}


-(void)animationFunction
{
    CATransform3D transform3D=CATransform3DIdentity;
    float angle=45;
    transform3D.m34=1.2/-500;   //   m34 用于按比例缩放 x 和 y 的值来呈现视角的远近。
    _greenView.layer.transform=CATransform3DRotate(transform3D,angle, 0, 1, 0);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
