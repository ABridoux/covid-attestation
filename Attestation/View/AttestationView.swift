//
//  AttestationView.swift
//  Attestation
//
//  Created by Alexis Bridoux on 02/11/2020.
//

import SwiftUI

struct AttestationView: View {

    @EnvironmentObject var profile: Profile
    @EnvironmentObject var attestation: Attestation
    @State private var date = Date()
    @AppStorage("exitReason") private var exitReason: String?
    
    var body: some View {
        NavigationView {
            Form {
                Section() {
                    ProfilePicker()
                    DatePicker("Sortie", selection: $date)
                    NavigationLink(
                        destination: ExitReasonsList(selectedReason: $exitReason),
                        label: {
                            ExitReasonPickerView(selectedReason: $exitReason)
                        })
                }
                
                if attestation.wasGenerated, attestation.exitReason != nil {
                    Section(
                        header:
                            HStack {
                                Image(systemName: "clock")
                                Text("Dernière attestation")
                            })
                    {
                    NavigationLink(
                        destination: QRCodeView(),
                        label: {
                            HStack {
                                Text("\(DateFormatter.french.string(from: attestation.date)) | Motif: \(attestation.exitReason!)")
                            }
                        })
                    }
                }

                Section {
                    HStack {
                        Spacer()
                        Button("Générer l'attestation") {
                            attestation.date = date
                            attestation.exitReason = exitReason
                            try? attestation.save()
                        }
                        .font(.title3)
                        .disabled(!profile.isValid || exitReason == nil)
                        Spacer()
                    }
                }
            }
            .navigationBarTitle("Attestation")
        }
    }
}

struct AttestationView_Previews: PreviewProvider {
    static var previews: some View {
        AttestationView()
            .environmentObject(Profile(firstName: "Toto", lastName: "Daffy"))
            .environmentObject(Attestation(reason: "Dodo"))
        AttestationView()
            .preferredColorScheme(.dark)
            .environmentObject(Attestation(reason: "Travail", wasGenerated: false))
            .environmentObject(Profile(firstName: "Toto", lastName: "Daffy"))
    }
}
