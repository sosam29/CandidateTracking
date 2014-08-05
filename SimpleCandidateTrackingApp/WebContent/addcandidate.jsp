<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add new Candidate</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
    $(document).ready(function() {
      $('.form_error').hide();
      $('#submit').click(function(){
           var name = $('#name').val();
           var email = $('#email').val();
           var phone = $('#phone').val();
           //var message = $('#message').val();
           if(name== ''){
              $('#name').next().show();
              return false;
            }
            if(email== ''){
               $('#email').next().show();
               return false;
            }
            if(IsEmail(email)==false){
                $('#invalid_email').show();
                return false;
            }

            if(phone== ''){
                $('#phone').next().show();
                return false;
            }
           /*  if(message== ''){
                $('#message').next().show();
                return false;
            } */
            //ajax call php page
            $.post("savecandidate.jsp", $("#addcandidate").serialize(),  function(response) {
            $('#addcandidate').fadeOut('slow',function(){
            	//TODO: Comment this alert in production
            	alert('Data saved');
                /* $('#success').html('<b>candidate info saved.</d>');
                $('#success').fadeIn('slow'); */
            	$('#addcandidate').each(function(){
                    this.reset();   //Here form fields will be cleared.
                });
            	$('#addcandidate').fadeIn('fast');
               });
            
             });
             return false;
          });
      });
      function IsEmail(email) {
        var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        if(!regex.test(email))
        {
           return false;
        }else
        {
        	//check for duplicate email
        	function checkemail(email)
        	{
        		// call servlet and get the response about any record with same name
        		// if we have any we will return duplicate
        		// else we will store that record into Database.
        		$.post("TrackingApplication.jsp", {"txtemail": email}, function(data){
        			if(data>0) return false;
        		});
        	}
           return true;
        }
      }
      </script>
</head>
<body>
<!-- 	<form name="save" action="savecandidate.jsp" method="POST"> 
	<td><label for="txtname">Name :</label></td>
	Name: <input type="text" name="txtname"></input><p/>
	Email:<input type="text" name="txtemail" ></input><p/>
	Address: <input type="text" name="txtaddress"></input><p/>
	<!-- City: <input type="text" name="txtcity"></input> <p/>
	State: <input type="text" name="txtstate"></input> <p/>
	Zip: <input type="text" name="txtzip"></input><p/> 
	Phone: <input type="text" name="txtphone"></input> <p/>
	<input type=submit value="Add New Candidate">
	<input type="reset" class="contactform-buttons" id="" value="Clear" />
	 </form> --> 
	<form action="" method="post" id="addcandidate">
		<table class="contact-table">
			<tr>
				<td><label for="txtname">Name :</label></td>
				<td class="name"><input name="txtname" id="name" type="text"
					 class="contact-input"><span
					class="form_error">Please enter your name</span></td>
			</tr>
			<tr>
				<td><label for="txtemail">Email :</label></td>
				<td class="email"><input name="txtemail" id="email" type="text"
					class="contact-input"><span
					class="form_error">Please enter your email</span> <span
					class="form_error" id="invalid_email">This email is not
						valid</span></td>
			</tr>
			<tr>
				<td><label for="txtphone">Phone :</label></td>
				<td class="phone"><input name="txtphone" id="phone" type="text"
					class="contact-input"><span
					class="form_error">Please enter your phone</span></td>
			</tr>
			<tr>
				<td><label for="txtaddress">Address :</label></td>
				<td class="message"><textarea name="txtaddress" id="address"
						class="contact-input"></textarea><span class="form_error">Please
						enter your Address</span></td>
			</tr>
			<tr>
				<td><label for="txtzip">Zip :</label></td>
				<td class="txtzip"><input name="txtzip" id="zip" type="text"
					class="contact-input"><span
					class="form_error">Please enter your zip</span> </td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" class="contactform-buttons"
					id="submit" value="Send" /> 
					<input type="reset"  class="contactform-buttons" id="" value="Clear" /></td>
			</tr>
		</table>
	</form>
</body>
</html> 