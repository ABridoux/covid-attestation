//
//  ExitReasonsList.swift
//  Attestation
//
//  Created by Alexis Bridoux on 03/11/2020.
//

import SwiftUI

struct ExitReasonsList: View {

    @State private var messageReason = ExitReason(code: "", label: "")
    @State private var showAlert = false
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedReason: String?
    static let exitReasons = [ExitReason].load()
    
    var body: some View {
        List(Self.exitReasons, id: \.self) { reason in
            Button(action: {
                selectedReason = reason.code
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    presentationMode.wrappedValue.dismiss()
                }
            }, label: {
                HStack {
                    if selectedReason == reason.code {
                        Image(systemName: "checkmark")
                            .foregroundColor(.accentColor)
                            .frame(width: 20, height: 20)
                    } else {
                        Rectangle()
                            .fill(Color.clear)
                            .frame(width: 20, height: 20)
                    }
                    Text(reason.code)
                    Spacer()
                    Image(systemName: "info.circle")
                        .font(.title3)
                        .onTapGesture {
                            showAlert.toggle()
                            messageReason = reason
                        }
                        .foregroundColor(.secondary)
                }
            })
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text(messageReason.code), message: Text(messageReason.label), dismissButton: .default(Text("OK")))
            })
        }
    }
}

struct ExitReasonsList_Previews: PreviewProvider {
    static var previews: some View {
        ExitReasonsList(selectedReason: .constant(nil))
    }
}
