//
//  CustomTextFieldView.swift
//  MoneyMorph
//
//  Created by Adam Permana on 26/06/23.
//

import SwiftUI

struct CustomLoginView: View {
    @State private var isLoginViewPresented = false
    
    var body: some View {
        VStack(spacing: 20) {
            
//            GOOGLE
            Button(action: {
                // Tambahkan tindakan yang diinginkan saat tombol Google ditekan
            }) {
                HStack {
                    Image("GoogleMedia")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .offset(x: 18)
                    Text("Continue with Google")
                        .font(.headline)
                        .frame(width: 220, height: 10)
                        .foregroundColor(.black)
                }
                .padding()
                .background(Color.white)
                .border(Color.black, width: 2)
                
            }
            
//            FACEBOOK
            Button(action: {
                // Tambahkan tindakan yang diinginkan saat tombol Facebook ditekan
            }) {
                HStack {
                    Image("FacebookMedia")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .offset(x: 18)
                        
                    Text("Continue with Facebook")
                        .font(.headline)
                        .frame(width: 220, height: 10)
                        .foregroundColor(.black)
                }
                .padding()
                .background(Color.white)
                .border(Color.black, width: 2)
                
            }
            
//            EMAIL
            Button(action: {
                // Tambahkan tindakan yang diinginkan saat tombol Email ditekan
                
                isLoginViewPresented = true // Mengubah status isLoginViewPresented menjadi true
             
              
            }) {
                HStack {
                    Image("EmailMedia")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .offset(x: 18)
                    Text("Continue with Email")
                        .font(.headline)
                        .frame(width: 220, height: 10)
                        .foregroundColor(.black)
                }
                .padding()
                .background(Color.white)
                .border(Color.black, width: 2)
                
            }
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .center)
        .fullScreenCover(isPresented: $isLoginViewPresented) {
            LoginView() // Tampilan halaman login yang ingin ditampilkan secara penuh
            }
        }
    }


struct CustomLoginView_Previews: PreviewProvider {
    static var previews: some View {
        CustomLoginView()
    }
}
