//
// covid-attestation
// Copyright (c) Alexis Bridoux & contributors 2020
// GPL license, see LICENSE file for details

import SwiftUI

struct AttestationRow: View {

    @EnvironmentObject var attestation: Attestation
    @State private var pushAttestation = false

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Image(systemName: "clock")
                        .frame(width: 20, height: 0)
                    Text(DateFormatter.french.string(from: attestation.date))
                }

                HStack {
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width: 20, height: 0)
                    if let reason = attestation.exitReason {
                        Text(reason)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                NavigationLink(
                    destination: QRCodeView(),
                    isActive: $pushAttestation,
                    label: {
                        EmptyView()
                            .frame(width: 0, height: 0)
                    }
                )
            }
            Spacer()
            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .semibold, design: .default))
                .foregroundColor(.tertiaryLabel)
        }
    }
}

struct AttestationRow_Previews: PreviewProvider {
    static var previews: some View {
        AttestationRow()
            .environmentObject(Attestation(reason: "Dodo"))
            .padding()
    }
}
