//
//  ExitReasonPickerView.swift
//  Attestation
//
//  Created by Alexis Bridoux on 03/11/2020.
//

import SwiftUI

struct ExitReasonRow: View {

    @Binding var selectedReason: String?

    var body: some View {
        HStack {
            Text("Motif")
            Spacer()
            if let reason = selectedReason {
                Text(reason)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct ExitReasonPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ExitReasonRow(selectedReason: .constant("Dodo"))
    }
}
