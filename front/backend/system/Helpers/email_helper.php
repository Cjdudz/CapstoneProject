<?php
use CodeIgniter\Email\Email;

/**
 * Sends an email using the global configuration.
 *
 * @param string $to       Recipient email address
 * @param string $subject  Email subject
 * @param string $message  Email message body (HTML or plain text)
 * @param string $from     Sender email address (optional, will use global config if not provided)
 * @param string $fromName Sender name (optional, will use global config if not provided)
 * @param array  $cc       CC recipients (optional)
 * @param array  $bcc      BCC recipients (optional)
 *
 * @return bool Returns TRUE on success, FALSE on failure
 */
function send_email($to, $subject, $message, $from = null, $fromName = null, $cc = [], $bcc = [])
{
    // Load email config from app/Config/Email.php
    $config = config('Email');

    // Get an instance of the email service
    $email = \Config\Services::email();

    // Initialize email with global configuration
    $email->initialize([
        'protocol' => $config->protocol,
        'SMTPHost' => $config->SMTPHost,
        'SMTPUser' => $config->SMTPUser,
        'SMTPPass' => $config->SMTPPass,
        'SMTPPort' => $config->SMTPPort,
        'mailType' => $config->mailType,
        'charset'  => $config->charset,
        'newline'  => $config->newline,
        'wordWrap' => $config->wordWrap,
    ]);

    // Set email parameters
    $email->setFrom($from ?? $config->fromEmail, $fromName ?? $config->fromName);
    $email->setTo($to);
    if (!empty($cc)) {
        $email->setCC($cc);
    }
    if (!empty($bcc)) {
        $email->setBCC($bcc);
    }
    $email->setSubject($subject);
    $email->setMessage($message);

    // Send the email and return the status
    if ($email->send()) {
        return true;
    } else {
        // Log the error if needed
        log_message('error', $email->printDebugger(['headers']));
        return false;
    }
}
