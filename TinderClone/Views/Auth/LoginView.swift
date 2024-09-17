//
//  LoginView.swift
//  TinderClone
//
//  Created by Genki on 9/8/24.
//

import SwiftUI

struct LoginView: View {
    let authViewModel: AuthViewModel
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        NavigationStack {
            VStack {
                // Image
                BrandImage(size: .large)
                // Form
                VStack(spacing: 24) {
                    InputField(text: $email, label: "メールアドレス", placeholder: "入力してください")
                    InputField(text: $password, label: "パスワード", placeholder: "半角英数6文字以上", isSecureField: true)
                }
                // Button
                BasicButton(label: "ログイン", icon: "arrow.right") {
                    Task {
                        await authViewModel.login(email: email, password: password)
                    }
                }
                .padding(.top, 24)
                Spacer()
                // Navigation
                NavigationLink {
                    RegistrationView(authViewModel: authViewModel)
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack {
                        Text("まだアカウントをお持ちでない方")
                        Text("会員登録")
                            .fontWeight(.bold)
                    }
                    .foregroundStyle(Color(.darkGray))
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    LoginView(authViewModel: AuthViewModel())
}
