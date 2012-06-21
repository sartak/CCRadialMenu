`CCMenu`'s builtin layouts are limited to a grid. This subclass offers a radial layout for its items for spacing the items out on a circle. The following screenshot demonstrates a `CCRadialMenu` whose items are Japanese characters:

![CCRadialMenu example](http://rpglanguage.net/kanaswirl/img/CCRadialMenu.png)

(the colored dots are a separate game element not provided by `CCRadialMenu`)

##### Usage

    #import "CCRadialMenu.h"
    
    
    CCRadialMenu *menu = [CCRadialMenu radialMenuWithArray:menuItems radius:radius];
    menu.position = ccp(100, 50);
    [self addChild:menu];
