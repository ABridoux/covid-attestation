//
//  AttestationView.swift
//  Attestation
//
//  Created by Alexis Bridoux on 02/11/2020.
//

import SwiftUI

final class Attestation: ObservableObject {
    @Published var date = Date()
}

struct AttestationView: View {

    @State private var presentProfileEdit = false
    @ObservedObject var attestation = Attestation()
    @Environment(\.managedObjectContext) var context
    @ObservedObject var profile = Profile.fetch()
    
    var body: some View {
        Form {
            Section() {
                Button(action: {
                    presentProfileEdit.toggle()
                }, label: {
                    ProfilePicker()
                        .environmentObject(profile)
                })
                .foregroundColor(.label)
                .sheet(isPresented: $presentProfileEdit, content: {
                    NavigationView {
                        ProfileFormView(isPresented: $presentProfileEdit)
                            .environmentObject(profile)
                    }
                })
                DatePicker("Sortie", selection: $attestation.date)
            }
            Section {
                HStack {
                    Spacer()
                    Button("Générer l'attestation") {

                    }
                    .font(.title3)
                    Spacer()
                }
            }
        }
    }
}

struct AttestationView_Previews: PreviewProvider {
    static var previews: some View {
        AttestationView()
        AttestationView()
            .preferredColorScheme(.dark)
    }
}
