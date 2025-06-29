//
//  UserDetailsScreen.swift
//  UserDetails
//
//  Created by Dipanjan sarker on 30/06/25.
//

import SwiftUI

struct UserDetailsScreen: View {
    let user: UserDetailsModel
    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                .ignoresSafeArea()
            VStack(alignment: .center, spacing: 20) {
                Spacer()

                Text(" \(user.userName)")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(Color.green)
                    .cornerRadius(10)
                Text(" \(user.fullName)")
                    .font(.title)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(Color.green)
                    .cornerRadius(10)
                Text("Age: \(user.age)")
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .frame(maxWidth: 100, alignment: .center)
                    .background(Color.green)
                    .cornerRadius(10)

                Spacer()
            }
            .padding()
            .navigationTitle("User Details")
            .navigationBarTitleDisplayMode(.inline)

        }
    }
}

#Preview {
    UserDetailsScreen(user: UserDetailsModel(userName: "Test", fullName: "Test", age: 20))
}
