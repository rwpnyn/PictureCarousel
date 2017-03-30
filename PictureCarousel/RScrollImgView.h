//
//  RScrollImgView.h
//  Yiban
//
//  Created by Rocky on 16/7/5.
//  Copyright © 2016年 Rocky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RImgModel : NSObject

/**
 * 图片链接
 **/
@property (copy, nonatomic) NSString *imgUrl;

/**
 * 默认图片
 **/
@property (copy, nonatomic) NSString *defaultImg;

/**
 * 标记
 **/
@property (copy, nonatomic) NSString *mark;

- (instancetype)initWithImgUrl:(NSString *)imgUrl defaultImg:(NSString *)defaultImg mark:(NSString *)mark;

@end

@interface RScrollImgView : UIView <UIScrollViewDelegate>

@property (strong, nonatomic) NSArray<RImgModel *> *imgs;

@property (strong, nonatomic) void(^clickImgsAtIndex)(RImgModel *model);

@end

