//
//  SignUpScreen.swift
//  UserDetails
//
//  Created by Dipanjan sarker on 29/06/25.
//

import SwiftUI


struct SignUpScreen: View {
    @State private var username = ""
    @State private var fullname = ""
    @State private var age = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var alertMessage = ""
    @State private var isPresented = false
    @State private var navigationIsActive = false
    @ObservedObject var userDetails: UserDetails
    @FocusState private var focused : TextFieldFocus?
    enum TextFieldFocus : Hashable {
        case username, fullname, password, confirmPassword, age
    }
    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                .ignoresSafeArea()
            VStack {
                TextField(
                    "User name",
                    text: $username
                )
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
                .padding(.top,20)
                .focused($focused, equals: .username)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .onSubmit {
                    focused = .fullname
                }
                
                TextField(
                    "Full Name",
                    text: $fullname
                )
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
                .padding(.top,20)
                .focused($focused, equals: .fullname)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .onSubmit {
                    focused = .age
                }
                
                TextField(
                    "Age",
                    text: $age
                )
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
                .padding(.top,20)
                .focused($focused, equals: .age)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .onSubmit {
                    focused = .password
                }
                .keyboardType(.numberPad)
                
                TextField(
                    "Password",
                    text: $password
                )
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
                .padding(.top,20)
                .focused($focused, equals: .password)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .onSubmit {
                    focused = .confirmPassword
                }
                
                
                TextField(
                    "Confirm Password",
                    text: $confirmPassword
                )
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
                .padding(.top,20)
                .focused($focused, equals: .confirmPassword)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .onSubmit {
                    focused = nil
                }
                
                Button(action: signUpValidation) {
                    Text("Submit")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .shadow(radius: 5)
                }
                .padding(.horizontal)
                .padding(.top,20)
                
                NavigationLink("", destination: AllUsersScreen(usersDetails: userDetails),isActive: $navigationIsActive)
                
            }
            .onAppear{
                focused = .username
            }
        }
        .navigationTitle("Sign UP")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                Spacer()
            }
            ToolbarItem(placement: .keyboard) {
                Button {
                    focused = nil
                } label: {
                    Image(systemName: "keyboard.chevron.compact.down.fill")
                }
            }
        }
        .alert(isPresented: $isPresented) {
            Alert(
                title: Text("SignUp Error !"),
                message: Text(alertMessage),
                dismissButton: .default(Text("OK"))
            )
        }
    }
    
    private func signUpValidation() {
        if username.isEmpty || fullname.isEmpty || password.isEmpty
            || confirmPassword.isEmpty{
            alertMessage = "All fields are madatory"
            isPresented = true
            return
        }
        if username.count < 3 {
            alertMessage = "Username must be at least 3 characters long."
            isPresented = true
            return
        }
        if Int(age) ?? 0 < 1 || Int(age) ?? 0 > 100 {
            alertMessage = "Please enter valid age"
            isPresented = true
            return
        }
        if password != confirmPassword {
            alertMessage = "Passwords do not match."
            isPresented = true
            return
        }
        userDetails.users.append(UserDetailsModel(userName: username, fullName: fullname, age: Int(age) ?? 0))
        navigationIsActive = true
        
    }
        
}

#Preview {
   // SignUpScreen(userDetails: <#UserDetails#>)
}
