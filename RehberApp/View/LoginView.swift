//
//  LoginView.swift
//  RehberApp
//
//  Created by Selil on 20/04/2024.
//

import SwiftUI

struct LoginView: View {
    
    @State private var userInput = ""
    @State private var isCourseListPresented = false
    
    let viewModel: LoginViewModel
    
    init(service: LoginService) {
        self.viewModel = LoginViewModel( service: service)
    }
    
    var body: some View {
        HStack{
            Spacer(minLength: 30)
            VStack(alignment:.center ){
                TextField( "User Name",
                           text: $userInput)
                .padding(EdgeInsets(top: 15,
                                    leading: 20,
                                    bottom: 15,
                                    trailing: 20) )
                .border(.gray, width: 0.5)
                Button("Submit") {
                    
                }
                .frame(width:120, height: 40)
                .border(.gray, width: 0.5)
                
            }
            Spacer(minLength: 30)
        }
    }
}

#Preview {
    LoginView(service: DefaultLoginService())
}
