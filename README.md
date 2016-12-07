前言：
> 
![没有理由不去努力.png](http://upload-images.jianshu.io/upload_images/2144883-f483685f10f69da4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

正文：
想实现UILabel居上对齐，居中对齐，居下对齐，如下效果：

![效果图.png](http://upload-images.jianshu.io/upload_images/2144883-cb9f66da5b61f7df.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

#### 在iOS中默认的UILabel中的文字在竖直方向上只能居中对齐，博主参考国外网站，从UILabel继承了一个新类，实现了居上对齐，居中对齐，居下对齐
具体如下：
> 创建：MYLabel 继承与UILabel

在MYLabel.h中完成
>在MYLabel.h中完成

```
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
```

在MYLabel.m中完成
> 在MYLabel.m中完成

```
//
//  MYLabel.m
//  LabelDemo
//
//  Created by wangergang on 2016/12/7.
//  Copyright © 2016年 MYCompangName. All rights reserved.
//

#import "MYLabel.h"

@implementation MYLabel

@synthesize verticalAlignment = verticalAlignment_;

- (id)initWithFrame:(CGRect)frame {
self = [super initWithFrame:frame];
if (self) {
self.verticalAlignment = VerticalAlignmentMiddle;
}
return self;
}

- (void)setVerticalAlignment:(VerticalAlignment)verticalAlignment {
verticalAlignment_ = verticalAlignment;
[self setNeedsLayout];
}


- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
CGRect textRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
switch (self.verticalAlignment) {
case VerticalAlignmentTop:
textRect.origin.y = bounds.origin.y;
break;
case VerticalAlignmentBottom:
textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height;
break;
case VerticalAlignmentMiddle:
// Fall through.
default:
textRect.origin.y = bounds.origin.y + (bounds.size.height - textRect.size.height) / 2.0;
}
return textRect;
}

-(void)drawTextInRect:(CGRect)requestedRect {
CGRect actualRect = [self textRectForBounds:requestedRect limitedToNumberOfLines:self.numberOfLines];
[super drawTextInRect:actualRect];
}

@end
```

使用：首先记得引入头文件
> #import "MYLabel.h"

```
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
```

其效果图如上图：就不再上传了
> 简书位置[ianshu位置](http://www.jianshu.com/p/f3f478c1dba2)
