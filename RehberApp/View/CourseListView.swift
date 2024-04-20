//
//  CourseListView.swift
//  RehberApp
//
//  Created by Selil on 20/04/2024.
//

import SwiftUI

struct CourseListView: View {
    
    @State private var networkError:NetworkError? = nil
    @State private var courseList:[CourseModel] = []
    @Environment(\.dismiss) var dismiss
    
    @State var viewModel: CourseListViewModel
    
    init(service: CourseListService) {
        _viewModel = State(initialValue: CourseListViewModel(service: service))
    }
    
    var body: some View {
        NavigationView{
            VStack(spacing: 0){
                HStack{
                    Spacer()
                    Button("Logout") {
                        dismiss()
                    }
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 40)
                    .foregroundColor(.black)
                    .font(.headline)
                }
                .background(Color.green.opacity(0.8))
                List {
                    ForEach($viewModel.courseList) { course in
                        let listViewModel = CourseListCellViewModel(course: course.wrappedValue)
                        CourseListCell(viewModel: listViewModel)
                    }
                }
                .onAppear () {
                    fetchCourseList()
                }
                .refreshable(action: {
                    fetchCourseList()
                })
                .alert(item: $networkError) { error in
                    Alert(title: Text("Error"),
                          message: Text(error.message),
                          dismissButton: .default(Text("Ok") ))
                }
            }
        }
    }
    
    func fetchCourseList(){
        viewModel.fetchCourseList(response:{ error in
            if error == nil{
                RunLoop.main.perform {
                    self.courseList = viewModel.courseList
                }
            }else{
                networkError = error
            }
        })
    }
}

#Preview {
    CourseListView(service: DefaultCourseListService(userFavCategories: [], alreadySelectedCategories: []))
}
