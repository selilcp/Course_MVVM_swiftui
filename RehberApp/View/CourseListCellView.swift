//
//  CourseListCellView.swift
//  RehberApp
//
//  Created by Selil on 20/04/2024.
//

import SwiftUI

struct CourseListCell: View {
    
    let viewModel:CourseListCellViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading,spacing: 6) {
                Text(viewModel.course.title)
                    .bold()
                    .font(.title3)
                Text(viewModel.course.instructorName)
                    .font(Font.subheadline.weight(.medium))
                    .foregroundColor(Color.blue)
                Text(viewModel.course.shortDescription)
                    .lineLimit(3)
                    .font(.body)
            }
            .buttonStyle(.plain)
            NavigationLink( destination: CourseDetailView(viewModel: CourseDetailViewModel(course: viewModel.course) )){
            
            }
        }
    }
}
