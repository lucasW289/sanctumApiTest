<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
</head>
<body>
    <h2>Welcome, {{ $user->name }}</h2>

    <div>
        <h3>Your Profile Information</h3>
        <p><strong>Name:</strong> {{ $user->name }}</p>
        <p><strong>Email:</strong> {{ $user->email }}</p>
    </div>

    <form method="POST" action="{{ url('/api/logout') }}">
        @csrf
        <button type="submit">Logout</button>
    </form>
</body>
<script>

    doc
</script>
</html>
