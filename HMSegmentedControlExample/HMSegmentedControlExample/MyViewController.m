//
//  MyViewController.m
//  HMSegmentedControlExample
//
//  Created by yangshengchao on 14-9-13.
//  Copyright (c) 2014年 Hesham Abd-Elmegid. All rights reserved.
//

#import "MyViewController.h"
#import "HMSegmentedControl.h"

@interface MyViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) HMSegmentedControl *segmentedControl4;
@property (nonatomic, strong) UISegmentedControl *segmentedControl;

@end

@implementation MyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat yDelta;
    
    if ([[[UIDevice currentDevice] systemVersion] compare:@"7.0" options:NSNumericSearch] != NSOrderedAscending) {
        yDelta = 20.0f;
    } else {
        yDelta = 0.0f;
    }
    
    //------------------------------------------------------------------------------------------------------------
    //方法一：采用第三方库
    
    // Segmented control with more customization and indexChangeBlock
    HMSegmentedControl *segmentedControl3 = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"抢购吧", @"我的吧", @"我的吧", @"我的吧"]];
    segmentedControl3.layer.cornerRadius = 5;
    segmentedControl3.layer.masksToBounds = YES;
    [segmentedControl3 setFrame:CGRectMake(10, 160 + yDelta, 300, 30)];
    [segmentedControl3 setIndexChangeBlock:^(NSInteger index) {
        NSLog(@"Selected index %ld (via block)", (long)index);
    }];
    segmentedControl3.selectionIndicatorHeight = 2.0f;
    segmentedControl3.backgroundColor = [UIColor colorWithRed:0.1 green:0.4 blue:0.8 alpha:1];
    segmentedControl3.font = [UIFont systemFontOfSize:14];
    segmentedControl3.textColor = [UIColor whiteColor];
    segmentedControl3.selectedTextColor = [UIColor redColor];
    segmentedControl3.selectionStyle = HMSegmentedControlSelectionStyleBox;
    segmentedControl3.selectionIndicatorColor = [UIColor darkGrayColor];
    segmentedControl3.selectionIndicatorBoxOpacity = 1.0f;
    //    segmentedControl3.selectedSegmentIndex = HMSegmentedControlNoSegment;
    //    segmentedControl3.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    segmentedControl3.shouldAnimateUserSelection = NO;
    segmentedControl3.tag = 2;
    [self.view addSubview:segmentedControl3];
    
    
    
    //------------------------------------------------------------------------------------------------------------
    //方法二：采用系统原生的方法
    
    NSArray * segments = @[@"抢购吧",@"我的吧"];
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:segments];
    self.segmentedControl.frame = CGRectMake(10, 50, 180, 30);
    [self.view addSubview:self.segmentedControl];
    [self.segmentedControl setBackgroundColor:[UIColor greenColor]];
    self.segmentedControl.tintColor = [UIColor redColor];
    self.segmentedControl.layer.cornerRadius = 3;
    self.segmentedControl.layer.masksToBounds = YES;
    
    
    // Set divider images
    [self.segmentedControl setDividerImage:[UIImage imageNamed:@"333"]
                       forLeftSegmentState:UIControlStateNormal
                         rightSegmentState:UIControlStateNormal
                                barMetrics:UIBarMetricsDefault];
    [self.segmentedControl setDividerImage:[UIImage imageNamed:@"111"]
                       forLeftSegmentState:UIControlStateSelected
                         rightSegmentState:UIControlStateNormal
                                barMetrics:UIBarMetricsDefault];
    [self.segmentedControl setDividerImage:[UIImage imageNamed:@"222"]
                       forLeftSegmentState:UIControlStateNormal
                         rightSegmentState:UIControlStateSelected
                                barMetrics:UIBarMetricsDefault];
    self.segmentedControl.layer.borderWidth = 0;
    // Set background images
    UIImage *normalBackgroundImage = [UIImage imageNamed:@"333"];
    [self.segmentedControl setBackgroundImage:normalBackgroundImage
                                     forState:UIControlStateNormal
                                   barMetrics:UIBarMetricsDefault];
    UIImage *selectedBackgroundImage = [UIImage imageNamed:@"444"];
    [self.segmentedControl setBackgroundImage:selectedBackgroundImage
                                     forState:UIControlStateSelected
                                   barMetrics:UIBarMetricsDefault];
    
    //    [self.segmentedControl setContentPositionAdjustment:UIOffsetMake(50 / 2, 0)
    //                        forSegmentType:UISegmentedControlSegmentLeft
    //                            barMetrics:UIBarMetricsDefault];
    //    [self.segmentedControl setContentPositionAdjustment:UIOffsetMake(- 50 / 2, 0)
    //                        forSegmentType:UISegmentedControlSegmentRight
    //                            barMetrics:UIBarMetricsDefault];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
