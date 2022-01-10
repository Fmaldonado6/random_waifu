package com.logic.random_waifu.data.network

import com.google.firebase.database.ktx.database
import com.google.firebase.ktx.Firebase

abstract class FirebaseService(ref: String) {
    private val database = Firebase.database
    protected val reference = database.getReference(ref)
}