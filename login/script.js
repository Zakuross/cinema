fetch('../session.php')
    .then(response => response.json())
    .then(data => {
        if (data.logged) {
            window.location.href = "../"
        }
    })
    .catch((error) => {
        window.alert('Unexpected error occurred: ' + error);
    });

document.getElementById("form").addEventListener("submit", (e) => {
    e.preventDefault()
    let data = {
        login: e.target[0].value,
        password: e.target[1].value,
    }
    if (data.login == "") {
        window.alert("Username can't be empty!")
    } else if (data.password == "") {
        window.alert("Password can't be empty!")
    } else {
        fetch('./login.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(data),
        })
            .then(response => response.json())
            .then(data => {
                if (data.zalogowano) {
                    window.alert("Logged successfully!")
                    window.location.href = "../"
                } else {
                    window.alert("Wrong username or password")
                    window.location.href = "./"
                }
            })
            .catch((error) => {
                window.alert('Unexpected error occurred: ' + error);
            });
    }
})