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
            VStack{
                HStack{
                    Spacer()
                    Button("Logout") {
                        dismiss()
                    }
                }
                List {
                    ForEach($viewModel.courseList) { course in
                        let listViewModel = CourseListCellViewModel(course: course.wrappedValue)
                        CourseListCell(viewModel: listViewModel)
                    }
                }
                .onAppear () {
                    fetchCourseList()
                }
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
