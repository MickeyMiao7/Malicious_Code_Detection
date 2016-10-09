var contact_name="";
var contact_num="";
var contact_email="";
var scanCode = function() 
{

	window.plugins.barcodeScanner.scan
	(
        function(result)
        {
       /* alert("Scanned Code: " + result.text 
                + ". Format: " + result.TEL
                + ". Format: " + result.Email
                + ". Cancelled: " + result.cancelled);*/
        	//alert("Scanned Code: " + result.text );
            string=result.text;
            //alert(string);
            if(string.indexOf('MECARD')!=-1)
            	{
            	//alert("in mecard");
			            var arr=string.split(';');
			          //  alert("arr len "+arr.length);
			            flag=0;
			            for(var i=0;i<arr.length;i++)
			            	{	// alert("arr[i] "+arr[i]);
			            	if(arr[i].indexOf('N')!=-1)
	            			{
	            				flag=1;
	            				nm=arr[i].split(":");
	            				var len=nm.length;
	            				//alert("nm "+nm[2]);
			            		name=nm[2];
			            		contact_name=name;
			            		//alert("name "+name);
			            				
	            				
	            			}
			            		if(arr[i].indexOf('TEL')!=-1)
			            		{	
			            			flag=1;
			            			//alert("in index of");
			            			ph=arr[i].split(':');
			            			//alert("ph"+ph);
			            			phnum=ph[1];
			            			contact_num=phnum;
			            			//alert("phnum "+phnum);
			            		}
			            		if(arr[i].indexOf('EMAIL')!=-1)
			            		{	
			            			//alert("in index of");
			            			mail=arr[i].split(':');
			            			//alert("ph"+mail);
			            			email=mail[1];
			            			contact_email=email;
			            			//alert("email"+email);
			            		}
			            		
			            		
			            		
			            	}
			            var retVal = confirm("Add information to contact list?");
	            		   if( retVal == true )
	            		   {
	            		      addContact();
	            		   }else
	            		   {
	            			   window.open("Home.html?btn3", "", "");
	            		   }
			            
            	}	
            else if(string.indexOf('VCARD')!=-1)
            	{
            		//alert("in vcard");
            		var arr=string.split('\n');
            		//alert("arr len "+arr.length);
            		nm=arr[1].split(":");
    				//alert("nm "+nm[1]);
            		name=nm[1];
            		contact_name=name;
            		//alert("name "+name);
            				
    					
            		for(var i=0;i<arr.length;i++)
	            	{	// alert("arr[i] "+arr[i]);
	            		if(arr[i].indexOf('TEL')!=-1)
	            		{	
	            			flag=1;
	            			//alert("in index of");
	            			ph=arr[i].split(':');
	            			//alert("ph"+ph);
	            			phnum=ph[1];
	            			contact_num=phnum;
	            			//alert("phnum "+phnum);
	            		}
	            		if(arr[i].indexOf('EMAIL')!=-1)
	            		{	
	            			//alert("in index of");
	            			mail=arr[i].split(':');
	            			//alert("ph"+mail);
	            			email=mail[1];
	            			contact_email=email;
	            			//alert("email"+email);
	            		}
	            		
	            	}
            		var retVal = confirm("Add information to contact list?");
         		   if( retVal == true )
         		   {
         		      addContact();
         		   }else
         		   {
         			   window.open("Home.html?btn3", "", "");
         		   }
            	}
            
            else
        	{
			 alert("QR code Does not contain contact information");
			}
        }, 
        function(error) 
        {
        alert("Scan failed: " + error);
       });
}
/***********************************************************************/

function addContact()
{
	//alert("in add contact");
	//alert("contact_name"+contact_name);
	//alert("contact_num"+contact_num);
	var contact = navigator.contacts.create();
    contact.displayName =contact_name;
    var name = new ContactName();
     //var phnum=new 
     name.givenName = contact_name;
     contact.name = name;
     //contact.phoneNumbers=num;
	contact.phoneNumbers=[new ContactField('mobile',contact_num,true)];
	
	contact.email=[new ContactField('home',contact_email,true)];
     // save
     contact.save(onSuccess,onSaveError);
    
}

function onSuccess(contacts)
{
   alert("Contact successfully added!!!!");
}

// onError: Failed to get the contacts
//
function onSaveError(contactError)
{
    alert('Error while processing!'+contactError.code);
}



/************************************************************************/




var encodeText = function() {
    window.plugins.barcodeScanner.encode(
            BarcodeScanner.Encode.TEXT_TYPE,
            "http://www.mobiledevelopersolutions.com", 
            function(success) {
                alert("Encode success: " + success);
            }, function(fail) {
                alert("Encoding failed: " + fail);
            });
}

var encodeEmail = function() {
    window.plugins.barcodeScanner.encode(
        BarcodeScanner.Encode.EMAIL_TYPE,
        "a.name@gmail.com", function(success) {
            alert("Encode success: " + success);
        }, function(fail) {
            alert("Encoding failed: " + fail);
        });
}

var encodePhone = function() {
    window.plugins.barcodeScanner.encode(
        BarcodeScanner.Encode.PHONE_TYPE,
        "555-227-5283", function(success) {
            alert("Encode success: " + success);
        }, function(fail) {
            alert("Encoding failed: " + fail);
        });
}

var encodeSMS = function() {
    window.plugins.barcodeScanner.encode(
        BarcodeScanner.Encode.SMS_TYPE,
        "An important message for someone.", function(success) {
            alert("Encode success: " + success);
        }, function(fail) {
            alert("Encoding failed: " + fail);
        });
}