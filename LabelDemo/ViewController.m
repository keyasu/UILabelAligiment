//
//  ViewController.m
//  LabelDemo
//
//  Created by wangergang on 2016/12/7.
//  Copyright © 2016年 MYCompangName. All rights reserved.
//

#import "ViewController.h"
#import "MYLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupLabel];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)setupLabel {
    //居上对齐
    MYLabel *topLabel = [[MYLabel alloc] initWithFrame:CGRectMake(20, 275, 350, 200)];

    topLabel.text = @"剧终了、剧终了、剧终了、剧终了、剧终了、剧终了、剧终了、";
    topLabel.backgroundColor = [UIColor cyanColor];
    topLabel.textAlignment = NSTextAlignmentLeft;
    topLabel.textColor = [UIColor blueColor];
    topLabel.lineBreakMode = NSLineBreakByCharWrapping;
    topLabel.numberOfLines = 0;
    [topLabel setVerticalAlignment:VerticalAlignmentMiddle];
    [self.view addSubview:topLabel];
    
    
    //居中对齐
    MYLabel *middleLabel = [[MYLabel alloc] initWithFrame:CGRectMake(20, 500, 350, 200)];
    
    middleLabel.text = @"向下看、向下看、向下看、向下看、向下看、向下看、向下看、向下看、";
    middleLabel.backgroundColor = [UIColor cyanColor];
    middleLabel.textAlignment = NSTextAlignmentLeft;
    middleLabel.textColor = [UIColor blueColor];
    middleLabel.lineBreakMode = NSLineBreakByCharWrapping;
    middleLabel.numberOfLines = 0;
    [middleLabel setVerticalAlignment:VerticalAlignmentBottom];
    [self.view addSubview:middleLabel];
    
    //居下对齐
    MYLabel *bottomLabel = [[MYLabel alloc] initWithFrame:CGRectMake(20, 50, 350, 200)];
    
    bottomLabel.text = @"看我居上对齐了啊、你看看对不对的啊、看来是对的";
    bottomLabel.backgroundColor = [UIColor cyanColor];
    bottomLabel.textAlignment = NSTextAlignmentLeft;
    bottomLabel.textColor = [UIColor blueColor];
    bottomLabel.lineBreakMode = NSLineBreakByCharWrapping;
    bottomLabel.numberOfLines = 0;
    [bottomLabel setVerticalAlignment:VerticalAlignmentTop];
    [self.view addSubview:bottomLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
