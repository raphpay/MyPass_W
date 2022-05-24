//
//  SwiftUISlider.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 24/05/2022.
//

import Foundation
import SwiftUI

struct SwiftUISlider: UIViewRepresentable {
    final class Coordinator: NSObject {
        // The class property value is a binding: It’s a reference to the SwiftUISlider
        // value, which receives a reference to a @State variable value in ContentView.
        var value: Binding<Double>

        // Create the binding when you initialize the Coordinator
        init(value: Binding<Double>) {
            self.value = value
        }

        // Create a valueChanged(_:) action
        @objc func valueChanged(_ sender: UISlider) {
            self.value.wrappedValue = Double(sender.value)
        }
    }
    
    var thumbColor: UIColor = .white
    var minTrackColor: UIColor?
    var maxTrackColor: UIColor?
    var minValue: Float = 1
    var maxValue: Float

    @Binding var value: Double

    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.thumbTintColor = thumbColor
        slider.minimumTrackTintColor = minTrackColor
        slider.maximumTrackTintColor = maxTrackColor
        slider.value = Float(value)
        slider.minimumValue = minValue
        slider.maximumValue = maxValue
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged(_:)),
            for: .valueChanged
        )
        
        return slider
    }

    func updateUIView(_ uiView: UISlider, context: Context) {
        // Coordinating data between UIView and SwiftUI view
        uiView.value = Float(self.value)
    }

      func makeCoordinator() -> SwiftUISlider.Coordinator {
          Coordinator(value: $value)
      }
}

#if DEBUG
struct SwiftUISlider_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUISlider(
            thumbColor: .white,
            minTrackColor: .blue,
            maxTrackColor: .green,
            maxValue: 10,
            value: .constant(0.5)
        )
    }
}
#endif
