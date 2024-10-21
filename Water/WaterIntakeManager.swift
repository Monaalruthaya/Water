
import SwiftUI

struct WaterIntakeView: View {
    @Binding var waterIntake: Double?  // Bind water intake from previous screens
    private let dailyGoal: Double = 2.7

    var body: some View {
        VStack {
            Text("Today's Water Intake")
                .font(.body)
                .foregroundColor(Color.gray)
            
            Text(progressText())
                .font(.title2)
                .fontWeight(.bold)

            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.2), lineWidth: 20)
                    .frame(width: 300, height: 300)
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(min((waterIntake ?? 0) / dailyGoal, 1.0)))
                    .stroke(Color.cyan, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                    .rotationEffect(Angle(degrees: -90))
                    .frame(width: 300, height: 300)
                    .animation(.linear, value: waterIntake)
                
                getImageForIntake()
                    .font(.system(size: 60))
                    .foregroundColor(.yellow)
            }
            .padding(.vertical, 40)
            
            Text(String(format: "%.1f L", waterIntake ?? 0))
                .font(.title)
                .fontWeight(.bold)
        }
        .onAppear {
            // Optionally, set a default or do some processing when the view appears
        }
    }
    
    private func progressText() -> String {
        return String(format: "%.1f liter / %.1f liter", waterIntake ?? 0, dailyGoal)
    }

    @ViewBuilder
    private func getImageForIntake() -> some View {
        if (waterIntake ?? 0) == 0 {
            Image(systemName: "zzz")
        } else if (waterIntake ?? 0) < 1.0 {
            Image(systemName: "tortoise.fill")
        } else if (waterIntake ?? 0) < 2.7 {
            Image(systemName: "hare.fill")
        } else {
            Image(systemName: "hands.clap.fill")
        }
    }
}



