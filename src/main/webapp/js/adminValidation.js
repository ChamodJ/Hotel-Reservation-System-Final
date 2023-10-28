function AddHotelValidation() {
    var hotelId = document.getElementById("Hotel_id").value;
    var location = document.getElementById("Location").value;
    var contactNo = document.getElementById("Contact_info").value;

    if (hotelId === "" || location === "" || contactNo === "") {
        alert("All fields are required");
        return false;
    }

    if (validContactNo(contactNo) === false) {
        alert("Invalid Contact Number");
        return false;
    }

    return true;
}


function validContactNo(contactNo) {

	var ptn = /^\d{10}$/;
	
	if (ptn.test(contactNo)) {
		return true;
	}
	
	else {
		return false;
	}
}

function AddRoomValidation() {
    var roomId = document.getElementById("Room_Id").value;
    var hotelId = document.getElementById("Hotel_id").value;
    var type = document.getElementById("Type").value;
    var price = document.getElementById("Price").value;
    var bCount = document.getElementById("bed_count").value;
    var tCount = document.getElementById("Total_rooms").value;
    var rRooms = document.getElementById("Reserved_room").value;
    

    if (hotelId === "" || roomId === "" || type === "" || price === ""|| bCount === "" || tCount === "" || rRooms === "") {
        alert("All fields are required");
        return false;
    }
    
    if (rRooms != 0) {
		alert("Reserved Rooms Must Be 0")
		return false;
	}

    return true;
}