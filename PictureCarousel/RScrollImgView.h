//
//  RScrollImgView.h
//  Yiban
//
//  Created by Rocky on 16/7/5.
//  Copyright © 2016年 Rocky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RScrollImgView : UIView <UIScrollViewDelegate>

@property (strong, nonatomic) NSArray *imgUrls;

@property (strong, nonatomic) void(^clickImgsAtIndex)(int index);

@end
