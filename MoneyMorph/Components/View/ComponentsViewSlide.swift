//
//  ComponentsViewSlide1.swift
//  MoneyMorph
//
//  Created by Adam Permana on 26/06/23.
//

import SwiftUI

struct ComponentsViewSlide: View {
    @State private var activeIntro: PageIntro = pageIntros[0]
    
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            
            IntroView(intro: $activeIntro, size: size) {
//                USER LOGIN VIEW
                VStack(spacing: 10) {
//                    CUSTOM LOGIN VIEW
                    CustomLoginView()
                        .offset(y: -20)
                }
                SwitchSignUpView()
                
            }
        }
        
        .padding(15)
        
    }
}

struct ComponentsViewSlide_Previews: PreviewProvider {
    static var previews: some View {
        ComponentsViewSlide()
        
    }
}

// Intro View
struct IntroView<ActionView: View>: View {
    @Binding var intro: PageIntro
    var size: CGSize
    var actionView: ActionView
    let amberYellow = Color("AmberYellow")
    
    init(intro: Binding<PageIntro>, size: CGSize, @ViewBuilder actionView: @escaping () -> ActionView) {
        self._intro = intro
        self.size = size
        self.actionView = actionView()
    }
//    Animation Properties
    @State private var showView: Bool = false
    @State private var hideWholeView: Bool = false
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                let imageSize = CGSize(width: geometry.size.width, height: geometry.size.height)
                
                Image(intro.introAssetImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: imageSize.width, height: imageSize.height)
                    .offset(y: -20)
            }
            //            Moving Down
                        .offset(y: showView ? 0: -size.height / 2)
                        .opacity(showView ? 1 : 0)
            
//            Title & Action
            VStack(alignment: .center, spacing: 10) {
                Spacer(minLength: 0)
               
            
                
//                TEXT TITLE
                Text(intro.title)
                    .font(
                    Font.custom("Poppins-Bold", size: 47))
                    .fontWeight(.black)
                
//                TEXT SUBTITLE
                Text(intro.subTitle)
                    .font(.caption)
                    .foregroundColor(.black)
            
                if !intro.displaysAction {
                    Spacer(minLength: 25)
                    
                    CustomIndicatorView(totalPages: filteredPages.count, currentPage: filteredPages.firstIndex(of: intro) ?? 0)
                        .frame(maxWidth: .infinity)
                    Spacer(minLength: 10)
                        
                    
//                    Button Next
                    Button(action: {
                        changeIntro()
                        // Action when the button is tapped
                    }) {
                        Text("Next")
                            .font(
                                Font.custom("Poppins-Medium", size: 28))
                        
                            .foregroundColor(.white)
                            
                            .padding(.vertical, 15)
                            .frame(width: 290)
                            .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(amberYellow)
                            )
                            
                    }
                    
                    
                    
                    
                    .frame(maxWidth: .infinity)
                    
                } else {
//                    Action View
                    actionView
                        .offset(y: showView ? 0: size.height / 2)
                        .opacity(showView ? 1 : 0)
                    
                }
                
                
            }
            //                Moving Down
                .offset(y: showView ? 0: size.height / 2)
                .opacity(showView ? 1 : 0)
            
            .frame(maxWidth: .infinity, alignment: .center)
            
            
        }
        .offset(y: hideWholeView ? size.height / 2 : 0)
               .opacity(hideWholeView ? 0 : 1)
       
       
//        Back button
        .overlay(alignment: .topLeading) {
//            Hiding it for very first page, sice there is no previous page present
            if intro != pageIntros.first {
                Button {
                    changeIntro(true)
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .contentShape(Rectangle())
                }
                .padding(10)
//                Animation Back Button
//                Comes From Tp When Active
                .offset(y: showView ? 0 : -200)
//                Hides by going back to Top when In active
                .offset(y: hideWholeView ? -200 : 0)
            }
            
        }
        
        .onAppear {
            withAnimation(.spring(response: 0.8, dampingFraction: 0.8, blendDuration: 0).delay(0.1)) {
                showView = true
            }
            
        }
        
    }
    
//    Update Page Intro's
    func changeIntro(_ isPrevious: Bool = false) {
        withAnimation(.spring(response: 0.8, dampingFraction: 0.8, blendDuration: 0)) {
            hideWholeView = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            //            Updating page
            if let index = pageIntros.firstIndex(of: intro), (isPrevious ? index != 0 : index != pageIntros.count - 1) {
                intro = isPrevious ? pageIntros[index - 1] : pageIntros[index + 1]
            } else {
                intro = isPrevious ? pageIntros[0] : pageIntros[pageIntros.count - 1]
            }
            //            Re-Animating as Split page
            hideWholeView = false
            showView = false
            
            withAnimation(.spring(response: 0.8, dampingFraction: 0.8, blendDuration: 0)) {
                showView = true
            }
        }
    }
    var filteredPages: [PageIntro] {
        return pageIntros.filter { !$0.displaysAction }
    }
}
