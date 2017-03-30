//
//  RScrollImgView.m
//  Yiban
//
//  Created by Rocky on 16/7/5.
//  Copyright © 2016年 Rocky. All rights reserved.
//

#import "RScrollImgView.h"
#import "UIImageView+WebCache.h"

@implementation RScrollImgView
{
    UIScrollView *_scollView;
    UIImageView *_imgVScroll1;
    UIImageView *_imgVScroll2;
    UIImageView *_imgVScroll3;
    
    UIPageControl *_pageControl;
    
    int _currentPageIndex;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
        
        _scollView.frame = frame;
        _pageControl.frame = CGRectMake(0, frame.size.height-30, frame.size.width, 30);
        
        _scollView.contentSize = CGSizeMake(3*_scollView.frame.size.width, _scollView.frame.size.height);
        _scollView.contentOffset = CGPointMake(_scollView.frame.size.width, 0);
        _scollView.delegate = self;
        _imgVScroll1.frame = CGRectMake(_scollView.frame.size.width*0, 0, _scollView.frame.size.width, _scollView.frame.size.height);
        _imgVScroll2.frame = CGRectMake(_scollView.frame.size.width*1, 0, _scollView.frame.size.width, _scollView.frame.size.height);
        _imgVScroll3.frame = CGRectMake(_scollView.frame.size.width*2, 0, _scollView.frame.size.width, _scollView.frame.size.height);
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    _scollView.frame = frame;
    _pageControl.frame = CGRectMake(0, frame.size.height-30, frame.size.width, 30);
    
    _scollView.contentSize = CGSizeMake(3*_scollView.frame.size.width, _scollView.frame.size.height);
    _scollView.contentOffset = CGPointMake(_scollView.frame.size.width, 0);
    _scollView.delegate = self;
    _imgVScroll1.frame = CGRectMake(_scollView.frame.size.width*0, 0, _scollView.frame.size.width, _scollView.frame.size.height);
    _imgVScroll2.frame = CGRectMake(_scollView.frame.size.width*1, 0, _scollView.frame.size.width, _scollView.frame.size.height);
    _imgVScroll3.frame = CGRectMake(_scollView.frame.size.width*2, 0, _scollView.frame.size.width, _scollView.frame.size.height);
}

- (void)initUI
{
    _currentPageIndex = 0;
    
    _scollView = [[UIScrollView alloc] init];
    _scollView.showsHorizontalScrollIndicator = NO;
    _scollView.showsVerticalScrollIndicator = NO;
    _scollView.pagingEnabled = YES;
    
    // 实现循环滚动的3张图片
    _imgVScroll1 = [[UIImageView alloc] init];
    _imgVScroll1.contentMode=UIViewContentModeScaleAspectFill;
    _imgVScroll1.clipsToBounds = YES;
    _imgVScroll2 = [[UIImageView alloc] init];
    _imgVScroll2.contentMode=UIViewContentModeScaleAspectFill;
    _imgVScroll2.clipsToBounds = YES;
    _imgVScroll3 = [[UIImageView alloc] init];
    _imgVScroll3.contentMode=UIViewContentModeScaleAspectFill;
    _imgVScroll3.clipsToBounds = YES;
    [_scollView addSubview:_imgVScroll1];
    [_scollView addSubview:_imgVScroll2];
    [_scollView addSubview:_imgVScroll3];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickScroll:)];
    [_scollView addGestureRecognizer:tap];
    
    
    _pageControl = [[UIPageControl alloc] init];
    _pageControl.currentPageIndicatorTintColor = [UIColor lightGrayColor];

    
    [self addSubview:_scollView];
    [self addSubview:_pageControl];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat x = scrollView.contentOffset.x;
    if (x > scrollView.frame.size.width*1.5) {
        _currentPageIndex++;
        scrollView.contentOffset = CGPointMake(x - scrollView.frame.size.width, 0);
    }
    
    if (x < scrollView.frame.size.width*0.5) {
        _currentPageIndex--;
        if (_currentPageIndex < 0) {
            _currentPageIndex += _imgUrls.count;
        }
        scrollView.contentOffset = CGPointMake(x + scrollView.frame.size.width, 0);
    }
    [self refreshImgView];
}

- (void)setImgUrls:(NSArray *)imgUrls
{
    _imgUrls = imgUrls;
    
    _pageControl.numberOfPages = imgUrls.count;
    
    [self refreshImgView];
}

- (void)refreshImgView
{
    _pageControl.currentPage = (_currentPageIndex+0)%self.imgUrls.count;
    
    NSURL *url1 = [NSURL URLWithString:self.imgUrls[(_currentPageIndex+2)%self.imgUrls.count]];
    [_imgVScroll1 sd_setImageWithURL:url1 placeholderImage:[UIImage imageNamed:@"defaultimg"]];
    NSURL *url2 = [NSURL URLWithString:self.imgUrls[(_currentPageIndex+0)%self.imgUrls.count]];
    [_imgVScroll2 sd_setImageWithURL:url2 placeholderImage:[UIImage imageNamed:@"defaultimg"]];
    NSURL *url3 = [NSURL URLWithString:self.imgUrls[(_currentPageIndex+1)%self.imgUrls.count]];
    [_imgVScroll3 sd_setImageWithURL:url3 placeholderImage:[UIImage imageNamed:@"defaultimg"]];
    
}

- (void)clickScroll:(UITapGestureRecognizer *)tap
{
    if (self.clickImgsAtIndex) {
        self.clickImgsAtIndex((_currentPageIndex+0)%self.imgUrls.count);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
