//
//  AuthViewModel.swift
//  TinderClone
//
//  Created by Genki on 9/8/24.
//

import Foundation
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    init() {
        userSession = Auth.auth().currentUser
        // Test for logout
//        logout()
    }
    // Login
    @MainActor
    func login(email: String, password: String) async {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            print("ログイン成功: \(String(describing: result.user.email))")
            self.userSession = result.user
        } catch {
            print("ログイン失敗: \(error.localizedDescription)")
        }
    }
    // Logout
    func logout() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
        } catch {
            print("ログアウト失敗: \(error.localizedDescription)")
        }
    }
    // Create Account
    func createAccount(email: String, password: String) async {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("アカウント登録成功: \(String(describing: result.user.email))")
            self.userSession = result.user
        } catch {
            print("アカウント登録失敗: \(error.localizedDescription)")
        }
    }
    // Delete Account
}
