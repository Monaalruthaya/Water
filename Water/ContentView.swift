import SwiftUI

struct Water: View {
    @State private var bodyWeight: String = ""
    @State private var calculatedWaterIntake: Double? = nil  // Store calculated water intake for use in another class
    //----------------
    
    //-------------------
    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
                Spacer()
                
                // Water drop image
                Image("water_drop")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .foregroundColor(Color.blue) // Change the color of the water drop if it's a symbol
                    .padding(.horizontal, 32)
                
                // Title bold
                Text("Hydrate")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal, 32)
                
                // Description gray
                Text("Start with Hydrate to record and track your water intake daily based on your needs and stay hydrated")
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 32)
                    .padding(.top, 8)
                
                // TextField for body weight
                HStack {
                    Text("Body weight (kg)")
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    TextField("Value", text: $bodyWeight)
                        .multilineTextAlignment(.center)
                        .keyboardType(.decimalPad)
                    
                    // Clear button
                    if !bodyWeight.isEmpty {
                        Button(action: {
                            bodyWeight = ""
                            calculatedWaterIntake = nil  // Clear the calculated result
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal, 32)
                .padding(.top, 24)
                
                
                
                Spacer()
                
                // Next button with custom color
                //            Button(action: {
                //                // Action for Next button
                //                print("Next button pressed")
                //            }) {
                //
                //                Text("Next")
                //                    .font(.headline)
                //                    .frame(maxWidth: .infinity)
                //                    .padding()
                //                    .background(Color(hex: "#32ADE6")) // Using custom hex color
                //                    .foregroundColor(.white)
                //                    .cornerRadius(10)
                //            }
                //            .padding(.horizontal, 32)
                //            .padding(.bottom, 40)
                
                
                NavigationLink {
                    Notification()
                } label: {
                    Text("Next")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hex: "#32ADE6")) // Using custom hex color
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    
                        .padding(.horizontal, 32)
                        .padding(.bottom, 40)
                }
                
            }

        }
    }
    
    // Function to calculate water intake
    func calculateWaterIntake() {
        if let weight = Double(bodyWeight) {
            calculatedWaterIntake = weight * 0.03
            saveWaterIntake(value: calculatedWaterIntake)  // Save the value for later use
        }
    }
    
    // Function to save the calculated water intake (for use in another class)
    func saveWaterIntake(value: Double?) {
        if let waterIntake = value {
            print("Saved water intake: \(waterIntake) liters per day")
            
        }
    }
}

extension Color {
    // Custom initializer for hex color
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8 * 4) * 17, (int >> 4) * 17, int * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, (int >> 8) & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, (int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

struct water_Previews: PreviewProvider {
    static var previews: some View {
        Water()
    }
}

