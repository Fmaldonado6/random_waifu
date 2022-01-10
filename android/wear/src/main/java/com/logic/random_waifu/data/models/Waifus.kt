package com.logic.random_waifu.data.models

import com.google.firebase.database.IgnoreExtraProperties

@IgnoreExtraProperties
data class Waifu(
    val characterId: Long? = null,
    val date: String? = null,
    val imageUrl: String? = null,
    val name: String? = null,
    val anime: Media? = null,
    val manga: Media? = null
)

@IgnoreExtraProperties
data class Media(
    val mal_id: Long? = null,
    val image_url: String? = null,
    val name: String? = null
)

@IgnoreExtraProperties
data class FirebaseResponse(
    val waifus: List<Waifu>? = null
)