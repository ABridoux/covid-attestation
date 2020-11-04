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
    @EnvironmentObject var currentDate: CurrentDate
    @AppStorage("exitReason") private var exitReason: String?

    var body: some View {
        NavigationView {
            Form {
                Section {
                    ProfileRow()
                    DatePicker("Sortie", selection: $currentDate.current)
                    NavigationLink(
                        destination: ExitReasonsList(selectedReason: $exitReason),
                        label: {
                            ExitReasonRow(selectedReason: $exitReason)
                        })
                }

                if attestation.wasGenerated, attestation.exitReason != nil {
                    Section( header: Text("Dernière attestation")) {
                        AttestationRow()
                    }
                }

                Section {
                    HStack {
                        Spacer()
                        Button("Générer l'attestation") {
                            attestation.date = currentDate.current
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
            .environmentObject(Profile.stub1)
            .environmentObject(Attestation(reason: "Dodo"))
            .environmentObject(CurrentDate())
        AttestationView()
            .preferredColorScheme(.dark)
            .environmentObject(Profile.stub1)
            .environmentObject(Attestation(reason: "Travail", wasGenerated: false))
            .environmentObject(CurrentDate())
    }
}
