package com.logic.random_waifu.data.repositories

import android.util.Log
import androidx.lifecycle.MutableLiveData
import com.logic.random_waifu.data.models.Waifu
import com.logic.random_waifu.data.network.AuthService
import com.logic.random_waifu.data.network.WaifusService
import java.lang.Exception
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class WaifusRepository
@Inject
constructor(
    private val waifusService: WaifusService,
    private val authService: AuthService
) {

    val lastWaifu = MutableLiveData<Waifu?>()

    suspend fun getWaifusByUser() {
        val currentUser = authService.user ?: throw Exception("User not logged in")
        val waifus = waifusService.getLastWaifu(currentUser.uid)
    }

    suspend fun getLastWaifu() {
        val currentUser = authService.user ?: throw Exception("User not logged in")
        val waifu = waifusService.getLastWaifu(currentUser.uid)
        Log.d("Waif",waifu?.name.toString())
        lastWaifu.postValue(waifu)
    }

}