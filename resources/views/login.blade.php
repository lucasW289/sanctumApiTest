<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login</title>
    <link rel="stylesheet" href="{{ asset('css/loginStyle.css') }}">

</head>

<body>
    <h2>User Login</h2>

    @if ($errors->any())
    <div>
        <ul>
            @foreach ($errors->all() as $error)
            <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
    @endif

    <form id="loginForm" method="POST" action="{{ url('/api/login') }}">
        @csrf

        <div>
            <label for="email">Email</label>
            <input type="email" id="email" name="email" value="{{ old('email') }}" required>
        </div>

        <div>
            <label for="password">Password</label>
            <input type="password" id="password" name="password" required>
        </div>

        <button type="submit">Login</button>
    </form>

    <p>Don't have an account? <a href="{{ url('/register') }}">Register here</a></p>

    <script>
        document.getElementById('loginForm').addEventListener('submit', function(event) {
            event.preventDefault(); // Prevent default form submission

            fetch('/api/login', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'Accept': 'application/json', // Ensure API responds with JSON
                    },
                    body: JSON.stringify({
                        email: document.getElementById('email').value,
                        password: document.getElementById('password').value
                    }),
                })
                .then(response => response.json())
                .then(data => {
                    if (data.status === true) {
                        // Successful login
                        localStorage.setItem('token', data.token); // Store token securely

                        // Redirect to the 'profile' route
                        window.location.href = data.redirect;
                        alert("im here")
                    } else {
                        // Handle error or display message
                        console.error(data.message);
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                });
        });
    </script>
</body>

</html>
