//logout buttonUnexpected error occured
fetch('./session.php')
    .then(response => response.json())
    .then(data => {
        if (data.logged) {
            document.getElementById("logged").style.display = "flex"
            document.getElementById("nologged").style.display = "none"
        } else {
            document.getElementById("logged").style.display = "none"
            document.getElementById("nologged").style.display = "flex"
        }
    })
    .catch((error) => {
        window.alert('Unexpected error occurred: ' + error);
    });

//display films
fetch('./films.php')
    .then(response => response.json())
    .then(data => {
        if (data) {
            let content = document.getElementById("content")
            content.innerHTML = "<h2>Films:</h2>"
            data.forEach(element => {
                let div = document.createElement("div")
                div.innerText = element.title
                div.classList.add("films")
                div.addEventListener("click", () => screenings(element.id))
                content.appendChild(div)
            });
        }
    })
    .catch((error) => {
        window.alert('Unexpected error occurred: ' + error);
    });

//display screenings
function screenings(film) {
    fetch('./screenings.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ id: film }),
    })
        .then(response => response.json())
        .then(data => {
            if (data) {
                let content = document.getElementById("content")
                content.innerHTML = "<h2>Screenings:</h2>"
                data.forEach(element => {
                    let div = document.createElement("div")
                    div.innerText = element.date + " " + element.time
                    div.classList.add("films")
                    div.addEventListener("click", () => reservations(element.id))
                    content.appendChild(div)
                });
            }
        })
        .catch((error) => {
            window.alert('Unexpected error occurred: ' + error);
        });
}

//display reservations
let placesTab = []
function reservations(reservation) {
    fetch('./reservations.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ id: reservation }),
    })
        .then(response => response.json())
        .then(data => {

            fetch('./session.php')
                .then(response => response.json())
                .then(data1 => {
                    let content = document.getElementById("content")
                    content.innerHTML = "<h2>Places:</h2>"
                    let places = document.createElement("div")
                    places.id = "places"
                    content.appendChild(places)
                    for (let i = 0; i < 300; i++) {
                        let div = document.createElement("div")
                        div.classList.add("place")
                        if (data1.logged) {
                            div.addEventListener("click", () => { choose(i) })
                            div.style.cursor = "pointer"
                        }
                        if (data.reservations) {
                            data.tab.map((el) => {
                                if (el.place == i) {
                                    if (data1.logged && data1.user_id == el.user_id) div.style.backgroundColor = "red"
                                    else div.style.backgroundColor = "gray"
                                    div.style.cursor = ""
                                }
                            })
                        }
                        places.appendChild(div)
                    }
                    if (data1.logged) {
                        let button = document.createElement("button")
                        button.innerText = "Reserve"
                        button.addEventListener("click", () => { reservate(reservation, data1.user_id) })
                        content.appendChild(button)
                    }
                })
                .catch((error) => {
                    window.alert('Unexpected error occurred: ' + error);
                });
        })
        .catch((error) => {
            window.alert('Unexpected error occurred: ' + error);
        });
}

//choose place
function choose(place_id) {
    let div = document.getElementsByClassName("place")[place_id]
    if (div.style.backgroundColor == "gray" || div.style.backgroundColor == "red") {

    } else if (div.style.backgroundColor == "") {
        placesTab.push(place_id)
        div.style.backgroundColor = "green"
    } else {
        div.style.backgroundColor = ""
        placesTab.splice(placesTab.indexOf(place_id), 1)
    }
}

//reserve place
function reservate(screening_id, user_id) {
    fetch('./reservate.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ screening_id: screening_id, places: placesTab, user_id: user_id }),
    })
    setTimeout(() => {
        window.location.href = "./"
    }, 100);
}

//log out
function logOut() {
    fetch('./logout.php')
    setTimeout(() => {
        window.location.href = "./"
    }, 50);
}