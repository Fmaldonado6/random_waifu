package com.logic.random_waifu.di

import android.content.Context
import com.logic.random_waifu.ui.RandomWaifuApplication
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

@Module
@InstallIn(SingletonComponent::class)
object ApplicationModule {

    @Singleton
    @Provides
    fun provideApplication(@ApplicationContext app: Context): RandomWaifuApplication =
        app as RandomWaifuApplication

}