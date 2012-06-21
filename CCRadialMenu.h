#import <GameKit/GameKit.h>
#import "cocos2d.h"

@interface CCMenu (missing) {
}
-(CCMenuItem *) itemForTouch: (UITouch *) touch;
@end

@interface CCRadialMenu : CCMenu {
    float radius_;
}

+(id) radialMenuWithArray:(NSArray *)items radius:(float)radius;
-(id) initRadialMenuWithArray:(NSArray *)items radius:(float)radius;
-(void) alignItemsRadially;

@end
