package com.logic.random_waifu.ui.activities.home

import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentActivity
import androidx.recyclerview.widget.RecyclerView
import androidx.viewpager2.adapter.FragmentStateAdapter
import com.logic.random_waifu.ui.activities.home.fragments.NewWaifu

class ViewPagerAdapter(
    fa: FragmentActivity,
) : FragmentStateAdapter(fa) {
    override fun getItemCount(): Int = 2

    override fun createFragment(position: Int): Fragment =
        if (position == 0)
            NewWaifu.newInstance()
        else
            NewWaifu.newInstance()
}