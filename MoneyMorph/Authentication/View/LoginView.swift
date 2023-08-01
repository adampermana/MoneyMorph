import SwiftUI
import Firebase

struct LoginView: View {
    @State private var emailID: String = ""
    @State private var password: String = ""
    @State private var isForgotPasswordViewPresented = false
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @StateObject private var authManager = AuthManager()

    let amberYellow = Color("AmberYellow")

    var body: some View {
        NavigationView {
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)

                VStack(spacing: 10) {
                    VStack(alignment: .center, spacing: 5) {
                        Image("MoneyMorphPNG")
                            .padding(10)

                        Text("Sign in to Money Morph")
                            .font(Font.custom("Poppins-Bold", size: 29))
                            .foregroundColor(amberYellow)

                    }
                    .padding(10)

                    VStack(alignment: .leading, spacing: 5) {
                        Text("Email Address")
                            .font(Font.custom("Poppins-Regular", size: 14))
                            .offset(y: 8)

                        ComponentsTextField(text: $emailID,
                                            hint: "Enter your Email",
                                            leadingIcon: Image(systemName: "envelope"))
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .textContentType(.emailAddress)
                            .autocorrectionDisabled()
                            .submitLabel(.next)

                    }

                    VStack(alignment: .leading, spacing: 5) {
                        Text("Password")
                            .font(Font.custom("Poppins-Regular", size: 14))
                            .offset(y: 8)

                        ComponentsTextField(text: $password,
                                            hint: "Enter your Password",
                                            leadingIcon: Image(systemName: "lock"),
                                            isPassword: true)
                            .submitLabel(.next)


                    }
                    .padding(14)

                    HStack(alignment: .lastTextBaseline, spacing: 3) {
                        Spacer()
                        Button(action: {
                            isForgotPasswordViewPresented = true
                        }) {
                            Text("Forgot Password?")
                                .font(Font.custom("Poppins-Regular", size: 17))
                                .foregroundColor(amberYellow)
                                .offset(x: -24)
                        }
                    }
                    .fullScreenCover(isPresented: $isForgotPasswordViewPresented) {
                        ForgotPasswordView()
                    }

                    // Redirect to HomeView when isLoggedIn is true
                    Button(action: {
                        login()
                    }) {
                        Text("Log in")
                            .foregroundColor(.white)
                            .padding(.vertical, 15)
                            .frame(width: 300)
                            .background(RoundedRectangle(cornerRadius: 10).fill(amberYellow))
                            .font(Font.custom("Poppins-Bold", size: 28))
                    }
                    .padding()
                }
                .padding(10)

                VStack {
                    Spacer()
                    SwitchSignUpView()
                        .offset(y: -60)
                }
                .padding(-6)
            }
            .padding(-10)
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea(.all)
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Error saat login"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
        .environmentObject(authManager)
        .fullScreenCover(isPresented: $authManager.isLoggedIn) {
            // Redirect to HomeView when isLoggedIn is true
            HomeView()
        }
    }

    func login() {
        Auth.auth().signIn(withEmail: emailID, password: password) { result, error in
            if let error = error {
                print("Login Error cuy: \(error.localizedDescription)")
                alertMessage = "Login Error Manizz: \(error.localizedDescription)"
                showingAlert = true
            } else {
                print("Done Login Maniszz")
                authManager.isLoggedIn = true // Set isLoggedIn to true on successful login
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
