//
//  AccessibilityTest.swift
//  Redux
//
//  Created by hhcszgd on 2024/7/28.
//

import SwiftUI

struct AccessibilityTest: View {
    var body: some View {
        DrawView()
            .ignoresSafeArea()
            .background(Color.green)
            .frame(width: UIScreen.main.bounds.width - 88, height: 222)

//            .accessibilityElement(children: .contain)
        
        /*
        if #available(iOS 15.0, *) {
            DrawView()
                .frame(width: UIScreen.main.bounds.width, height: 222)
                .background(Color.green)
                .accessibilityChildren {
                    GeometryReader { geometryProxy in
                        let arr = targetArr(size: geometryProxy.size)
                        ForEach (arr) { i in
                            Text("xxx")
                                .frame(width: 10, height: geometryProxy.size.height)
                                
                            
                        }
                    }
                    
                }
        } else {
            // Fallback on earlier versions
        }
        */
    }


}
struct AccessibilityTestModel: Identifiable {
    let id = UUID()
    let value: CGFloat
    
    
    static func targetArr(size: CGSize) -> [AccessibilityTestModel] {
        var arr = [AccessibilityTestModel]()
        for i in stride(from: 0, through: size.width
                        , by: 44) {
            arr.append(AccessibilityTestModel(value: i))
        }
        return arr
    }
}

#Preview {
    AccessibilityTest()
}



struct DrawView: View {
    var body: some View {
        GeometryReader { geometryProxy in
            let arr = AccessibilityTestModel.targetArr(size: geometryProxy.size)
            ForEach (arr) { i in
                Path { path in
                        debugPrint("ssss: \(i)")
                        debugPrint("xxxx: \(geometryProxy.size.height)")
                    path.move(to: CGPoint(x: i.value , y: 0))
                    path.addLine(to: CGPoint(x: i.value , y: geometryProxy.size.height))
                }
                .stroke(Color.green, lineWidth: 12)
                .accessibilityLabel("hello world: \(i.value)")
                
                
                Path { path in
                        debugPrint("ssss: \(i)")
                        debugPrint("xxxx: \(geometryProxy.size.height)")
                    path.move(to: CGPoint(x: i.value , y: 0))
                    path.addLine(to: CGPoint(x: i.value , y: geometryProxy.size.height))
                }
                .stroke(Color.black, lineWidth: 1)
//                .accessibilityDirectTouch()
//                .accessibility
//                .accessibilityFrameInContainerSpace
            }
            
            
        }
    }
}

struct DrawView2: View {
    var body: some View {
        GeometryReader { geometryProxy in
            Path { path in
                for i in stride(from: 0, through: geometryProxy.size.width
                                , by: 44) {
                    debugPrint("ssss: \(i)")
                    debugPrint("xxxx: \(geometryProxy.size.height)")
                    path.move(to: CGPoint(x: i , y: 0))
                    path.addLine(to: CGPoint(x: i , y: geometryProxy.size.height))
                }
            }
            .stroke(Color.black, lineWidth: 2)
            .accessibilityLabel("hello world")
            
        }
    }
}
