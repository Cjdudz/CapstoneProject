<?php

namespace App\Controllers;

use App\Models\UserModel;
use CodeIgniter\I18n\Time;
use CodeIgniter\RESTful\ResourceController;

class PasswordResetController extends ResourceController
{
    /**
     * Step 1: Request Password Reset (API Endpoint)
     * POST /api/password-reset/request
     */
    public function requestReset()
    {
        $data = $this->request->getJSON();
        if (!isset($data->email)) {
            return $this->respond([
                'status' => 400,
                'message' => 'Email is required.'
            ], 400);
        }

        $email = $data->email;
        $userModel = new UserModel();
        $user = $userModel->where('email', $email)->first();

        if (!$user) {
            return $this->respond([
                'status' => 404,
                'message' => 'No user found with this email address.'
            ], 404);
        }

        // Generate token and set expiration
        $token = bin2hex(random_bytes(16)); // Generate a 32 character token
        $expiresAt = Time::now()->addMinutes(30); // Token valid for 30 minutes

        // Update the user's password_reset_token and expires_at fields
        $userModel->update($user['id'], [
            'password_reset_token' => $token,
            'expires_at' => $expiresAt->toDateTimeString()
        ]);

        // Create password reset link
        $resetLink = "http://backend.test/password-reset/reset/" . "$token";

        // Send password reset email using PHPMailer
        $subject = "Password Reset Request";
        $body = "Hello {$user['username']},<br><br>"
              . "You requested a password reset. Please click the link below to reset your password:<br><br>"
              . "<a href='$resetLink'>$resetLink</a><br><br>"
              . "This link will expire in 30 minutes.<br><br>"
              . "If you did not request this, please ignore this email.";

        // Correct the format of recipients array to just include email strings
        $recipients = array_map(function($recipient) {
            return is_array($recipient) ? $recipient['email'] : $recipient;
        }, [$email]);

        // Send the email
        if (send_email($recipients, $subject, $body)) {
            return $this->respond([
                'status' => 200,
                'message' => 'Password reset link has been sent to your email.'
            ]);
        } else {
            return $this->respond([
                'status' => 500,
                'message' => 'Failed to send password reset email. Please try again later.'
            ], 500);
        }
    }

    /**
     * Step 2: Verify the Password Reset Token (API Endpoint)
     * GET /api/password-reset/verify/{token}
     */
    public function verifyToken($token)
    {
        $userModel = new UserModel();
        $user = $userModel->where('password_reset_token', $token)
                          ->where('expires_at >', Time::now()->toDateTimeString())
                          ->first();

        if (!$user) {
            return $this->respond([
                'status' => 404,
                'message' => 'Invalid or expired token.'
            ], 404);
        }

        return $this->respond([
            'status' => 200,
            'message' => 'Token is valid.',
            'user_id' => $user['id']
        ]);
    }

    /**
     * Step 3: Reset the Password (API Endpoint)
     * POST /api/password-reset/reset
     */
    public function resetPassword()
{
    $data = $this->request->getPost();  // Use getPost() to read form data

    if (!isset($data['token'], $data['password'], $data['confirm_password'])) {
        return $this->respond([
            'status' => 400,
            'message' => 'Token, password, and confirm password are required.'
        ], 400);
    }

    $token = $data['token'];
    $newPassword = $data['password'];
    $confirmPassword = $data['confirm_password'];

    if ($newPassword !== $confirmPassword) {
        return $this->respond([
            'status' => 400,
            'message' => 'Password and confirm password do not match.'
        ], 400);
    }

    $userModel = new UserModel();
    $user = $userModel->where('password_reset_token', $token)
                      ->where('expires_at >', Time::now()->toDateTimeString())
                      ->first();

    if (!$user) {
        return $this->respond([
            'status' => 404,
            'message' => 'Invalid or expired token.'
        ], 404);
    }

    // Hash the new password and update the user record
    $userModel->update($user['id'], [
        'password' => password_hash($newPassword, PASSWORD_DEFAULT),
        'password_reset_token' => null, // Invalidate the token
        'expires_at' => null // Clear expiration
    ]);

    return $this->respond([
        'status' => 200,
        'message' => 'Password has been successfully reset. You can now log in.'
    ]);
}

    public function test()
    {
        return $this->respond([
            'status' => 200,
            'message' => 'This is a test message from the TestController!',
        ]);
    }
    public function showResetPage($token)
{
    // Check if the token is valid and not expired
    $userModel = new UserModel();
    $user = $userModel->where('password_reset_token', $token)
                      ->where('expires_at >', Time::now()->toDateTimeString())
                      ->first();

    if (!$user) {
        // If the token is invalid or expired, show an error message
        return $this->respond([
            'status' => 404,
            'message' => 'Invalid or expired token. Please request a new password reset.'
        ], 404);
    }

    // Render the reset password view with the token
    return view('Passreset', ['token' => $token]);
}
}