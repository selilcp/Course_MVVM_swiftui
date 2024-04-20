//
//  CourseVideoLinkCellView.swift
//  RehberApp
//
//  Created by Selil on 20/04/2024.
//

import SwiftUI

struct CourseVideoLinkCellView: View {
    
    let viewModel:CourseVideoLinkCellViewModel
    
    var body: some View {
        HStack(){
            Image(ImageResource(name: "videoPeviewPic", bundle: Bundle.main))
                .frame(width: 100,height:100)
                .scaledToFit()
                .clipped()
            if let url = URL(string: viewModel.videoLink.link){
                Link("", destination: url )
            }
            VStack(alignment: .leading,spacing: 10) {
                Text(viewModel.videoLink.title)
                    .bold()
                    .font(.caption)
                
            }
        }
    }
}
