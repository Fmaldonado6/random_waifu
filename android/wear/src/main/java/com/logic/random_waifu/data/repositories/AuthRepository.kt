package com.logic.random_waifu.data.repositories

import androidx.lifecycle.MutableLiveData
import com.google.firebase.auth.AuthResult
import com.google.firebase.auth.FirebaseUser
import com.google.firebase.auth.GoogleAuthCredential
import com.logic.random_waifu.data.network.AuthService
import java.lang.Exception
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class AuthRepository
@Inject
constructor(
    private val authService: AuthService
) {

    val user = MutableLiveData<FirebaseUser>()

    fun signInWithGoogle(googleAuthCredential: GoogleAuthCredential) {
        authService.signInWithGoogle(googleAuthCredential).addOnCompleteListener {
            if (!it.isSuccessful)
                throw Exception("Couldn't sign in with Google")

            val authResult = it.result
            user.postValue(authResult.user)
        }
    }

}