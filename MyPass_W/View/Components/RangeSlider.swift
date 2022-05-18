//
//  RangeSlider.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 18/05/2022.
//

import SwiftUI

struct RangeSlider: View {
    
    @Binding var value: Double
    var range: ClosedRange<Double>
    var onDecrease: (() -> Void)
    var onIncrease: (() -> Void)
    
    var body: some View {
        VStack {
            Text("\(Int(value)) characters")
                .font(.system(size: 26))
            HStack {
                Button {
                    onDecrease()
                } label: {
                    Image(systemName: "minus")
                }
                Slider(value: $value, in: range)
                Button {
                    onIncrease()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }.padding(.horizontal, 16)
    }
}

struct RangeSlider_Previews: PreviewProvider {
    static var previews: some View {
        RangeSlider(value: .constant(3), range: 0...10) {
            //
        } onIncrease: {
            //
        }

    }
}
