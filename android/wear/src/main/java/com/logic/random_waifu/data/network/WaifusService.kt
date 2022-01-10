package com.logic.random_waifu.data.network

import android.util.Log
import com.google.firebase.database.ktx.getValue
import com.logic.random_waifu.data.models.Waifu
import kotlinx.coroutines.tasks.await
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class WaifusService
@Inject
constructor() : FirebaseService("") {

    suspend fun getUserWaifus(userId: String): List<Waifu> {
        val snapshot = reference.child(userId)
            .child("waifus")
            .get()
            .await()

        return snapshot.getValue<List<Waifu>>() ?: mutableListOf()
    }

    suspend fun getLastWaifu(userId: String): Waifu? {
        val snapshot =
            reference.child(userId)
                .child("waifus")
                .orderByKey()
                .limitToLast(1)
                .get()
                .await()

        val data = snapshot.getValue<HashMap<String, Waifu>>()
        Log.d("Data",data.toString())
        return data?.values?.firstOrNull()

    }

}