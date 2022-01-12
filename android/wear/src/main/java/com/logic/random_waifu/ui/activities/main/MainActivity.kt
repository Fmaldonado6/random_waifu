package com.logic.random_waifu.ui.activities.main

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.util.Log
import androidx.activity.viewModels
import androidx.appcompat.app.AppCompatActivity
import com.google.android.gms.auth.api.Auth
import com.google.android.gms.auth.api.signin.GoogleSignIn
import com.google.android.gms.auth.api.signin.GoogleSignInClient
import com.google.android.gms.auth.api.signin.GoogleSignInOptions
import com.google.firebase.auth.FirebaseAuth
import com.google.firebase.auth.GoogleAuthCredential
import com.google.firebase.auth.GoogleAuthProvider
import com.google.firebase.auth.ktx.auth
import com.google.firebase.ktx.Firebase
import com.logic.random_waifu.R
import com.logic.random_waifu.databinding.ActivityMainBinding
import com.logic.random_waifu.ui.activities.home.HomeActivity
import com.logic.random_waifu.ui.utils.Status
import dagger.hilt.android.AndroidEntryPoint

@AndroidEntryPoint
class MainActivity : AppCompatActivity() {

    private val viewModel: MainActivityViewModel by viewModels()
    private lateinit var binding: ActivityMainBinding
    private lateinit var googleSignInClient: GoogleSignInClient
    private lateinit var auth: FirebaseAuth
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)
        auth = Firebase.auth
        val gso = GoogleSignInOptions.Builder(GoogleSignInOptions.DEFAULT_SIGN_IN)
            .requestIdToken(getString(R.string.default_web_client_id))
            .requestEmail()
            .build()

        googleSignInClient = GoogleSignIn.getClient(this, gso)

        binding.signInButton.setOnClickListener {
            val intent = googleSignInClient.signInIntent
            startActivityForResult(intent, 0)
        }

        viewModel.status.observe(this) {
            binding.currentStatus = it
        }

        val user = auth.currentUser

        if (user == null) {
            viewModel.changeStatus(Status.Loaded)
            return
        }

        val intent = Intent(this, HomeActivity::class.java)
        startActivity(intent)
        finish()

    }


    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)

        if (requestCode == 0 && data != null) {
            Auth.GoogleSignInApi.getSignInResultFromIntent(data)?.apply {
                if (isSuccess) {
                    val account = this.signInAccount ?: return@apply
                    viewModel.signInWithGoogle(
                        GoogleAuthProvider.getCredential(
                            account.idToken,
                            null
                        ) as GoogleAuthCredential
                    )
                }
            }
        }
    }


}