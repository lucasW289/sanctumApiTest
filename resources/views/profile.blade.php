<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link rel="stylesheet" href="{{ asset('css/profileStyle.css') }}">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body>
    <div class="container">
        <h2>Welcome, <span id="user-name"></span></h2>

        <div class="profile-info">
            <h3>Your Profile Information</h3>
            <p><strong>Name:</strong> <span id="profile-name"></span></p>
            <p><strong>Email:</strong> <span id="profile-email"></span></p>
        </div>

        <div class="file-upload">
            <h3>Upload File</h3>
            <form id="uploadForm" enctype="multipart/form-data">
                @csrf
                <input type="file" name="file" id="fileInput">
                <button type="submit">Upload</button>
            </form>
        </div>

        <div class="files-list">
            <h3>Your Uploaded Files</h3>
            <ul id="filesList"></ul>
            <button id="shareButton">Share</button>
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
            const token = localStorage.getItem('token');
            const apiEndpoint = '/api/profile';

            fetch(apiEndpoint, {
                    method: 'GET',
                    headers: {
                        'Authorization': `Bearer ${token}`,
                        'Content-Type': 'application/json'
                    }
                })
                .then(response => response.json())
                .then(data => {
                    const user = data.user;
                    document.getElementById('user-name').textContent = user.name;
                    document.getElementById('profile-name').textContent = user.name;
                    document.getElementById('profile-email').textContent = user.email;
                    loadUserFiles();
                })
                .catch(error => console.error('There was a problem with the fetch operation:', error));

            document.getElementById('uploadForm').addEventListener('submit', (event) => {
                event.preventDefault();
                const fileInput = document.getElementById('fileInput');
                const formData = new FormData();
                formData.append('file', fileInput.files[0]);

                fetch('/api/upload-file', {
                        method: 'POST',
                        headers: {
                            'Authorization': `Bearer ${token}`,
                        },
                        body: formData
                    })
                    .then(response => response.json())
                    .then(data => {
                        if (data.status) {
                            Swal.fire({
                                icon: 'success',
                                title: 'Success',
                                text: 'File uploaded successfully'
                            });
                            loadUserFiles();
                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: 'Error',
                                text: 'File upload failed'
                            });
                        }
                    })
                    .catch(error => {
                        Swal.fire({
                            icon: 'error',
                            title: 'Error',
                            text: 'There was a problem with the fetch operation'
                        });
                        console.error('There was a problem with the fetch operation:', error);
                    });
            });

            document.getElementById('shareButton').addEventListener('click', () => {
                const checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');
                if (checkboxes.length === 0) {
                    Swal.fire({
                        icon: 'warning',
                        title: 'No Files Selected',
                        text: 'Please select files to share.'
                    });
                    return;
                }

                Swal.fire({
                    title: 'Share Files',
                    html: '<input id="emailInput" class="swal2-input" placeholder="Enter Email Address">',
                    showCancelButton: true,
                    confirmButtonText: 'Share',
                    preConfirm: () => {
                        const email = document.getElementById('emailInput').value;
                        if (!email) {
                            Swal.showValidationMessage('Email address is required');
                        }
                        return email;
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        const email = result.value;
                        shareFiles(email, checkboxes);
                    }
                });
            });

            function shareFiles(email, checkboxes) {
                const fileIds = Array.from(checkboxes).map(checkbox => checkbox.value);

                fetch('/api/share-files', {
                        method: 'POST',
                        headers: {
                            'Authorization': `Bearer ${token}`,
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify({
                            email: email,
                            fileIds: fileIds
                        })
                    })
                    .then(response => response.json())
                    .then(data => {
                        if (data.status) {
                            Swal.fire({
                                icon: 'success',
                                title: 'Files Shared',
                                text: 'Selected files were successfully shared.'
                            });
                            loadUserFiles();
                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: 'Error',
                                text: data.message
                            });
                        }
                    })
                    .catch(error => {
                        Swal.fire({
                            icon: 'error',
                            title: 'Error',
                            text: 'There was a problem with the fetch operation'
                        });
                        console.error('There was a problem with the fetch operation:', error);
                    });
            }

            function loadUserFiles() {
                fetch('/api/files', {
                        method: 'GET',
                        headers: {
                            'Authorization': `Bearer ${token}`,
                            'Content-Type': 'application/json'
                        }
                    })
                    .then(response => response.json())
                    .then(data => {
                        const filesList = document.getElementById('filesList');
                        filesList.innerHTML = '';
                        data.files.forEach(file => {
                            const li = document.createElement('li');
                            const checkbox = document.createElement('input');
                            checkbox.type = 'checkbox';
                            checkbox.value = file.id;

                            const fileName = document.createElement('span');
                            fileName.textContent = file.file_name;

                            const downloadBtn = document.createElement('button');
                            downloadBtn.textContent = 'Download';
                            downloadBtn.addEventListener('click', () => {
                                downloadFile(file.id);
                            });

                            li.appendChild(checkbox);
                            li.appendChild(fileName);
                            li.appendChild(downloadBtn);
                            filesList.appendChild(li);
                        });
                    })
                    .catch(error => console.error('There was a problem with the fetch operation:', error));
            }

            function downloadFile(fileId) {
                fetch(`/api/download-file/${fileId}`, {
                        method: 'GET',
                        headers: {
                            'Authorization': `Bearer ${token}`,
                            'Content-Type': 'application/json'
                        }
                    })
                    .then(response => {
                        if (!response.ok) {
                            throw new Error('Network response was not ok');
                        }
                        return response.blob();
                    })
                    .then(blob => {
                        const url = window.URL.createObjectURL(blob);
                        const a = document.createElement('a');
                        a.style.display = 'none';
                        a.href = url;
                        a.download = 'file'; // You can set the file name here
                        document.body.appendChild(a);
                        a.click();
                        window.URL.revokeObjectURL(url);
                    })
                    .catch(error => console.error('There was a problem with the fetch operation:', error));
            }

            document.getElementById('logoutForm').addEventListener('submit', (event) => {
                event.preventDefault();
                localStorage.removeItem('token');
                window.location.href = '/login';
            });
        });
    </script>

</body>

</html>
