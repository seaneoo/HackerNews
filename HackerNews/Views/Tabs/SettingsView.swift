//
//  SettingsView.swift
//  HackerNews
//
//  Created by Sean O'Connor on 7/2/23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    NavigationLink {
                        Text("General")
                    } label: {
                        Label("General", systemImage: "gear")
                    }

                    NavigationLink {
                        Text("Appearance")
                    } label: {
                        Label("Appearance", systemImage: "theatermasks")
                    }
                } header: {
                    Text("App Settings")
                }

                Section {
                    Link(destination: URL(string: "https://github.com/seaneoo/HackerNews/")!) {
                        Label("Source Code", systemImage: "curlybraces")
                    }

                    Link(destination: URL(string: "https://github.com/seaneoo/HackerNews/issues")!) {
                        Label("Issues", systemImage: "exclamationmark.circle")
                    }
                } header: {
                    Text("About")
                } footer: {
                    if let version = UIApplication.appVersion, let build = UIApplication.buildVersion {
                        Text("Version \(version) (Build \(build))")
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
