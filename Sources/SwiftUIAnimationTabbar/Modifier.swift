//
//  Modifier.swift
//  AnimationTabbar
//
//  Created by 吕博 on 2021/8/1.
//

import SwiftUI

// hide modifier
@available(iOS 14.0, *)
public struct hideTabbar: ViewModifier {
    
    var hide: Bool
    
    public func body(content: Content) -> some View {
        content
            .offset(y: hide ? (UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0) + 100 : 0)
            .animation(.easeInOut)
    }
}

@available(iOS 14.0, *)
extension SwiftUIAnimationTabbar {
    
    /// 隐藏tabbar
    /// - Parameter hide: true隐藏 / false显示
    /// - Returns: self view
    public func hide(with hide: Bool) -> some View {
        self.modifier(hideTabbar(hide: hide))
    }
}


