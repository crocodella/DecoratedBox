//
//  DecoratedBox.m
//  DecoratedBox
//
//  Created by Fabio Rodella on 7/8/11.
//  Copyright 2011 Crocodella Software. All rights reserved.
//

#import "DecoratedBox.h"

@implementation DecoratedBox

@synthesize cellSize;
@synthesize boxWidth;
@synthesize boxHeight;

+ (id)decoratedBoxWithFile:(NSString *)filename width:(CGFloat)w height:(CGFloat)h {
    return [[[self alloc] initWithFile:filename width:w height:h] autorelease];
}

- (id)initWithFile:(NSString *)filename width:(CGFloat)w height:(CGFloat)h {
    if ((self = [super initWithFile:filename capacity:9])) {
        
        cellSize = [self.textureAtlas.texture contentSize].width / 3;
        
        self.anchorPoint = ccp(0.5, 0.5);
        
        [self resizeToWidth:w height:h];        
    }
    return self;
}

- (void)resizeToWidth:(CGFloat)w height:(CGFloat)h {
    
    [self removeAllChildrenWithCleanup:YES];
    
    boxWidth = w;
    boxHeight = h;
    
    int uw = floor(w / cellSize);
    int uh = floor(h / cellSize);
    
    self.contentSize = CGSizeMake(uw * cellSize, uh * cellSize);
    
    for (int j = 0; j < uh; j++) {
        for (int i = 0; i < uw; i++) {
            
            CGRect rect;
            
            if (i == 0) {
                
                if (j == (uh - 1)) {
                    // Top left cap
                    rect = CGRectMake(0, 0, cellSize, cellSize);
                } else if (j == 0) {
                    // Bottom left cap
                    rect = CGRectMake(0, cellSize * 2, cellSize, cellSize);
                } else {
                    // Left border
                    rect = CGRectMake(0, cellSize, cellSize, cellSize);
                }
                
            } else if (i == (uw - 1)) {
                
                if (j == (uh - 1)) {
                    // Top right cap
                    rect = CGRectMake(cellSize * 2, 0, cellSize, cellSize);
                } else if (j == 0) {
                    // Bottom right cap
                    rect = CGRectMake(cellSize * 2, cellSize * 2, cellSize, cellSize);
                } else {
                    // Right border
                    rect = CGRectMake(cellSize * 2, cellSize, cellSize, cellSize);
                }
                
            } else if (j == (uh - 1)) {
                
                // Top border
                rect = CGRectMake(cellSize, 0, cellSize, cellSize);
                
            } else if (j == 0) {
                
                // Bottom border
                rect = CGRectMake(cellSize, cellSize * 2, cellSize, cellSize);
                
            } else {
                
                // Middle
                rect = CGRectMake(cellSize, cellSize, cellSize, cellSize);
                
            }
            
            CCSprite *b = [CCSprite spriteWithBatchNode:self rect:rect];
            b.position = ccp(i * cellSize, j * cellSize);
            b.tag = j * cellSize + i;
            
            [self addChild:b];
            
        }
    }

    
}

@end
