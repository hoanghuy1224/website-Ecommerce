<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form Đăng Nhập và Đăng Ký</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            width: 100%;
            max-width: 400px;
            background: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .form-container {
            display: flex;
            flex-direction: column;
        }

        .form-inner {
            display: flex;
            flex-direction: column;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        h2 {
            margin-bottom: 20px;
            text-align: center;
        }

        input {
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }

        button {
            padding: 10px;
            background-color: #007bff;
            border: none;
            border-radius: 4px;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

        .switch-form {
            text-align: center;
            margin-top: 15px;
        }

        .switch-form a {
            color: #007bff;
            text-decoration: none;
        }

        .switch-form a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-container">
            <div class="form-inner">
                <!-- Form Đăng Nhập -->
                <form id="loginForm" action="login" method="post">
                    <h2>Đăng Nhập</h2>
                    <input type="text" name="username" placeholder="Tên đăng nhập" required>
                    <input type="password" name="password" placeholder="Mật khẩu" required>
                    <button type="submit">Đăng Nhập</button>
                    <p class="switch-form">Chưa có tài khoản? <a href="#" onclick="switchForm()">Đăng ký</a></p>
                </form>

                <!-- Form Đăng Ký -->
                <form id="registerForm" style="display: none;" action="adduser" method="post">
                    <h2>Đăng Ký</h2>
                    <input type="text" name="username" placeholder="Tên đăng nhập" required>
                    <input type="email" name="email" placeholder="Email" required>
                    <input type="password" name="password" placeholder="Mật khẩu" required>                
                    <input type="text" name="role" placeholder="">
                    <button type="submit">Đăng Ký</button>
                    <p class="switch-form">Đã có tài khoản? <a href="#" onclick="switchForm()">Đăng nhập</a></p>
                </form>
            </div>
        </div>
    </div>

    <script>
        function switchForm() {
            const loginForm = document.getElementById('loginForm');
            const registerForm = document.getElementById('registerForm');
            if (loginForm.style.display === 'none') {
                loginForm.style.display = 'block';
                registerForm.style.display = 'none';
            } else {
                loginForm.style.display = 'none';
                registerForm.style.display = 'block';
            }
        }
    </script>
</body>
</html>
