//
//  ShowCaseList.swift
//  Redux
//
//  Created by hhcszgd on 2023/12/22.
//

import SwiftUI

struct TestRingProgressView: View {
    

    var body: some View {
        return VStack {
            VStack{
                ProgressView(value: 80, total: 100)
                    .progressViewStyle(.linear)
                Spacer(minLength: 100)
                ProgressView(value: 80, total: 100)
                    .progressViewStyle(PinkBorderedProgressViewStyle())
                Spacer(minLength: 100)
                RingProgressView(viewModel: RingProgressView.ViewModel(value: 0.4))
                GradientRingView()
                GradientCircleProgressView(progress: 0.5)
            }
        }
        .padding()
    }
}

#Preview {
    ShowCaseList()
}

struct PinkBorderedProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .padding(4)
            .border(.pink, width: 3)
            .cornerRadius(4)
    }
}

 
struct RingProgressView: View {
    let viewModel: ViewModel
    var body: some View {
        GeometryReader { geometry in
            let dim = min(geometry.size.width, geometry.size.height)
            ZStack {
                Circle()
                    .stroke(lineWidth: dim * 0.1)
                    .foregroundColor(.gray)
 
                Circle()
                    .trim(from: 0, to: viewModel.value)

                    .stroke(style: StrokeStyle(lineWidth: dim * 0.1, lineCap: .round))
//                    .fill(
//                        AngularGradient(
//                            gradient: Gradient(
//                                colors: [.red, .green]
//                            ),
//                            center: .center,
//                            startAngle: .degrees(0.1),
//                            endAngle: .degrees(0.5)
//                        )
//                    )
                    .foregroundColor(.blue)
//                    .foregroundColor()

                    .rotationEffect(Angle(degrees: -90))
                    .animation(.linear)
                    
                    .overlay(
                        Text("75%")
                            .font(.caption)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    )
            }
        }
    }
}
 
extension RingProgressView {
    struct ViewModel {
        let value: Double
//        let total: Double
    }
}




struct GradientRingView: View {
    var body: some View {
        RingView(startAngle: .degrees(0), endAngle: .degrees(260), innerRadius: 0.7, outerRadius: 0.8)
            .fill(
                AngularGradient(
                    gradient: Gradient(colors: [.blue, .green, .red, .blue]),
                    center: .center,
                    startAngle: .degrees(0),
                    endAngle: .degrees(360)
                )
            )
            .rotationEffect(Angle(degrees: -90))
            .frame(width: 100, height: 100)
    }
    
    struct RingView: Shape {
        let startAngle: Angle
        let endAngle: Angle
        let innerRadius: CGFloat
        let outerRadius: CGFloat
        
        func path(in rect: CGRect) -> Path {
            var path = Path()
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                        radius: outerRadius * rect.width / 2,
                        startAngle: startAngle,
                        endAngle: endAngle,
                        clockwise: false)
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                        radius: innerRadius * rect.width / 2,
                        startAngle: endAngle,
                        endAngle: startAngle,
                        clockwise: true)
//            path.stroke(style: StrokeStyle(lineWidth: 0.1, lineCap: .round))
            return path
        }
    }
}
 
struct GradientCircleProgressView: View {
    var progress: CGFloat
    var gradient: Gradient = Gradient(colors: [.blue, .green, .purple, .pink, .yellow, .red,.blue])
 
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20)
                .foregroundColor(.gray)
 
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    AngularGradient(gradient: gradient, center: .center, angle: .degrees(0)),
                    style: StrokeStyle(lineWidth: 20, lineCap: .round)
                )
                .rotationEffect(.degrees(-90))
                .animation(.linear, value: progress)
        }
    }
}
