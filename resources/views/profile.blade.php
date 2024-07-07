<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link rel="stylesheet" href="{{ asset('css/profileStyle.css') }}">
</head>

<body>
    <div class="container">
        <h2>Welcome, <span id="user-name"></span></h2>

        <div class="profile-info">
            <h3>Your Profile Information</h3>
            <p><strong>Name:</strong> <span id="profile-name"></span></p>
            <p><strong>Email:</strong> <span id="profile-email"></span></p>
        </div>

        <div class="logout-btn">
            <form id="logoutForm" method="POST" action="/logout">
                @csrf
                <button type="submit">Logout</button>
            </form>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            // Retrieve the token from localStorage
            const token = localStorage.getItem('token');

            // Define the API endpoint
            const apiEndpoint = '/api/profile';

            // Make the GET request with the Bearer token
            fetch(apiEndpoint, {
                    method: 'GET',
                    headers: {
                        'Authorization': `Bearer ${token}`,
                        'Content-Type': 'application/json'
                    }
                })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok ' + response.statusText);
                    }
                    return response.json();
                })
                .then(data => {
                    // Extract the user data from the response
                    const user = data.user;

                    // Update the HTML content with the user's profile information
                    document.getElementById('user-name').textContent = user.name;
                    document.getElementById('profile-name').textContent = user.name;
                    document.getElementById('profile-email').textContent = user.email;
                })
                .catch(error => {
                    console.error('There was a problem with the fetch operation:', error);
                });

            // Handle form submission for logout
            document.getElementById('logoutForm').addEventListener('submit', async (event) => {
                event.preventDefault();
                // Clear token from localStorage
                localStorage.removeItem('token');
                // Redirect to login page
                window.location.href = '/login'; // Replace with your actual login page URL
            });
        });
    </script>

</body>

</html>
