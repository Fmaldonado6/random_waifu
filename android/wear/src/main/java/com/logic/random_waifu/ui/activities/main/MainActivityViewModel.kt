package com.logic.random_waifu.ui.activities.main

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.google.firebase.auth.GoogleAuthCredential
import com.logic.random_waifu.data.repositories.AuthRepository
import com.logic.random_waifu.ui.utils.Status
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import java.lang.Exception
import javax.inject.Inject

@HiltViewModel
class MainActivityViewModel
@Inject
constructor(
    private val authRepository: AuthRepository
) : ViewModel() {

    val status = MutableLiveData(Status.Loaded)
    val user = authRepository.user

    fun signInWithGoogle(googleAuthCredential: GoogleAuthCredential) {
        viewModelScope.launch(Dispatchers.IO) {
            try {
                status.postValue(Status.Loading)
                authRepository.signInWithGoogle(googleAuthCredential)
                status.postValue(Status.Loaded)
            } catch (e: Exception) {

            }

        }
    }

}