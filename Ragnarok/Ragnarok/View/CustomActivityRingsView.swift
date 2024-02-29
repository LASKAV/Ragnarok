
import SwiftUI

struct CustomActivityRingsView: View {
    
    var BG: String
    var WHeight :CGFloat
    var completionRate: Double
    var ringThickness: CGFloat
    var colorGradient: Gradient
    var colorGradientForRing: Gradient
    
    
    private var rotationDegree: Angle {
        .degrees(180)
    }
    
    private var endAngle: Angle {
        .degrees(completionRate * 360 + 180)
    }
    
    private var strokeStryle: StrokeStyle {
        StrokeStyle(lineWidth: ringThickness, lineCap: .round)
    }
    
    private var gradientEffect: AngularGradient {
        AngularGradient(gradient: colorGradient, center: .center, startAngle: rotationDegree, endAngle: endAngle)
    }
    
    private var gradientEndColor: Color {
        colorGradient.stops.indices.contains(1)  ? colorGradient.stops[1].color : Color.clear
    }
    
    private var circleShadow: Color {
        .black.opacity(0.4)
    }
    
    private var overlayPosition: (_ width: CGFloat, _ height: CGFloat) -> CGPoint {
        return { width, height in CGPoint(x: width / 2, y: height / 2) }
    }
    
    private var overlayOffset: (_ width: CGFloat, _ height: CGFloat) -> CGFloat {
        return { width, height in min(width, height / 2) }
    }
    
    private var overlayRotation: Angle {
        .degrees(completionRate * 360 - 90)
    }
    
    private var clippedCircleRotation: Angle {
        .degrees(-90 + completionRate * 360)
    }
    
    @State private var scale = 0.5
    
    var body: some View {
        ZStack {
            
                        
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 48, lineCap: .round, lineJoin: .round))
                .frame(width: WHeight + 50, height: WHeight)
            
            Circle().rotation(rotationDegree)
                .trim(from: 0, to: CGFloat(completionRate / 30))
                .stroke(gradientEffect, style:  strokeStryle)
                .animation(
                    Animation.interpolatingSpring(stiffness: 100, damping: 100).speed(1),
                    value: completionRate)
                .frame(width: WHeight + 50, height: WHeight)
            
            Image("FrameRing")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: WHeight + 50, height: WHeight + 50)
                .cornerRadius(10)
            
        }
        
    }
    
        var overlayCircle : some View {
            GeometryReader { geo in
                Circle().fill(colorGradientForRing)
                    .frame(width: ringThickness, height: ringThickness)
                    .position(overlayPosition(geo.size.width,geo.size.height))
                    .offset(x: overlayOffset(geo.size.width,geo.size.height))
                    .rotationEffect(overlayRotation)
                    .shadow(color: circleShadow, radius: ringThickness / 5)
            }
            .clipShape(
                Circle().rotation(clippedCircleRotation).trim(from: 0, to: 0.1)
                    .stroke(style: strokeStryle)
                )
        }
}

#Preview {
    CustomActivityRingsView(
        BG: "LineColorIce",
        // size for Ring
        WHeight: 300,
        completionRate: 1.5,
        // size activiti
        ringThickness: 30,
        // color for activiti
        colorGradient: Gradient(colors: [.white, .white]),
        // color for main Ring
        colorGradientForRing:
            Gradient(colors:[
                .white.opacity(25),
                .white.opacity(25)]))
}

