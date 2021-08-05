# SwiftUIAnimationTabbar

Use KavSoft source code : SwiftUI 2.0 Animation Tab bar , I make it to a package

![](https://s17.aconvert.com/convert/p3r68-cdx67/3bzdr-0mh7p.gif)
### Usage:

init some var

```swift
  var item: [AnimationTabbarItem] = [
        
        AnimationTabbarItem(title: "house", imageDefault: "house", imageFocus: "house.fill", focusColor: Color.red),
        AnimationTabbarItem(title: "gift", imageDefault: "gift", imageFocus: "gift.fill", focusColor: Color.red),
        AnimationTabbarItem(title: "bell", imageDefault: "bell", imageFocus: "bell.fill", focusColor: Color.red),
        AnimationTabbarItem(title: "message", imageDefault: "message", imageFocus: "message.fill", focusColor: Color.red)
    ]
```

```swift
@State var hide: Bool = false
@State var selectedtab = "house"
```

'hide' control the tabbar hide or not

'selectedtab' control the tabbar focus item

Then in your view body, add below

```swift
ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            TabView(selection: $selectedtab) {
                Color.purple
                    .ignoresSafeArea(.all, edges: .all)
                    .tag(item[0].title)   
                Color.yellow
                    .ignoresSafeArea(.all, edges: .all)
                    .tag(item[1].title)
                Color.blue
                    .ignoresSafeArea(.all, edges: .all)
                    .tag(item[2].title)
                Color.orange
                    .ignoresSafeArea(.all, edges: .all)
                    .tag(item[3].title)
            }
            
            // Custom tab Bar...
            SwiftUIAnimationTabbar(
                tabbarItem: item,
                selected: $selectedtab)
                .hide(with: hide)
        }
        .ignoresSafeArea(.all, edges: .bottom)
 
```

