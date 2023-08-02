//
//  ActivityModel.swift
//  GRLPWR
//
//  Created by Evelyn Theodora Siswanto on 01/06/23.
//

import Foundation

struct Activity: Hashable {
    var judul: String
    var deskripsi: String
    var image: String
    var tags: [String]
    var activityDate: Date
}

var activityData: [Activity] = [
    Activity (judul: "Matrix", deskripsi: "ini adalah deskripsi dari aktivitas yang akan dilakukan", image: "", tags: ["Ulangan Harian","Ujian Akhir", "Matematika", "Science"], activityDate: Date()),
    Activity (judul: "Matrix2", deskripsi: "ini adalah deskripsi dari aktivitas yang akan dilakukan", image: "", tags: ["Ulangan Harian","Ujian Akhir", "Hitung"], activityDate: Date()),
    Activity (judul: "Matrix3", deskripsi: "ini adalah deskripsi dari aktivitas yang akan dilakukan", image: "", tags: ["Ulangan Harian","Ujian Akhir", "Matematika", "Science"], activityDate: Date()),
    Activity (judul: "Matrix4", deskripsi: "ini adalah deskripsi dari aktivitas yang akan dilakukan", image: "", tags: ["Ulangan Harian","Ujian Akhir", "Matematika", "Science"], activityDate: Date())
//    Activity (judul: "Matrix5", deskripsi: "ini adalah deskripsi dari aktivitas yang akan dilakukan", image: "", tags: ["Ulangan Harian","Ujian Akhir", "Matematika", "Science"], isTodayActivity: false),
//    Activity (judul: "Matrix6", deskripsi: "ini adalah deskripsi dari aktivitas yang akan dilakukan", image: "", tags: ["Ulangan Harian","Ujian Akhir", "Matematika", "Science"], isTodayActivity: false),
//    Activity (judul: "Matrix7", deskripsi: "ini adalah deskripsi dari aktivitas yang akan dilakukan", image: "", tags: ["Ulangan Harian","Ujian Akhir", "Hitung"], isTodayActivity: true)
]

var activity = Activity.init(judul: "Matrix", deskripsi: "ini adalah deskripsi dari aktivitas yang akan dilakukan", image: "", tags: ["Ulangan Harian","Ujian Akhir", "Matematika", "Science"], activityDate: Date())

struct Tag : Hashable {
    var name: String
    var isSelected: Bool
}

//var theTags: [String] = [
//    "Math", "English", "Geography", "Physic"
//]

var theTags: [Tag] = [
    Tag(name: "Math", isSelected: false),
    Tag(name: "English", isSelected: false),
    Tag(name: "Geography", isSelected: false),
    Tag(name: "Physic", isSelected: false),
    Tag(name: "Art", isSelected: false)
]
