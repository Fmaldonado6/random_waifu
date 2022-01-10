package com.logic.random_waifu.ui.activities.home

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import androidx.activity.viewModels
import coil.load
import com.logic.random_waifu.R
import com.logic.random_waifu.databinding.ActivityHomeBinding
import dagger.hilt.android.AndroidEntryPoint

@AndroidEntryPoint
class HomeActivity : AppCompatActivity() {
    private lateinit var binding: ActivityHomeBinding
    private val viewModel: HomeActivityViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityHomeBinding.inflate(layoutInflater)
        setContentView(binding.root)

        viewModel.getWaifus()

        viewModel.lastWaifu.observe(this) {
            it ?: return@observe
            binding.characterName.text = it.name
            binding.animeName.text = it.anime?.name ?: ""
            binding.imageView.load(it.imageUrl)
        }

        viewModel.status.observe(this) {
            binding.currentStatus = it
        }
    }
}