<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Submission</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
    $(document).ready(function() {
      $('.form_error').hide();
      $('#submit').click(function(){
           var name = $('#name').val();
           var email = $('#email').val();
           var phone = $('#phone').val();
           var candidate = $('#candidate').val();
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
            if(candidate== ''){
                $('#candidate').next().show();
                return false;

            }
            $.post("savesubmission.jsp", $("#AddSubmission").serialize(),  function(response) {
            $('#AddSubmission').fadeOut('slow',function(){
            	//TODO: Comment this alert in production
            	alert('Data saved');
                /* $('#success').html('<b>candidate info saved.</d>');
                $('#success').fadeIn('slow'); */
            	$('#AddSubmission').each(function(){
                    this.reset();   //Here form fields will be cleared.
                });
            	$('#AddSubmission').fadeIn('fast');
               });
            
             });
            
      });
  });
      function IsEmail(email) {
        var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        if(!regex.test(email))
        {
           return false;
        }
        else
        {
        	 return true;
        }
      }
    
      </script>
</head>
<body>
	<form action="" method="post" id="AddSubmission">
		<table class="client-table">
			<tr>
				<td><label for="txtclientname">Client Name :</label></td>
				<td class="name"><input name="txtname" id="name" type="text"
					class="client-input"><span class="form_error">Please
						enter Client name</span></td>
			</tr>
			<tr>
				<td><label for="txtclientemail">Email :</label></td>
				<td><input type="email" name="email" id="email" class="client-input"><span class="form_error">
				Please enter client email</span>
				<span class="form_error" id="invalid_email">This is not a valid email</span> </td>
				<!-- <td class="email"><input name="txtclientemail" id="email"
					type="text" class="client-input"><span class="form_error">Please
						enter client email</span> <span class="form_error" id="invalid_email">This
						email is not valid</span></td> -->
			</tr>
			<tr>
				<td><label for="txtclientphone">Phone :</label></td>
				<td class="phone"><input name="txtclientphone" id="phone"
					type="text" class="client-input"><span class="form_error">Please
						enter Client phone</span></td>
			</tr>
			<tr>
				<td><label for="txtclientaddress">Address :</label></td>
				<td class="message"><textarea name="txtclientaddress"
						id="address" class="client-input"></textarea><span
					class="form_error">Please enter your Address</span></td>
			</tr>
			<!-- <tr>
				<td><label for="txtclientaddress2">Address2 :</label></td>
				<td class="message"><textarea name="txtclientaddress2"
						id="address2" class="client-input"></textarea><span
					class="form_error">Please enter your Address2</span></td>
			</tr>

			<tr>
				<td><label for="txtclientcity">City:</label></td>
				<td class="message"><textarea name="txtclientcity" id="city"
						class="client-input"></textarea><span class="form_error">Please
						enter your City</span></td>
			</tr>
			<tr>
				<td><label for="txtclientstate">State :</label></td>
				<td class="message"><textarea name="txtclientstate" id="state"
						class="client-input"></textarea><span class="form_error">Please
						enter your Address</span></td>
			</tr>
			<tr>
				<td><label for="txtclientzip">Zip :</label></td>
				<td class="txtclientzip"><input name="txtclientzip" id="zip"
					type="text" class="client-input"><span class="form_error">Please
						enter zip</span></td>
			</tr> -->
			<tr>
				<td><label for="txtclientcontact">Contact Person</label></td>
				<td class="txtclientcontact"><input name="txtclientcontact"
					id="clientcontact" type="text" class="client-input"><span
					class="form_error">Please enter Contact Person</span></td>
			</tr>
			<tr>
				<td><label for="candidateselection">Candidate:</label></td>
				<td class="selcandidate"><input name="txtcandidate" 
				id="candidate" type="text" class="client-input">
				<span class="form_error">Please enter Candidate</span></td>
			</tr>
			<tr>
				<td><input type="submit" class="clientform-buttons" id="submit"
					value="Send" /> <input type="reset" class="clientform-buttons"
					id="" value="Clear" /></td>
			</tr>
		</table>
	</form>
</body>
</html> 