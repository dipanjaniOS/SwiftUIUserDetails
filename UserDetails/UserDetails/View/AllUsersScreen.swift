//
//  AllUsersScreen.swift
//  UserDetails
//
//  Created by Dipanjan sarker on 29/06/25.
//

import SwiftUI

struct AllUsersScreen: View {
    @ObservedObject var usersDetails: UserDetails
    @State private var isGridView: Bool = false

    enum SortOrder: String, CaseIterable, Identifiable {
        case none = "None"
        case ageAscending = "Ascending"
        case ageDescending = "Descending"

        var id: String { self.rawValue }
    }

    var body: some View {
        //Text(String(describing: usersDetails.users.count))
        ZStack {
            Image("Background")
                .resizable()
                .ignoresSafeArea()
            VStack {
                HStack {
                    Picker("View Mode", selection: $isGridView) {
                        Text("List").tag(false)
                        Text("Grid").tag(true)
                    }
                    .pickerStyle(.segmented)
                    .padding(.leading)
                    
                }
                .padding(.bottom, 10)
                
                if isGridView {
                    GridView(userDetails: usersDetails)
                } else {
                    ListView(userDetails: usersDetails)
                }
            }
            .navigationTitle("Users")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    //AllUsersScreen()
}
