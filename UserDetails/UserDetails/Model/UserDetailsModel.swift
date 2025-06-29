//
//  UserDetailsModel.swift
//  UserDetails
//
//  Created by Dipanjan sarker on 29/06/25.
//

import Foundation



struct UserDetailsModel: Identifiable, Codable {
    var id = UUID()
    var userName: String
    var fullName: String
    var age : Int
    
}


class UserDetails: ObservableObject {
   @Published var users: [UserDetailsModel] = [UserDetailsModel(userName: "Apple", fullName: "Arun Roy", age: 45),UserDetailsModel(userName: "Android", fullName: "Karan Ahuja", age: 30),UserDetailsModel(userName: "iPhone", fullName: "Arijit Kapoor", age: 40)]
}
