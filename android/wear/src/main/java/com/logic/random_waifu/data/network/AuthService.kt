package com.logic.random_waifu.data.network

import com.google.android.gms.tasks.Task
import com.google.firebase.auth.AuthResult
import com.google.firebase.auth.FirebaseAuth
import com.google.firebase.auth.GoogleAuthCredential
import com.google.firebase.auth.GoogleAuthProvider
import com.google.firebase.auth.ktx.auth
import com.google.firebase.ktx.Firebase
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class AuthService
@Inject constructor() {

    private val auth: FirebaseAuth = Firebase.auth

    fun signInWithGoogle(authCredential: GoogleAuthCredential): Task<AuthResult> {
        return auth.signInWithCredential(authCredential)
    }


}