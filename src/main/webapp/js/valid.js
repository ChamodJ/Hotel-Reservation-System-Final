/**
 * 
 */
/**
 * 
 */
console.log("This is a message to the console.");
 function showProfileForm() {
	     console.log("This is a message to the consonnnle.");
        	toggleActive(event.currentTarget);
            document.getElementById("profile-form").style.display = "block";
            document.getElementById("change-password-form").style.display = "none";
            
        }

        function showChangePasswordForm() {
        	toggleActive(event.currentTarget);
            document.getElementById("change-password-form").style.display = "block";
            document.getElementById("profile-form").style.display = "none";
            
         
        }
        
        function toggleActive(clickedItem) {
            // Remove "active" class from all navigation items
            var navItems = document.querySelectorAll('.sidebar a');
            for (var i = 0; i < navItems.length; i++) {
                navItems[i].classList.remove('active');
            }

            // Add "active" class to the clicked navigation item
            clickedItem.classList.add('active');
        }

function checkPasswordMatch() {
        const password = document.getElementById('newPassword').value;
        const confirmPassword = document.getElementById('confirmPassword').value;
        const passwordMatch = document.getElementById('passwordMatch');
        const submitButton = document.getElementById('submitButton');

        if (password !== confirmPassword) {
            passwordMatch.textContent = "Passwords do not match";
            submitButton.disabled = true; // Disable the button
        } else {
            passwordMatch.textContent = "";
            submitButton.disabled = false; // Enable the button
        }
    }
    

    function toggleUserDropdown() {
		console.log("This is a message to the console.");
        var dropdown = document.getElementById("userDropdown");
        if (dropdown.style.display === "block") {
            dropdown.style.display = "none";
        } else {
            dropdown.style.display = "block";
        }
    }
    
    function updateGuestOptions() {
    var roomTypeSelect = document.getElementById("room");
     
    var guestSelect = document.getElementById("guest");
    
    console.log("UpdateGuestOptions called");

    // Get the selected room type
    var selectedRoomType = roomTypeSelect.value;
    console.log("UpdateGhere called");
console.log("Selected Room Type: " + selectedRoomType);
    // Clear existing options
    guestSelect.innerHTML = "";

    // Add options based on the selected room type
    if (selectedRoomType === "Family Room") {
        for (var i = 1; i <= 5; i++) {
            var option = document.createElement("option");
            option.value = i;
            option.text = i;
            guestSelect.appendChild(option);
        }
    } else if (selectedRoomType === "Deluxe Rooms") {
          for (var i = 1; i <= 5; i++) {
            var option = document.createElement("option");
            option.value = i;
            option.text = i;
            guestSelect.appendChild(option);
        } 
    }else if (selectedRoomType === "Honeymoon Suite") {
          for (var i = 1; i <= 2; i++) {
            var option = document.createElement("option");
            option.value = i;
            option.text = i;
            guestSelect.appendChild(option);
    }
    }else if (selectedRoomType === "Presidential Suite") {
          for (var i = 1; i <= 10; i++) {
            var option = document.createElement("option");
            option.value = i;
            option.text = i;
            guestSelect.appendChild(option);
    }
    }else if (selectedRoomType === "Villa Suite") {
          for (var i = 1; i <= 15; i++) {
            var option = document.createElement("option");
            option.value = i;
            option.text = i;
            guestSelect.appendChild(option);
    }
    }
    else
    {for (var i = 1; i <= 15; i++) {
            var option = document.createElement("option");
            option.value = i;
            option.text = i;
            guestSelect.appendChild(option);
    }}
}

// Call the function initially to populate based on the current room type
updateGuestOptions();


function setCurrentDate() {
    var today = new Date();
    var day = String(today.getDate()).padStart(2, '0');
    var month = String(today.getMonth() + 1).padStart(2, '0'); // Months are zero-based
    var year = today.getFullYear();
    var currentDate = year + '-' + month + '-' + day;

    document.getElementById('reservationDate').value = currentDate;
}

// Call the function to set the current date when the page loads
setCurrentDate();

function validateCheckinDate() {
    const currentDate = new Date();
    var checkinDateInput = document.getElementById('checkin');
    var checkinDate = new Date(checkinDateInput.value);
     const checkinmsg = document.getElementById('checkinerror');
     const submit = document.getElementById('submitButton');

    if (checkinDate <= currentDate) {
		checkinmsg.textContent = "Check-in date must be greater than the current date.";
		submit.disabled = true;
		
        
    } else {
        checkinmsg.textContent = "";
        submit.disabled = false;
    }
}

function validateCheckoutDate() {
    var checkoutDateInput = document.getElementById('checkout');
    var checkoutDate = new Date(checkoutDateInput.value);
    var checkinDateInput = document.getElementById('checkin');
    var checkinDate = new Date(checkinDateInput.value);
    const checkoutmsg = document.getElementById('checkouterror');
    const submit = document.getElementById('submitButton');

    if (checkoutDate <= checkinDate) {
        checkoutmsg.textContent = "Check-out date must be greater than the Check-in date.";
		submit.disabled = true;
    } else {
        checkoutmsg.textContent = "";
        submit.disabled = false;
    }
}

    