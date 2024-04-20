//
//  CourseDetailView.swift
//  RehberApp
//
//  Created by Selil on 20/04/2024.
//

import SwiftUI

struct CourseDetailView: View {
    
    @State private var showAlert:Bool = false
    
    let viewModel: CourseDetailViewModel
    
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading,spacing: 6) {
                Text(viewModel.course.title)
                    .bold()
                    .font(.title3)
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 40))
                Text(viewModel.course.description)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 40))
            }
            VStack{
                Spacer()
                Button("Enrol") {
                    showAlert = true
                }
                .frame(width:100, height: 40)
                .border(.gray, width: 0.5)
                .alert("Success", isPresented: $showAlert) {
                    
                }
            }
        }
    }
}

#Preview {
    CourseDetailView(viewModel: CourseDetailViewModel(course: CourseModel.init(id: 1, title: "tes", instructorName: "gd", category: "dfd", shortDescription: "fdf", description: "fef", userCount: 3, videoLinks: [""])))
}
