//
//  RangeSlider.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 18/05/2022.
//

import SwiftUI

struct RangeSlider: View {
    
    // TODO: Simplify this component according to his type
    // TODO: Clean this component
    @Environment(\.locale) var locale: Locale
    var type: ValueType = .characters
    @Binding var value: Double
    var range: ClosedRange<Double>
    var onDecrease: (() -> Void)
    var onIncrease: (() -> Void)
    
    var body: some View {
        VStack {
            Text(type == .characters ? "characters-count \(Int(value))" : "separators-count \(Int(value))", tableName: "Plurals-\(locale.identifier)")
                .font(.custom(Fonts.secularOne.rawValue, size: 26))
                .scaledToFit()
                .minimumScaleFactor(0.7)
            HStack {
                Button {
                    onDecrease()
                } label: {
                    Image(systemName: "minus")
                }
                SwiftUISlider(minTrackColor: .black, maxTrackColor: .gray,
                              minValue: Float(range.lowerBound), maxValue: Float(range.upperBound),
                              value: $value)
                Button {
                    onIncrease()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }.padding(.horizontal, 16)
            .foregroundColor(.white)
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
