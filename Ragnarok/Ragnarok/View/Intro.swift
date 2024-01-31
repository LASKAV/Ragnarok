import SwiftUI

struct Intro: View {
    
    @State private var animate = false
    
    var body: some View {
        
        Image("Cloud")
            .scaleEffect(animate ? 10 : 1)
            .opacity(animate ? 0 : 1)
            .onAppear {
                animate.toggle()
            }
            .animation(Animation.linear.speed(0.2), value: animate)
    }
    
}

#Preview {
    Intro()
}
