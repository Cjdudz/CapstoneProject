<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

if (!function_exists('send_email_batch')) {
    function send_email($recipients, $subject, $body)
    {
        $config = config('Email');
        // Load the email configuration from environment variables
        $fromEmail = $config->SMTPUser;
        $fromName  = "PCGA 505th";
        $smtpHost  = $config->SMTPHost;
        $smtpUser  = $config->SMTPUser;
        $smtpPass  = $config->SMTPPass;
        $smtpPort  = $config->SMTPPort;
        $smtpCrypto = $config->SMTPCrypto;

        // Create an instance of PHPMailer
        $mail = new PHPMailer(true);

        try {
            // Server settings
            $mail->isSMTP();
            $mail->Host       = $smtpHost;
            $mail->SMTPAuth   = true;
            $mail->Username   = $smtpUser;
            $mail->Password   = $smtpPass;
            $mail->SMTPSecure = $smtpCrypto;
            $mail->Port       = $smtpPort;

            $mail->SMTPOptions = array(
                'ssl' => array(
                    'verify_peer' => false,
                    'verify_peer_name' => false,
                    'allow_self_signed' => true
                )
            );
            
            // Set the sender
            $mail->setFrom($fromEmail, $fromName);

            // Iterate through recipients and send emails
            foreach ($recipients as $to) {
                $mail->clearAddresses();  // Clear previous recipient to avoid re-sending
                $mail->addAddress($to);   // Add new recipient

                // Content
                $mail->isHTML(true);
                $mail->Subject = $subject;
                $mail->Body    = $body;

                // Send the email
                $mail->send();
            }

            return true;
        } catch (Exception $e) {
            // Handle error, e.g., log or display an error message
            log_message('error', "Batch email error for recipient: {$to}. Mailer Error: {$mail->ErrorInfo}");
            return false;
        }
    }
}