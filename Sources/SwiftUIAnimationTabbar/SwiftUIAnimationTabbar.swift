//
//  SwiftUIAnimationTabbar.swift
//  AnimationTabbar
//
//  Created by 吕博 on 2021/8/1.
//

import SwiftUI

/// 动画Tabbar
/// ```
/// * 初始化内容
///   - tabbarItem  : AnimationTabbarItem数组
///   - selectedtab : 选中的tabbar item，调用view类创建@State
/// * 修饰符
///   - hide  :  true 隐藏 / false 显示
/// ````
@available(iOS 14.0, *)
public struct SwiftUIAnimationTabbar: View {
    
    // Input Arguments
    var tabbarItem: [AnimationTabbarItem]
    
    // selected tab bar item name of String
    @Binding var selectedtab: String
    @State var xAxis: CGFloat = 0
    @Namespace var animation
    
    public init(tabbarItem: [AnimationTabbarItem], selected: Binding<String>) {
        self.tabbarItem = tabbarItem
        self._selectedtab = selected
    }
    
    public var body: some View {
        HStack(spacing: 0) {
            
            ForEach(tabbarItem, id: \.self) { item in
                
                GeometryReader { reader in
                    Button(action: {
                        withAnimation(.spring()) {
                            selectedtab = item.title
                            xAxis = reader.frame(in: .global).minX
                            print("xAxis: \(xAxis)")
                            print("geometry frame: \(reader.frame(in: .global))")
                        }
                    }, label: {
                        
                        Image(systemName: item.imageDefault)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .foregroundColor(selectedtab == item.title ? item.focusColor : item.color)
                            .padding(selectedtab == item.title ? 15 : 0)
                            .background(Color.white.opacity(selectedtab == item.title ? 1 : 0) .clipShape(Circle()))
                            .matchedGeometryEffect(id: item.title, in: animation)
                            .offset(x: selectedtab == item.title ? (reader.frame(in: .global).minX - reader.frame(in: .global).midX) : 0, y: selectedtab == item.title ? -50 : 0)
                        
                    })
                    .onAppear(perform: {
                        if item == tabbarItem.first {
                            xAxis = reader.frame(in: .global).minX
                        }
                    })
                }
                .frame(width: 25, height: 30)
                
                if item != tabbarItem.last{Spacer(minLength: 0)}
            }
        }
        .padding(.horizontal, 30)
        .padding(.vertical)
        .background(Color.white.clipShape(CustomTabShape(xAxis: xAxis)).cornerRadius(12))
        .padding(.horizontal)
        // Bottom Edge ...
        .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
    }
}
