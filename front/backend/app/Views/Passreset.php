<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Password Reset</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 500px;
            margin: 50px auto;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #333333;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            font-size: 14px;
            margin-bottom: 5px;
            color: #666666;
        }
        input[type="password"] {
            padding: 10px;
            font-size: 16px;
            margin-bottom: 20px;
            border: 1px solid #dddddd;
            border-radius: 5px;
        }
        .reset-button {
            background-color: #007bff;
            color: #ffffff;
            padding: 12px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
        }
        .reset-button:hover {
            background-color: #0056b3;
        }
        .message {
            text-align: center;
            font-size: 14px;
            margin-top: 20px;
            color: #666666;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Reset Your Password</h2>
        <form action="/api/password-reset/reset" method="post">
            <input type="hidden" name="token" value="<?= isset($token) ? $token : '' ?>">
            <label for="password">New Password</label>
            <input type="password" id="password" name="password" required>

            <label for="confirm_password">Confirm Password</label>
            <input type="password" id="confirm_password" name="confirm_password" required>

            <button type="submit" class="reset-button">Reset Password</button>
        </form>
        <div class="message">
            <?= isset($error) ? $error : '' ?>
        </div>
    </div>
</body>
</html>