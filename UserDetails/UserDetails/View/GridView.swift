//
//  GridView.swift
//  UserDetails
//
//  Created by Dipanjan sarker on 30/06/25.
//

import SwiftUI

struct GridView: View {
    @ObservedObject var userDetails: UserDetails
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                .ignoresSafeArea()
            ScrollView {
                if userDetails.users.isEmpty {
                    Text("No users found matching your criteria.")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(userDetails.users) { user in
                            NavigationLink(destination: UserDetailsScreen(user: user))
                            {
                                VStack(spacing: 8) {
                                    Text(user.userName)
                                        .font(.subheadline)
                                        .fontWeight(.medium)
                                        .multilineTextAlignment(.center)
                                    Text(user.fullName)
                                        .font(.subheadline)
                                        .fontWeight(.medium)
                                        .multilineTextAlignment(.center)
                                    Text("Age: \(user.age)")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.gray)
                                .cornerRadius(15)
                                .shadow(
                                    color: Color.black.opacity(0.1),
                                    radius: 5,
                                    x: 0,
                                    y: 2
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(
                                            Color.gray.opacity(0.2),
                                            lineWidth: 1
                                        )
                                )
                            }
                            .buttonStyle(PlainButtonStyle())  // To remove default button styling
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    GridView(userDetails: UserDetails())
}
