package com.logic.random_waifu.ui.activities.home.fragments

import android.util.Log
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.logic.random_waifu.data.repositories.WaifusRepository
import com.logic.random_waifu.ui.utils.Status
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import java.lang.Exception
import javax.inject.Inject

@HiltViewModel
class NewWaifuViewModel
@Inject
constructor(
    private val waifusRepository: WaifusRepository
) : ViewModel() {

    val status = MutableLiveData(Status.Loading)
    val lastWaifu = waifusRepository.lastWaifu

    fun getWaifus() {
        viewModelScope.launch(Dispatchers.IO) {
            try {
                status.postValue(Status.Loading)
                waifusRepository.getLastWaifu()
                status.postValue(Status.Loaded)
            } catch (e: Exception) {
                Log.e("Error", "error", e)
            }
        }
    }
}