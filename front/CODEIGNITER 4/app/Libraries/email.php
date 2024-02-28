<?php
// Include PHPMailer classes into the global namespace
// These must be at the top of your script, not inside a function
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'vendor/autoload.php';

$mail = new PHPMailer(true);                              // Passing `true` enables exceptions

try {
    // Server settings
    $mail->SMTPDebug = 2;                                 // Enable verbose debug output
    $mail->isSMTP();                                      // Set mailer to use SMTP
    $mail->Host = 'smtp1.example.com;smtp2.example.com';  // Specify main and backup SMTP servers
    $mail->SMTPAuth = true;                               // Enable SMTP authentication
    $mail->Username = 'user@example.com';                 // SMTP username
    $mail->Password = 'secret';                           // SMTP password
    $mail->SMTPSecure = 'tls';                            // Enable TLS encryption, `ssl` also accepted
    $mail->Port = 587;                                    // TCP port to connect to

    // Recipients
    $mail->setFrom('from@example.com', 'Mailer');
    
    $body = <<<'EOT'
    Message Body: This is a test mail!
    EOT;

    $mail->Body = $body;
    echo "Message has been sent: Body";
} catch (Exception $e) {
    echo "Message could not be sent.";
    echo "Mail Error: " . $mail->ErrorInfo;
}
?>
