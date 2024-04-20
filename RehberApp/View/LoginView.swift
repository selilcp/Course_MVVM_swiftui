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
    @State private var networkError:NetworkError? = nil
    
    let viewModel: LoginViewModel
    
    init(service: LoginService) {
        self.viewModel = LoginViewModel( service: service)
    }
    
    var body: some View {
        HStack{
            Spacer(minLength: 30)
            VStack(alignment:.center ,spacing: 30){
                TextField( "User Name",
                           text: $userInput)
                .padding(EdgeInsets(top: 15,
                                    leading: 20,
                                    bottom: 15,
                                    trailing: 20) )
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray, lineWidth: 1)
                    
                )
                
                Button("Login") {
                    fetchDetails()
                }
                .foregroundColor(Color.black)
                .frame(width:120, height: 40)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .strokeBorder(Color.gray, lineWidth: 1)
                        .background(RoundedRectangle(cornerRadius: 5).fill(Color.green.opacity(0.7))
                    )
                )
                .fullScreenCover(isPresented: $isCourseListPresented, content: {
                    createCourseListView(intrestedTopics: viewModel.getIntrestedList(),
                                         previouslySelectedTopics: viewModel.getPreviouslySelectedList())
                })
                
            }
            Spacer(minLength: 30)
        }
        .alert(item: $networkError) { error in
            Alert(title: Text("Error"),
                  message: Text(error.message),
                  dismissButton: .default(Text("Ok") ))
        }
    }
    
    func fetchDetails(){
        viewModel.fetchDetails(userName: userInput,
                               response: { error in
            if error == nil{
                isCourseListPresented = true
            }else{
                self.networkError = error
            }
        })
    }
    
    func createCourseListView(intrestedTopics:[String],
                          previouslySelectedTopics:[String]) -> CourseListView{
        let courseListService = DefaultCourseListService(userFavCategories: intrestedTopics,
                                                         alreadySelectedCategories: previouslySelectedTopics)
        return CourseListView(service: courseListService)
    }
}

#Preview {
    LoginView(service: DefaultLoginService())
}
