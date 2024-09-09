//
//  ListView.swift
//  TinderClone
//
//  Created by Genki on 9/5/24.
//

import SwiftUI

struct ListView: View {
    @ObservedObject private var viewModel = ListViewModel()
    var body: some View {
        Group {
            if viewModel.users.count > 0 {
                VStack(spacing: 0) {
                    // Cards
                    cards
                    // Actions
                    actions
                }
                .background(.black, in: RoundedRectangle(cornerRadius: 15))
                .padding(.horizontal, 6)
            } else {
                ProgressView()
                    .padding()
                    .tint(Color.white)
                    .background(Color.gray)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                    .scaleEffect(1.5)
            }
        }
    }
}

#Preview {
    LoginView(authViewModel: AuthViewModel())
}

extension ListView {
    private var cards: some View {
        ZStack {
            ForEach(viewModel.users.reversed()) { user in
                CardView(user: user) { isRedo in
                    viewModel.adjustIndex(isRedo: isRedo)
                }
            }
        }
    }
    private var actions: some View {
        HStack(spacing: 68) {
            ForEach(Action.allCases, id: \.self) { type in
                type.createActionButton(viewModel: viewModel)
            }
        }
        .foregroundColor(.white)
        .frame(height: 100)
    }
}
