//
//  CALayer+BorderColer.m
//  Funny jokes
//
//  Created by 💋索少杰 on 2017/2/27.
//  Copyright © 2017年 💋索少杰. All rights reserved.
//

#import "CALayer+BorderColer.h"

@implementation CALayer (BorderColer)
- (void)setBorderColorFromUIColor:(UIColor *)color {

    self.borderColor = color.CGColor;
    
}@end
