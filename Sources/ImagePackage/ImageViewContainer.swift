//
//  ImageViewContainer.swift
//  
//
//  Created by Sergio Veliz on 4/10/20.
//

import SwiftUI

public struct ImageViewContainer<Content: View>:View {
    @ObservedObject var remoteImageURL: ImagesManager
    var content: (_ image: Image) -> Content
    let placeholder: Image
    
    public init(remoteImageUrl: ImagesManager, placeholder: Image, content: @escaping (_ image: Image) -> Content) {
        self.remoteImageURL = remoteImageUrl
        self.placeholder = placeholder
        self.content = content
    }
    public var body: some View {
        
        let uiImage = self.remoteImageURL.data.isEmpty ? nil : UIImage(data: self.remoteImageURL.data)
        let image = uiImage != nil ? Image(uiImage: uiImage!) : nil;
        return ZStack() {
            if image != nil {
                content(image!)
            } else {
                content(placeholder)
            }
        }
        .onAppear(perform:loadImage)
    }
    
    private func loadImage() {
        remoteImageURL.loadImage()
    }
}
