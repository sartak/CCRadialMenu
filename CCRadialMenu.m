#import "CCRadialMenu.h"

@implementation CCRadialMenu

+(id) radialMenuWithArray:(NSArray *)items radius:(float)radius {
    return [[[self alloc] initRadialMenuWithArray:items radius:radius] autorelease];
}

-(id) initRadialMenuWithArray:(NSArray *)items radius:(float)radius;
{
    if ( (self=[super initWithArray:items]) ) {
        radius_ = radius;
    }
    return self;
}

-(CCMenuItem *) itemForTouch: (UITouch *) touch
{
    CGPoint touchLocation = [touch locationInView: [touch view]];
    touchLocation = [[CCDirector sharedDirector] convertToGL: touchLocation];

    CGPoint location = [self convertToNodeSpace:touchLocation];

    float distance = sqrt( location.x*location.x + location.y*location.y );

    if (distance >= radius_ * 0.5 && distance <= radius_ * 1.5) {
        int count = [children_ count];
        double factor = (2 * 3.14) / count;

        double theta = atan2(location.x, location.y);
        /* I use [0, 2pi) for layout, but atan2 returns [-pi, pi) */
        if (theta < 0) {
            theta += 2 * M_PI;
        }

        /* find closest item */
        int i = theta/factor + 0.5;

        /* don't let them tap halfway across the circle if there are few items */
        double angle_distance = fabs(factor * i - theta);
        if (angle_distance < M_PI/5) {
            /* tapping at 11 o'clock is like tapping at 1 o'clock */
            if (i == count) { i = 0; }
            CCMenuItem* item = [children_ objectAtIndex:i];
            if ( [item visible] && [item isEnabled] ) {
                return item;
            }
        }
    }

    /* delegate for tems that move, etc */
    return [super itemForTouch:touch];
}

@end
