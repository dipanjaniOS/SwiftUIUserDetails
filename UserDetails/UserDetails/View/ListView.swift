//
//  ListView.swift
//  UserDetails
//
//  Created by Dipanjan sarker on 30/06/25.
//

import SwiftUI

struct ListView: View {
   
    @ObservedObject var userDetails: UserDetails
    var body: some View {
            List {
                if userDetails.users.isEmpty {
                    Text("No users found matching your criteria.")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    ForEach(userDetails.users) { user in
                        NavigationLink(destination: UserDetailsScreen(user: user)) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(user.userName)
                                        .font(.headline)
                                    Text(user.fullName)
                                        .font(.headline)
                                    Text("Age: \(user.age)")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                            }
                            .padding(.vertical, 5)
                        }
                    }
                }
            }
        
    }
}

#Preview {
    //ListView(userDetails: UserDetails())
}
