<?php

namespace App\Controllers;

use App\Controllers\BaseController;

class Email extends BaseController
{
    public function sendEmail()  {

        // Define email parameters
        $to      = ['cjdudas17@gmail.com', 'lixandersalvador37@gmail.com', 'badethbautista07@gmail.com'];
        $subject = 'Test email';
        $message = '<p>This is a test email.</p>';

        // Send the email (from and fromName will be taken from global config)
        if (send_email($to, $subject, $message)) {
            return 'Email sent successfully!';
        } else {
            return 'Failed to send email.';
        }
    }

    public function sendSMS() {
        // $to      = ['09670829673'];
        $to      = '09459820347';
        $message = 'Panget ka raw from PCGA 505th';

        // Send the email (from and fromName will be taken from global config)
        if (send_sms($to, $message)) {
            return 'SMS sent successfully!';
        } else {
            return 'Failed to send email.';
        }
    }

}
 