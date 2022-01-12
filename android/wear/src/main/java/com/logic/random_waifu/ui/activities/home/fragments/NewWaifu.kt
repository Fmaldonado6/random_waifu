package com.logic.random_waifu.ui.activities.home.fragments

import androidx.lifecycle.ViewModelProvider
import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.viewModels
import coil.load
import com.logic.random_waifu.R
import com.logic.random_waifu.databinding.NewWaifuFragmentBinding
import dagger.hilt.android.AndroidEntryPoint

@AndroidEntryPoint
class NewWaifu : Fragment() {

    private val viewModel: NewWaifuViewModel by viewModels()

    private lateinit var binding: NewWaifuFragmentBinding

    companion object {
        fun newInstance() = NewWaifu()
    }


    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        binding = NewWaifuFragmentBinding.inflate(layoutInflater, container, false)
        return binding.root
    }

    override fun onActivityCreated(savedInstanceState: Bundle?) {
        super.onActivityCreated(savedInstanceState)
        // TODO: Use the ViewModel
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