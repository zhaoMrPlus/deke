//
//  KKWebviewViewController.h
//  KeKe
//
//  Created by 毛蛋 on 2018/12/25.
//  Copyright © 2018 zhb. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KKWebviewViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webview;
@property(nonatomic,strong)NSString * pathUrl;
@end

NS_ASSUME_NONNULL_END
