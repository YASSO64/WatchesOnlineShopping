window.onload=function()

{
	
submitbutton=document.getElementById('login1');
addbutton=document.getElementById('addbtn');



  user_firstname= document.getElementById('firstn');
  
  user_lastname= document.getElementById('lastn');
  
  user_password= document.getElementById('userpass');
  
  user_age= document.getElementById('userpassretype');
  
  user_email= document.getElementById('useremail');
  
  user_country= document.getElementById('usercountry');
  
  user_address= document.getElementById('adress');
 user_birthday= document.getElementById('date');
 
  
  //------------------------------------------------
  addbutton.onclick=function(){
			
			country_name = document.getElementById('countryadd').value;
		
			 var option = document.createElement("option");
             option.text = country_name ;
             option.value = "countery entered";
             var select = document.getElementById("my-select-box");
             select.appendChild(option);
			  document.getElementById('countryadd').value="";
		      
			
		}
function validation()
{
	
  
  

 this.checkfirstname=function allLetter()  
{   
var letters = /^[A-Za-z]+$/;  

var length=user_firstname.value.length;
if(length>0&&user_firstname.value.match(letters))  
{  
return true;  
}  
else  
{  

document.getElementById('first').innerText='Username must have alphabet characters  only';
document.getElementById('first').style.cssText = ' width: 92%; padding:12px 20px;margin:8px 0;display: inline-block;border: 1px solid red;border:bold 1px;color:red;';
user_firstname.focus();  
return false;  
} } 



//----------------------------------------lastname-------------

this.checklastname=function allLetter()  
{  
var letters = /^[A-Za-z]+$/;  
var length=user_lastname.value.length;
if(length>0&&user_lastname.value.match(letters))  
{  
return true;  
}  
else  
{  
 
document.getElementById('last').innerText='  job must have  alphabet characters only';
document.getElementById('last').style.cssText = ' width: 92%; padding:12px 20px;margin:8px 0;display: inline-block;border: 1px solid red;border:bold 1px;color:red;';


user_lastname.focus();  
return false;  
} } 



//----------------------------------age------------------------


this.checkage=function userAge_validation()  
{  
var age_len = user_age.value.length;  
if(age_len==0 ||age_len >13 ||isNaN(user_age.value))  
{	
document.getElementById('age1').innerText="Credit number  should not be empty / Has only 14 Numbers ";
document.getElementById('age1').style.cssText = ' width: 92%; padding:12px 20px;margin:8px 0;display: inline-block;border: 1px solid red;border:bold 1px;color:red;';
user_age.focus(); 
return false; 
 
}
else
	return true;
 }


 
//---------------------------------------email-------------------


this.checkemail=function ValidateEmail()  
{
var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/; 
var length= user_email.value.length;
if(length>0&&user_email.value.match(mailformat))  
{  
return true;  
}  
else  
{  
 
document.getElementById('email2').innerText="You have entered an invalid email address!";
document.getElementById('email2').style.cssText = ' width: 92%; padding:12px 20px;margin:8px 0;display: inline-block;border: 1px solid red;border:bold 1px;color:red;';

user_email.focus();  
return false;  
}  }
//----------------------------------country---------------------------


this.checkcountry=function countryselect()  
{  
if( user_country.value == "Default")  
{  
 
document.getElementById('country1').innerText='Select your country from the list';
document.getElementById('country1').style.cssText = ' width: 92%; padding:12px 20px;margin:8px 0;display: inline-block;border: 1px solid red;border:bold 1px;color:red;';
 user_country.focus();  
return false;  
}  
else  
{  
return true;  
} }
//------------------------address-------------------------------------------


this.checkaddress=function alphanumeric( )  
{  

var letters = /^[0-9a-zA-Z]+$/;  
var length=user_address.value.length;
if( length>0&&user_address.value.match(letters))  
{  
return true;  
}  
else  
{  
document.getElementById('address1').innerText="You Must Enter Your Address";
document.getElementById('address1').style.cssText = ' width: 92%; padding:12px 20px;margin:8px 0;display: inline-block;border: 1px solid red;border:bold 1px;color:red;';

  


 user_address.focus();  
return false;  
}  
}
//password
this.checkpassword=function passwordvalidation()
{
	 
var password_len = user_password.value.length;  
if (password_len == 0 ||password_len >= 15 || password_len < 5 ||isNaN(user_password.value))  
{  
document.getElementById('password1').innerText="Enter correct password Enter 5Numbers :15Numbers" ;
document.getElementById('password1').style.cssText = ' width: 92%; padding:12px 20px;margin:8px 0;display: inline-block;border: 1px solid red;border:bold 1px;color:red;';
user_password.focus();  
return false;  
}  
return true;  
}  
//-------------------------------------------------------------------------------------------------------------------
this.checkgender=function gendercheck()
{
	var gender = document.getElementById('maletype').checked;
	var gender1 = document.getElementById('femaletype').checked;	
	
		if(gender || gender1)
		{
		}
		else
		{
		
			document.getElementById('gendertype').innerText="Must choose gender" ;
            document.getElementById('gendertype').style.cssText = ' width: 92%; padding:12px 20px;margin:8px 0;display: inline-block;border: 1px solid red;border:bold 1px;color:red;';
		}
}
//-----------------------------------------checkbox------------------------------------------------------------------
this.checkboxvalidation=function checkboxvalidate()
{
	var hob1= document.getElementById('coding').checked;
	var hob2 = document.getElementById('music').checked;	
	var hob3 = document.getElementById('playing').checked;	
	
		if(hob1 || hob2||hob3)
		{
		}
		else
		{
		
			document.getElementById('checkboxval').innerText="Must choose Hobbies" ;
            document.getElementById('checkboxval').style.cssText = ' width: 92%; padding:12px 20px;margin:8px 0;display: inline-block;border: 1px solid red;border:bold 1px;color:red;';
		}
}
this.checkBirthDay=function checkbirthday()
{
    var birthday =user_birthday.value;
    if(!isValidDate(birthday)){
       
 document.getElementById('birthday').innerText="Enter correct password Enter 5Numbers :15Numbers" ;
document.getElementById('birthday').style.cssText = ' width: 92%; padding:12px 20px;margin:8px 0;display: inline-block;border: 1px solid red;border:bold 1px;color:red;';
       


          
   
}}}

            var obj=new validation;
	
	
	      user_firstname.onchange=obj.checkfirstname;
		
		  user_lastname.onchange=obj.checklastname;
		  user_email.onchange=obj.checkemail;
		  user_age.onchange=obj.checkage;
		  user_country.onchange=obj.checkcountry;
		  user_address.onchange=obj.checkaddress;
		  user_password.onchange=obj.checkpassword;
                  user_birthday.onchange=obj.checkbirthday;
		  
		submitbutton.addEventListener('click',obj.checkfirstname,false);
		submitbutton.addEventListener('click',obj.checklastname,false);
		submitbutton.addEventListener('click',obj.checkemail,false);
		submitbutton.addEventListener('click',obj.checkcountry,false);
		submitbutton.addEventListener('click',obj.checkaddress,false);
		submitbutton.addEventListener('click',obj.checkpassword,false);
		submitbutton.addEventListener('click',obj.checkgender,false);
		submitbutton.addEventListener('click',obj.checkage,false);
		submitbutton.addEventListener('click',obj.checkboxvalidation,false);
                submitbutton.addEventListener('click',obj.checkbirthday,false);
		submitbutton.addEventListener('click',obj.openw,false);
		
		

}
 