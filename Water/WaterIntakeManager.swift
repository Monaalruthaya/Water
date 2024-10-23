
import SwiftUI

// Simulate a function from another class that saves and returns water intake.
class WaterIntakeManager {
    func saveWaterIntake() -> Double {
        // Replace with actual logic to get water intake from storage or database.
        return 0.0 // Example water intake value
    }
}

struct WaterIntakeView: View {
    // State variables
    @State private var waterIntake: Double = 0.0
    private let dailyGoal: Double = 2.7
    private let intakeManager = WaterIntakeManager() // Simulated function

    var body: some View {
        
        VStack {
            // Title Text
            Text("Today's Water Intake")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.trailing)
                
            
            // Water intake progress text
            Text(progressText())
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top, 10)
            
            // Circular progress view
            ZStack {
                // Background Circle
                Circle()
                    .stroke(Color.gray.opacity(0.2), lineWidth: 20)
                    .frame(width: 300, height: 300)
                
                // Progress Circle
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(waterIntake / dailyGoal, 1.0)))
                    .stroke(Color.cyan, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                    .rotationEffect(Angle(degrees: -90))
                    .frame(width: 300, height: 300)
                    .animation(.linear, value: waterIntake)
                
                // Dynamic Image Based on Water Intake
                getImageForIntake()
                    .font(.system(size: 60))
                    .foregroundColor(.yellow)
            }
            .padding(.vertical, 40)
            
            // Current Water Intake
            Text(String(format: "%.1f L", waterIntake))
                .font(.title)
                .fontWeight(.bold)
            
            // Increment / Decrement Buttons
            HStack {
                Button(action: {
                    decreaseWaterIntake()
                }) {
                    Image(systemName: "minus")
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
                
                Button(action: {
                    increaseWaterIntake()
                }) {
                    Image(systemName: "plus")
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
            }
        }
        .onAppear {
            // Call the saveWaterIntake function from the external class
            waterIntake = intakeManager.saveWaterIntake()
        }
    }
    
    // Helper function to format the progress text based on the current water intake
    private func progressText() -> String {
        return String(format: "%.1f liter / %.1f liter", waterIntake, dailyGoal)
    }
    
    // Function to return an image based on the water intake level
    @ViewBuilder
    private func getImageForIntake() -> some View {
        if waterIntake == 0{
            Image(systemName: "zzz")
        } else if waterIntake < 1.0 {
            Image(systemName: "tortoise.fill")
        } else if waterIntake < 2.7 {
            Image(systemName: "hare.fill")
        } else {
            Image(systemName: "hands.clap.fill")
        }
    }
    
    // Function to decrease water intake
    private func decreaseWaterIntake() {
        if waterIntake > 0 {
            waterIntake -= 0.1
        }
    }
    
    // Function to increase water intake
    private func increaseWaterIntake() {
        if waterIntake < dailyGoal {
            waterIntake += 0.1
        }
    }
}

struct WaterIntakeView_Previews: PreviewProvider {
    static var previews: some View {
        WaterIntakeView()
    }
}
