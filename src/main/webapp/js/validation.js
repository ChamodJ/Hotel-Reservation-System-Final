function registrationValidateForm() {
            
            var name = document.getElementById("user-name").value;
            var email = document.getElementById("user-email").value;
            var mobile = document.getElementById("user-mobile").value;
            var address = document.getElementById("user-address").value;
            var password = document.getElementById("pass").value;
            var confirmPassword = document.getElementById("con-pass").value;
            var termsCheckbox = document.getElementById("terms-checkbox-37");
            

            if (name === "" || email === "" || mobile === "" || address === "" || password === "" || confirmPassword === "") {
                alert("All fields are required");
                return false;
            }
            
            if (validateMobile(mobile) == false) {
				alert("Invalid mobile format");
                return false;
			}
            
            if (password.length < 5 ) {
				alert("Invalid Password.\nPassword should minimum 5 characters");
                return false;
			}

            if (password !== confirmPassword) {
                alert("Passwords do not match");
                return false;
            }

            if (!termsCheckbox.checked) {
                alert("Please accept the Terms and Conditions");
                return false;
            }

            return true; 
        }
        
        
function validateMobile(mobile) {
	var ptn = /^\d{10}$/;
				
	if (ptn.test(mobile)) {
		return true;
	}
				
	else {
		return false;
	}
}
        

function loginValidateForm(){
	var email = document.getElementById("email").value;
	var pass = document.getElementById("pass").value;
	
	if (email === "" || pass === "") {
		alert("All fields are required");
        return false;
	}
	
	return true;
	
}