//
//  PickerField.swift
//  TinderClone
//
//  Created by Genki on 9/17/24.
//

import SwiftUI

struct PickerField: View {
    @Binding var selection: Int
    let title: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(title)
                    .foregroundStyle(Color(.darkGray))
                    .fontWeight(.semibold)
                    .font(.footnote)
                Spacer()
                Picker(selection: $selection) {
                    ForEach(18..<100) { number in
                        Text("\(number)")
                            .tag(number)
                    }
                } label: {
                    Text(title)
                }
                .tint(.black)
            }
            Divider()
        }
    }
}

#Preview {
    PickerField(selection: .constant(18), title: "title")
}
