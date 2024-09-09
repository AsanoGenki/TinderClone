//
//  AuthViewModel.swift
//  TinderClone
//
//  Created by Genki on 9/8/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    init() {
        self.userSession = Auth.auth().currentUser
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
    @MainActor
    func createAccount(email: String, password: String, name: String, age: Int) async {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let newUser = User(id: result.user.uid, name: name, email: email, age: age)
            await uploadUserData(withUser: newUser)
            print("アカウント登録成功: \(String(describing: result.user.email))")
        } catch {
            print("アカウント登録失敗: \(error.localizedDescription)")
        }
    }
    // Delete Account
    
    // Upload User Data
    private func uploadUserData(withUser user: User) async {
        do {
            let userData = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(userData)
            print("データ保存成功")
        } catch {
            print("データ保存失敗: \(error.localizedDescription)")
        }
    }
}
