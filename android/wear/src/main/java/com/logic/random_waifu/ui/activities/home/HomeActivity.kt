package com.logic.random_waifu.ui.activities.home

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.logic.random_waifu.R
import com.logic.random_waifu.databinding.ActivityHomeBinding

class HomeActivity : AppCompatActivity() {
    private lateinit var binding: ActivityHomeBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityHomeBinding.inflate(layoutInflater)
        setContentView(binding.root)
    }
}