//
//  MYLabel.h
//  LabelDemo
//
//  Created by wangergang on 2016/12/7.
//  Copyright © 2016年 MYCompangName. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    VerticalAlignmentTop = 0, //default
    VerticalAlignmentMiddle,
    VerticalAlignmentBottom,
    
} VerticalAlignment;

@interface MYLabel : UILabel {

@private
    VerticalAlignment _verticalAlignment;
}

@property (nonatomic) VerticalAlignment verticalAlignment;

@end
