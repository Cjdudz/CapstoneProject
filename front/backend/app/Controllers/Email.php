<?php

namespace App\Controllers;

use App\Controllers\BaseController;

class Email extends BaseController
{
    public function sendEmail()  {
        // Load the helper
        helper('email_helper');

        // Define email parameters
        $to      = 'cjdudas17@gmail.com';
        $subject = 'Test Email Subject';
        $message = '<p>This is a test email.</p>';

        // Send the email (from and fromName will be taken from global config)
        if (send_email($to, $subject, $message)) {
            return 'Email sent successfully!';
        } else {
            return 'Failed to send email.';
        }
    }

}
 