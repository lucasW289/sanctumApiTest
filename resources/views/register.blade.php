<!-- resources/views/register.blade.php -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <link rel="stylesheet" href="{{ asset('css/registerStyle.css') }}">
    <!-- Include SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
</head>
<body>
    <h2>User Registration</h2>

    @if ($errors->any())
        <div>
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <form id="registerForm" method="POST" action="{{ route('registerApi') }}">
        @csrf

        <div>
            <label for="name">Name</label>
            <input type="text" id="name" name="name" value="{{ old('name') }}" required autofocus>
        </div>

        <div>
            <label for="email">Email</label>
            <input type="email" id="email" name="email" value="{{ old('email') }}" required>
        </div>

        <div>
            <label for="password">Password</label>
            <input type="password" id="password" name="password" required>
        </div>

        <button type="submit">Register</button>
    </form>

    <p>Already registered? <a href="{{ url('/login') }}">Login here</a></p>

    <!-- Include SweetAlert2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const registerForm = document.getElementById('registerForm');
            registerForm.addEventListener('submit', function (event) {
                event.preventDefault();

                fetch('{{ route('registerApi') }}', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({
                        name: document.getElementById('name').value,
                        email: document.getElementById('email').value,
                        password: document.getElementById('password').value,
                    }),
                })
                .then(response => response.json())
                .then(data => {
                    if (data.status) {
                        // Show SweetAlert for success
                        Swal.fire({
                            icon: 'success',
                            title: 'Registration Successful!',
                            text: 'Redirecting to profile page...',
                            timer: 2000,
                            timerProgressBar: true,
                            showConfirmButton: false
                        }).then(() => {
                            localStorage.setItem('token', data.token);
                            window.location.href = data.redirect;
                        });
                    } else {
                        // Show SweetAlert for failure
                        Swal.fire({
                            icon: 'error',
                            title: 'Registration Failed',
                            text: data.message // Display error message from API
                        });
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('An error occurred, please try again later.');
                });
            });
        });
    </script>

</body>
</html>
