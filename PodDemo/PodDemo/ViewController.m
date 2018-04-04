//
//  ViewController.m
//  PodDemo
//
//  Created by akun on 2018/3/2.
//  Copyright © 2018年 akun. All rights reserved.
//

#import "ViewController.h"
#import "YYLabel.h"
#import "NSAttributedString+YYText.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self test1];
}

- (void)test2
{
    UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:scrollView];
    
    CGFloat f = 233.0/255;

    YYLabel * label = [[YYLabel alloc] initWithFrame:CGRectMake(10, 100, self.view.frame.size.width-20, self.view.frame.size.height-200)];
    label.backgroundColor   = [UIColor colorWithRed:f green:f blue:f alpha:0.5];
    label.numberOfLines     = 0;
    label.textVerticalAlignment = YYTextVerticalAlignmentTop;
    [scrollView addSubview:label];
    
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"稻香\n词：周杰伦 曲：周杰伦 \nLRC制作：思雨\n对这个世界如果你有太多的抱怨\n跌倒了 就不敢继续往前走\n为什么 人要这么的脆弱堕落\n请你打开电视看看\n多少人为生命在努力勇敢的走下去\n我们是不是该知足\n珍惜一切就算没有拥有\n还记得 你说家是唯一的城堡\n随着稻香河流继续奔跑\n微微笑 小时候的梦我知道\n不要哭 让萤火虫带着你逃跑\n乡间的歌谣 永远的依靠\n回家吧 回到最初的美好\n…………"];
    // 字体
    [text yy_setFont:[UIFont systemFontOfSize:14] range:text.yy_rangeOfAll];
    // 行间距
    text.yy_lineSpacing = 10;
   
    NSRange range0 = NSMakeRange(0, @"稻香".length);
    // 字体
    [text yy_setFont:[UIFont systemFontOfSize:30] range:range0];
    //文字颜色
    [text yy_setColor:[UIColor purpleColor] range:range0];
    //文字间距
    [text yy_setKern:@(20) range:range0];
    //文字描边（空心字）默认黑色，必须设置width
    [text yy_setStrokeColor:[UIColor redColor] range:range0];
    [text yy_setStrokeWidth:@(4) range:range0];
    
    
    
    
    NSRange range2 = [[text string] rangeOfString:@"对这个世界如果你有太多的抱怨" options:NSCaseInsensitiveSearch];
    YYTextDecoration *decoration = [YYTextDecoration decorationWithStyle:YYTextLineStyleSingle width:@(1) color:[UIColor redColor]];
    //删除样式
//    [text yy_setTextStrikethrough:decoration range:range2];
    //下划线
    [text yy_setTextUnderline:decoration range:range2];
    
    
    
    
    NSRange range3 = [[text string] rangeOfString:@"跌倒了 就不敢继续往前走" options:NSCaseInsensitiveSearch];
    //边框
    YYTextBorder *border = [YYTextBorder new];
    border.strokeColor = [UIColor colorWithRed:1.000 green:0.029 blue:0.651 alpha:1.000];
    border.strokeWidth = 1;
    border.lineStyle = YYTextLineStyleSingle;
    border.cornerRadius = 3;
    border.insets = UIEdgeInsetsMake(-1, -4, -1, -4);
    [text yy_setTextBorder:border range:range3];
    
    
    NSRange range4 = [[text string] rangeOfString:@"为什么 人要这么的脆弱堕落" options:NSCaseInsensitiveSearch];
    //阴影
    NSShadow *shadow = [[NSShadow alloc] init];
    [shadow setShadowColor:[UIColor lightGrayColor]];
    [shadow setShadowBlurRadius:1.0];
    [shadow setShadowOffset:CGSizeMake(2, 2)];
    [text yy_setShadow:shadow range:range4];
    
  
    NSRange range5 = [[text string] rangeOfString:@"请你打开电视看看" options:NSCaseInsensitiveSearch];
    //文本内阴影
    YYTextShadow *shadow1 = [YYTextShadow new];
    shadow1.color = [UIColor redColor];
    shadow1.offset = CGSizeMake(0,5);
    shadow1.radius = 1;
    [text yy_setTextInnerShadow:shadow1 range:range5];
    
    
    //文本高亮简单版
    NSRange range8 = [[text string] rangeOfString:@"随着稻香河流继续奔跑" options:NSCaseInsensitiveSearch];
    [text yy_setTextHighlightRange:range8 color:[UIColor colorWithRed:0.093 green:0.492 blue:1.000 alpha:1.000]
                   backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.220]
                         tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
                             NSLog(@"%@",[NSString stringWithFormat:@"Tap: %@",[text.string substringWithRange:range]]);
                         }];
    
    //文本高亮pro
    UIColor *colorNormal = [UIColor colorWithRed:0.093 green:0.492 blue:1.000 alpha:1.000];
    UIColor *colorHighlight = [UIColor purpleColor];
    NSRange range9 = [[text string] rangeOfString:@"微微笑 小时候的梦我知道" options:NSCaseInsensitiveSearch];
    YYTextDecoration *decorationNomal = [YYTextDecoration decorationWithStyle:YYTextLineStyleSingle width:@(1) color:colorNormal];
    YYTextDecoration *decorationHighlight = [YYTextDecoration decorationWithStyle:YYTextLineStyleSingle width:@(1) color:colorHighlight];
    //未点击时颜色
    [text yy_setColor:colorNormal range:range9];
    //未点击时下划线
    [text yy_setTextUnderline:decorationNomal range:range9];
    //点击后的状态
    YYTextHighlight *highlight = [YYTextHighlight new];
    [highlight setColor:colorHighlight];
    [highlight setUnderline:decorationHighlight];
    highlight.tapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
        
        NSLog(@"%@",[NSString stringWithFormat:@"Tap: %@",[text.string substringWithRange:range]]);
        
    };
    [text yy_setTextHighlight:highlight range:range9];
   
   
   
   
