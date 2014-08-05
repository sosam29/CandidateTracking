<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Communication</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- <link rel="stylesheet" type="text/css" href="../lib/JS/jquery.datetimepicker.css"/> -->
<!-- <script src="../lib/JS/jquery.js"></script> -->
<!-- <script src="../lib/JS/jquery.datetimepicker.js"></script> -->
<script>
    $(document).ready(function() {
      $('.form_error').hide();
      $('#submit').click(function(){
           var finalclientname = $('#endclientname').val();
           var dat = $('#datetimepicker').val();
           var clientname = $('#submittedbyname').val();
           var candidate= $('#candidatename').val();
                    
            if(clientname== '')
            {
               $('#submittedbyname').next().show();
               return false;
            }
         
            if(candidate== '')
            {
                $('#candidatename').next().show();
                return false;
            }
            if (!IsDate(dat))
            {
            return false;	
            }
            function IsDate(dat)
            {
              var currVal = dat;
              if (currVal=='')
            	  {
            	  $('#datetimepicker').next().show();
              	return false;            	  
            	  }
          	  var rxDatePattern = /^(\d{1,2})(\/|-)(\d{1,2})(\/|-)(\d{4})$/;
          	  var dtArray = currVal.match(rxDatePattern); // is format OK?
          	 
          	  if (dtArray == null)
          	     return false;
          	  
          	  //Checks for mm/dd/yyyy format.
          	  dtMonth = dtArray[1];
          	  dtDay= dtArray[3];
          	  dtYear = dtArray[5];
          	 
          	  if (dtMonth < 1 || dtMonth > 12)
          	      return false;
          	  else if (dtDay < 1 || dtDay> 31)
          	      return false;
          	  else if ((dtMonth==4 || dtMonth==6 || dtMonth==9 || dtMonth==11) && dtDay ==31)
          	      return false;
          	  else if (dtMonth == 2)
          	  {
          	     var isleap = (dtYear % 4 == 0 && (dtYear % 100 != 0 || dtYear % 400 == 0));
          	     if (dtDay> 29 || (dtDay ==29 && !isleap))
          	          return false;
          	  }
          	  return true;
            }
            $.post("savescommunication.jsp", $("#AddCommunication").serialize(),  function(response) {
            $('#AddCommunication').fadeOut('slow',function(){
            	//TODO: Comment this alert in production
            	alert('Data saved');
                /* $('#success').html('<b>candidate info saved.</d>');
                $('#success').fadeIn('slow'); */
            	$('#AddCommunication').each(function(){
                    this.reset();   //Here form fields will be cleared.
                });
            	$('#AddCommunication').fadeIn('fast');
               });
            
             });
            
      });
  });
      
      </script>
</head>
<body>
	<form action="" method="post" id="AddCommunication">
		<table class="client-table">
			<tr>
				<td><label for="txtclientname">End Client Name :</label></td>
				<td class="name"><input name="txtendclientname" id="endclientname" type="text"
					class="comm-input"><span class="form_error">Please
						select Client name</span></td>
			</tr>
			<tr>
				<td><label for="txtclientname">Submitted by:</label></td>
				<td class="name"><input name="txtsubmittedby" id="submittedbyname" type="text"
					class="comm-input"><span class="form_error">Please
						select Client name</span></td>
			</tr>
			<tr>
				<td><label for="candidateselection">Candidate:</label></td>
				<td class="selcandidate"><input name="txtcandidate" 
				id="candidatename" type="text" class="comm-input">
				<span class="form_error">Please select Candidate</span></td>
			</tr>
			<tr>
				<td><label for="attachment">Attachment(up to 500KB):</label></td>
				<td class="attachment-class">
				<!--  <input type="hidden" name="MAX_FILE_SIZE" value="500" />
				<input type="file" name="uploadField" id="attachment" class="comm-input"  /> -->
				<textarea name="txtattachment" id="attachment"class="comm-input"></textarea>				
				<span class="form_error">Please select attachment of size less than 500KB</span></td>
			</tr>
			<tr>
				<td><label for="status">Status Date:</label></td>
				<td class="statusdate-class">
			   <input id="datetimepicker" name="statusdate" class="comm-input" type="text" >
			   <span class="form_error">Please select date in the format : mm/dd/yyyy</span></td>
			</tr>
			<tr>
				<td><label for="status">Status:</label></td>
				<td class="attachment-class">
				<select class="status-class" id="statusselect" name="status">
					<option value="Submitted">Submitted</option>
					<option value="Awaiting from endClient">Awaiting from endClient</option>
					<option value="Interview Scheduled">Interview Scheduled</option>
					<option value="Interview done">Interview done</option>
					<option value="Selected">Selected</option>
					<option value="Rejected">Rejected</option>
					<option value="Awaiting Interview feedback">Awaiting Interview feedback</option>
					<option value="Awaiting Work Order">Awaiting Work Order</option>
					<option value="Others">Others</option>
					<option value="Rate Negotiation">Rate Negotiation</option>				
				</select>
				<!-- <input type="text" name="txtstatus" id="status" class="comm-input"/>
				<span class="form_error">Please Enter Status</span> -->
				</td>
			</tr>
			
			<tr>
				<td><input type="submit" class="commform-buttons" id="submit"
					value="Send" /> <input type="reset" class="commform-buttons"
					id="" value="Clear" /></td>
			</tr>
		</table>
	</form>
</body>
</html> 