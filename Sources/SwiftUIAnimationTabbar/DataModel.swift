//
//  DataModel.swift
//  AnimationTabbar
//
//  Created by 吕博 on 2021/8/1.
//

import Foundation
import SwiftUI

/// Tabbar Item 结构
/// ```
/// - 成员说明
/// - title         : 名称以及tag
/// - imageDefault  : 未获得焦点图片
/// - imageFocus    : 焦点图片
/// - color         : 默认颜色 默认灰色
/// - focusColor    : 焦点颜色 默认蓝色
/// ```
public struct AnimationTabbarItem: Identifiable, Hashable {
    public var id = UUID()
    public var title: String
    public var imageDefault: String
    public var imageFocus: String
    public var color: Color = Color.gray
    public var focusColor: Color = Color.blue
    
    public init(
        title: String,
        imageDefault: String,
        imageFocus: String,
        color: Color = Color.gray,
        focusColor: Color = Color.blue) {
        self.title = title
        self.imageDefault = imageDefault
        self.imageFocus = imageFocus
        self.color = color
        self.focusColor = focusColor
    }
}

