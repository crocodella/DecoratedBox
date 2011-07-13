//
//  HelloWorldLayer.m
//  DecoratedBox
//
//  Created by Fabio Rodella on 7/8/11.
//  Copyright Crocodella Software 2011. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"
#import "DecoratedBox.h"

// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
        [self addChild:[CCLayerColor layerWithColor:ccc4(0, 0, 200, 255)]];
		
		// ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
        
        DecoratedBox *box = [DecoratedBox decoratedBoxWithFile:@"box.png" width:96 height:96];
        box.position = ccp( size.width * 0.5f , size.height * 0.5f );
        [self addChild:box];
        
        DecoratedBox *box2 = [DecoratedBox decoratedBoxWithFile:@"box.png" width:160 height:288];
        box2.position = ccp( 0 , 0 );
        [self addChild:box2];
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
