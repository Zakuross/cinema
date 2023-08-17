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
        number: e.target[2].value,
    }
    if (data.login == "") {
        window.alert("Username can't be empty!")
    } else if (data.password == "") {
        window.alert("Password can't be empty!")
    } else if (data.number.length != 9 || !Number.isInteger(parseInt(data.number))) {
        window.alert("Wrong number! (it must contains 9 digits)")
    } else {
        fetch('./register.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(data),
        })
            .then(response => response.json())
            .then(data => {
                if (data.stworzono) {
                    window.alert("Registered successfully!")
                    window.location.href = "../login"
                } else {
                    window.alert("User with this name already exists")
                }
            })
            .catch((error) => {
                window.alert('Unexpected error occurred: ' + error);
            });
    }
})