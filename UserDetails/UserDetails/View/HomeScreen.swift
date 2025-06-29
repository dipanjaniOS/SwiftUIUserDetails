//
//  HomeScreen.swift
//  UserDetails
//
//  Created by Dipanjan sarker on 29/06/25.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject  var userDetails = UserDetails()
    var body: some View {
        NavigationView {
        ZStack{
            Image("Background")
                .resizable()
                .ignoresSafeArea()
           

            VStack {
                NavigationLink(destination: SignUpScreen(userDetails: userDetails)) {
                    Text("Sign Up")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: 110)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .shadow(radius: 3)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white, lineWidth: 2)
                            )
                }
                .padding(.vertical)
                Divider()
                NavigationLink(destination: AllUsersScreen(usersDetails: userDetails)) {
                    Text("All Users")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: 110)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .shadow(radius: 3)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white, lineWidth: 2)
                            )
                }
            }
            
            }
//        .toolbar{
//            ToolbarItem(placement: .principal) {
//                HStack{
//                    Text("Home")
//                }
//                .font(.largeTitle)
//                
//            }
//        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

#Preview {
    HomeScreen()
}
