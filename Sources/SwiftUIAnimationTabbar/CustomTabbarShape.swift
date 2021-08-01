//
//  CustomTabbarShape.swift
//  AnimationTabbar
//
//  Created by 吕博 on 2021/8/1.
//

import Foundation
import SwiftUI

// Curve ...
@available(iOS 14.0, *)
struct CustomTabShape: Shape {
    
    var xAxis: CGFloat
    var deepY: CGFloat = 35
    var deepX: CGFloat = 25
    
    var animatableData: CGFloat {
        get { return xAxis }
        set { xAxis = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        
        return Path { path in
        
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            let center = xAxis
            
            path.move(to: CGPoint(x: center - 50, y: 0))
            
            let to1 = CGPoint(x: center, y: deepY)
            let control1 = CGPoint(x: center - deepX, y: 0)
            let control2 = CGPoint(x: center - deepX, y: deepY)
            
            let to2 = CGPoint(x: center + 50, y: 0)
            let control3 = CGPoint(x: center + deepX, y: deepY)
            let control4 = CGPoint(x: center + deepX, y: 0)
            
            print("to1: \(to1) co1: \(control1) co2: \(control2)")
            print("to2: \(to2) co3: \(control3) co4: \(control4)")
            
            path.addCurve(to: to1, control1: control1, control2: control2)
            path.addCurve(to: to2, control1: control3, control2: control4)
        }
    }
}
