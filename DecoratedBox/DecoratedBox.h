//
//  DecoratedBox.h
//  DecoratedBox
//
//  Created by Fabio Rodella on 7/8/11.
//  Copyright 2011 Crocodella Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface DecoratedBox : CCSpriteBatchNode {
    CGFloat cellSize;
    
    CGFloat boxWidth;
    CGFloat boxHeight;
}

@property (readonly, nonatomic) CGFloat cellSize;
@property (readonly, nonatomic) CGFloat boxWidth;
@property (readonly, nonatomic) CGFloat boxHeight;

+ (id)decoratedBoxWithFile:(NSString *)filename width:(CGFloat)w height:(CGFloat)h;

- (id)initWithFile:(NSString *)filename width:(CGFloat)w height:(CGFloat)h;

- (void)resizeToWidth:(CGFloat)w height:(CGFloat)h;

@end
