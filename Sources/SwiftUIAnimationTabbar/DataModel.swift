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
/// - unfoucsColor  : 非焦点颜色 默认灰色
/// - focusColor    : 焦点颜色 默认蓝色
/// - focusbkColor  : 焦点时背景颜色 默认白色
/// ```
public struct AnimationTabbarItem: Identifiable, Hashable {
    public var id = UUID()
    public var title: String
    public var imageDefault: String
    public var imageFocus: String
    public var unfoucsColor: Color = Color.gray
    public var focusColor: Color = Color.blue
    public var focusbkColor: Color = Color.white
    
    public init(
        title: String,
        imageDefault: String,
        imageFocus: String,
        unfoucsColor: Color = Color.gray,
        focusColor: Color = Color.blue,
        focusbkColor: Color = Color.white) {
        self.title = title
        self.imageDefault = imageDefault
        self.imageFocus = imageFocus
        self.unfoucsColor = unfoucsColor
        self.focusColor = focusColor
        self.focusbkColor = focusbkColor
    }
}

