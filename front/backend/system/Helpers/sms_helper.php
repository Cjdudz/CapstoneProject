<?php

/**
 * Sends an SMS using the Semaphore API.
 *
 * @param string $to      Recipient phone number
 * @param string $message The SMS message to send
 * @param string $apiKey  Your Semaphore API key
 *
 * @return bool Returns TRUE on success, FALSE on failure
 */
function send_sms($to, $message)
{
    $ch = curl_init();
    $parameters = array(
        'apikey' => $_ENV['SEMAPHORE_API'],
        'number' => $to,
        'message' => $message,
        'sendername' => 'PCGA505th'
    );
    curl_setopt( $ch, CURLOPT_URL,'https://semaphore.co/api/v4/messages' );
    curl_setopt( $ch, CURLOPT_POST, 1 );

    //Send the parameters set above with the request
    curl_setopt( $ch, CURLOPT_POSTFIELDS, http_build_query( $parameters ) );

    // Receive response from server
    curl_setopt( $ch, CURLOPT_RETURNTRANSFER, true );
    $output = curl_exec( $ch );
    curl_close ($ch);

    //Show the server response
    echo $output;
    
}

function send_sms_batch($to, $message){
    $ch = curl_init();
    $parameters = array(
        'apikey' => $_ENV['SEMAPHORE_API'], //Your API KEY
        'number' => $to,
        'message' => $message,
        'sendername' => 'SEMAPHORE'
    );
    curl_setopt( $ch, CURLOPT_URL,'https://semaphore.co/api/v4/messages' );
    curl_setopt( $ch, CURLOPT_POST, 1 );

    //Send the parameters set above with the request
    curl_setopt( $ch, CURLOPT_POSTFIELDS, http_build_query( $parameters ) );

    // Receive response from server
    curl_setopt( $ch, CURLOPT_RETURNTRANSFER, true );
    $output = curl_exec( $ch );
    curl_close ($ch);

    //Show the server response
    echo $output;
}
        