//    YYTextLinePositionSimpleModifier *modifier = [YYTextLinePositionSimpleModifier new];
//    modifier.fixedLineHeight = 30;
//    label.linePositionModifier = modifier;
    
    label.attributedText = text;
    label.textContainerInset = UIEdgeInsetsMake(10, 10, 10, 10);
//    [label sizeToFit];
    
    scrollView.contentSize = CGSizeMake(0, label.frame.size.height+200);
}





- (void)test1
{
    YYLabel * label = [[YYLabel alloc] initWithFrame:CGRectMake(10, 100, self.view.frame.size.width-20, 200)];
    
    label.font = [UIFont systemFontOfSize:14.0f];
    
    label.textColor = [UIColor lightGrayColor];
    
    label.textAlignment=NSTextAlignmentCenter;
    
    label.lineBreakMode=NSLineBreakByCharWrapping;
    
    label.numberOfLines = 0;
    
    //    label.backgroundColor = [UIColor blueColor];
    //    label.text=@"2006年的诺贝尔文学奖颁给了土耳其作家奥尔罕．帕慕克。在很多人都很意外的时候，我心头却感到一阵开心，因为早在两年前，我就知道了这个作家";
    //    label.textTapAction = ^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
    //        NSLog(@"点击了：%@",[text string]);
    //    };
    
    
    NSMutableAttributedString * text = [[NSMutableAttributedString alloc] initWithString:@"2006年的诺贝尔文学奖颁给了土耳其作家奥尔罕．帕慕克。在很多人都很意外的时候，我心头却感到一阵开心，因为早在两年前，我就知道了这个作家"];
    
    [text yy_setTextHighlightRange:NSMakeRange(0, 5) color:[UIColor greenColor] backgroundColor:[UIColor whiteColor] tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        NSLog(@"点击了：%@",[text string]);
        NSLog(@"%@",NSStringFromRange(range));
        NSLog(@"%@",NSStringFromCGRect(rect));
        NSLog(@"%@",containerView);
        containerView.backgroundColor = [UIColor redColor];
    }];
    
    [text yy_setTextHighlightRange:NSMakeRange(6, 5) color:[UIColor redColor] backgroundColor:[UIColor greenColor] userInfo:nil];
    
    [text yy_setTextHighlightRange:NSMakeRange(13, 5) color:[UIColor greenColor] backgroundColor:[UIColor blackColor] userInfo:nil tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        NSLog(@"%@",[text string]);
    } longPressAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        NSLog(@"长按");
    }];
    
    text.yy_lineSpacing = 8;
    text.yy_font = [UIFont systemFontOfSize:12];
    
    
    // 1. 创建一个"高亮"属性，当用户点击了高亮区域的文本时，"高亮"属性会替换掉原本的属性
    YYTextBorder *border = [YYTextBorder borderWithFillColor:[UIColor redColor] cornerRadius:0];
    
    YYTextHighlight *highlight = [YYTextHighlight new];
    [highlight setColor:[UIColor whiteColor]];
    [highlight setBackgroundBorder:border];
    highlight.tapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
        NSLog(@"tap text range:...");
    };
    
    
    [text yy_setTextHighlight:highlight range:NSMakeRange(19, 8)];
    
    label.attributedText = text;
    
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:CGSizeMake(self.view.frame.size.width-20, CGFLOAT_MAX) text:text];
    NSLog(@"YY计算-%f",layout.textBoundingSize.height);
    label.frame = CGRectMake(10, 100, self.view.frame.size.width-20, layout.textBoundingSize.height+20);
    
    //添加阴影
    //    label.shadowColor = [UIColor redColor];
    //    label.shadowOffset = CGSizeMake(1, 1);
    //    label.shadowBlurRadius = 5.0;
    
    label.textVerticalAlignment = YYTextVerticalAlignmentTop;
    
    // 以下语句很重要,不要漏掉
    label.backgroundColor = [UIColor colorWithWhite:0.933 alpha:1.000];
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
