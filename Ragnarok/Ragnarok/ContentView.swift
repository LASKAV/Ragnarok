import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
                Text("EASTERN NORWAY")
                    .frame(width: 300, height: 700, alignment: .top)
                    .font(Font.custom("Koulen-Regular", size: 20))
                    .foregroundColor(.white)
                    .kerning(1)
            
            Circle()
                .stroke(.white, lineWidth: 40)
                .frame(width: 380, height: 300)
            
            Image("ragna")
                .resizable()
                .scaledToFit()
                .frame(width: 490, height: 300)
                .clipShape(Circle()
                    .trim(to: 0.50)
                    .stroke(lineWidth: 40))
            
            VStack {
                ZStack {
                    Image("sky")
                        .resizable()
                        .offset(y: 125)
                        .frame(width: 350, height: 200)
                    
                    Text("50.34")
                        .font(Font.custom("Koulen-Regular", size: 45))
                        .shadow(color: .black, radius: 1, x: 0, y: 3)
                        .kerning(1)
                    
                    Text("PENNY")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("Koulen-Regular", size: 20))
                        .foregroundColor(.white)
                        .frame(width: 100, height: 200, alignment: .bottom)
                        .shadow(color: .black, radius: 1, x: 0, y: 2)
                }
            }
        }
        TabView {
            
        }
        .background(
            Rectangle()
                .fill(Color.gray) // Set the background color to green
                .edgesIgnoringSafeArea(.all))
    }
}


#Preview {
    ContentView()
}
