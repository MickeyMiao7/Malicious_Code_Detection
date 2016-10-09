var contact_number;
var contact_name;
var res="";
var check_fun_flag=1;
var search=0;
var tab=0;
var flag=0;
var group_name="";
var contactOfGroup=[];
var contactOfFav=[];
var contactsFromDb=[];
var contactOfGroup_local_name=[];
var contactOfGroup_local_phone=[];
var contactOfFav_local_name=[];
var contactOfFav_local_phone=[];
var arrForMultipleSend=[];
var db = window.openDatabase("Database", "1.0", "Cordova Demo", 200000);

/**************************Call log******************************/
function get_contacts() 
{
	document.getElementById('calllog').innerHTML =" ";
	document.getElementById('foot').style.visibility = 'visible';
	document.getElementById('foot').innerHTML ="";
    var obj = new ContactFindOptions();
    obj.filter = " ";
    obj.multiple=true;
    var filter=[ "displayName","name","phoneNumbers"];
    obj.multiple = true;
    navigator.contacts.find(filter,contacts_success,contacts_fail, obj);
}

function contacts_success(contacts)
{
	document.getElementById('foot').innerHTML =
		 "<table align=center><tr><td><img src=images/cadd.png style=height:39px; width:39px; padding-left: 2px;!important onclick=displayGroup(); /></a> &nbsp;&nbsp;&nbsp;&nbsp;</td>"+
	        "<td><button><a href=Dialog.html rel=external data-role=button data-rel=dialog><button><img src=images/fb_add.png style=height:35px; width:35px; !important /></a></button> &nbsp;&nbsp;&nbsp;&nbsp;</td>"+
	        "<td><button onclick=gotoSearch(); style\"width=30px; !important\"><img src=images/csearch.png  style=height:35px; width:30px; !important  /></button></td></tr></table>";
   
	document.getElementById('calllog').innerHTML = 
        "<strong><center> All(" + contacts.length + ")</strong> </center>";
    for (var i = 0; i < contacts.length ; i++) 
    {       
    	for (var j=0; j<contacts[i].phoneNumbers.length; j++) 
    		{
    		   if (contacts[i].name && contacts[i].name.formatted) 
		        {
    			   var name=contacts[i].name.formatted;
    			   var new_name=name.replace(" ","_");
    			   //alert(new_name);
		        	document.getElementById('calllog').innerHTML=document.getElementById('calllog').innerHTML + 
		           "<ul><li><a href='sms:"+contacts[i].phoneNumbers[j].value+"'><img src=images/gallery_sms.png height=30 width=27></a><a href=EditContact.html?"+new_name+" rel=external><img src=images/shortcut_contact.png height=35px width=35px /></a>" + contacts[i].name.formatted+" "+contacts[i].phoneNumbers[j].value+
		           "</li><li>_______________________________________________</li></ul>";
		       }
    		}
    }
}
function gotoSearch()
{
	window.open("Search.html", "", "");
}
function contacts_fail (error) 
{
    document.getElementById('calllog').innerHTML = "<strong>Error getting contacts.</strong>";
}

/***********************************GROUP*********************************/
function displayGroup()
{
	document.getElementById('calllog').innerHTML="";
    db.transaction(createDB_displayGroup, error, success1);
}
function createDB_displayGroup(tx)
{
	//tx.executeSql('DROP TABLE IF EXISTS GROUP_TBL');
	 tx.executeSql('CREATE TABLE IF NOT EXISTS GROUP_TBL (id INTEGER PRIMARY KEY AUTOINCREMENT,gname VARCHAR(25),uname VARCHAR(20),phone VARCHAR(20))');
}
function success1() 
{
     db.transaction(query1, error);
}
function query1(tx) 
{	
    tx.executeSql('SELECT gname FROM GROUP_TBL ', [], querySuccess1, error);
}
function querySuccess1(tx, results) 
{	

	    var len = results.rows.length;
	    var flag=0;
        document.getElementById('calllog').innerHTML =" ";
	
	   document.getElementById('foot').style.visibility = 'hidden';
	   document.getElementById('calllog').innerHTML="<button id=fav onclick=gotoNewGroup();>New Group<img src=images/fav_add.png style=height:65px; width:50px; !important;></button>";
		if(len==0)
			{
			  document.getElementById('calllog').innerHTML=document.getElementById('calllog').innerHTML+"<br/>NO Group is created....<br/>press + to add group";
			}
		else
			{
			   for (var i=0; i<len; i++)
				   {	
				   	
				    cArray=new Array();
					cArray[i]=results.rows.item(i).gname;
					if(i>=1)
							{
								if(results.rows.item(i-1).gname==results.rows.item(i).gname)
								{
									flag=1;						
								}
							}
					if(flag==1)
						{
						 flag=0;
						}
					else
					{		
					   document.getElementById('calllog').innerHTML=document.getElementById('calllog').innerHTML+
					   "<button id=fav style=height: 30px; width: 22px; z-index:1; !important onclick=\"getContactOfGroup('"+results.rows.item(i).gname+"');\">"+"<img src=images/group.png style=height: 20px; width: 15px; z-index:1;!important	>"+results.rows.item(i).gname.substring(0,6)+".."+"</button><br/>";
					}
				}
		 }
}
function gotoNewGroup()
{
	window.open("NewGroup.html",""," ");
}                     
function getContactOfGroup(gname)
{
   
	group_name=gname;
	db.transaction(createDB_displayGroup, error,successOfContact);	   
}
function successOfContact()
{
    db.transaction(onQuerySucess, error);
}
function onQuerySucess(tx)
{	
	 tx.executeSql('SELECT * FROM GROUP_TBL WHERE gname="'+group_name+'"', [], retriveValues, error);
}
function retriveValues(tx,results)
{		
		//alert("in retrive");
	   contactOfGroup=[];
	   var len = results.rows.length;
	   document.getElementById('calllog').innerHTML =" "; 
	   document.getElementById('foot').style.visibility='visible';
	  document.getElementById('calllog').innerHTML="<button id=fav onclick=getContactList();>ADD<img src=images/fav_add.png style=height:65px; width:50px; !important;></button><br/><h5 aligh=left>(click + to add contact to group)</h5>";
	  document.getElementById('foot').innerHTML ="<img src=images/sms.png style=\"height:35px; width:35px; padding-top:1px; !important\" onclick=smsToMultiple(); />";
		if(len!=0)
			{
			 for (var i=0; i<len; i++)
			   {	
			     if(results.rows.item(i).uname!=null)
				   {
				       contactOfGroup[i]=results.rows.item(i).uname;
				       arrForMultipleSend[i]=results.rows.item(i).phone;
				       //alert("arrForMultipleSend[i] "+arrForMultipleSend[i]);
				       document.getElementById('calllog').innerHTML=document.getElementById('calllog').innerHTML + 
				      /* "<br/><table><tr><td><a href='sms:"+results.rows.item(i).phone+"'><img src=images/gallery_sms.png height=30 width=27></a></td><td><a href='tel:"+results.rows.item(i).phone+"' rel=external><img src=images/shortcut_contact.png height=35px width=35px /></a></td><td style=\" width:40%;overflow: hidden; text-overflow: ellipsis !important;\">" + 
				       results.rows.item(i).uname+"</td><td style=\"right:5px; width:40%; !important;\"> "+
				       results.rows.item(i).phone+"</td></tr></table>_______________________________________________";*/
					   "<br/><table><tr><td><a href='sms:"+results.rows.item(i).phone+"'><img src=images/gallery_sms.png height=30 width=27></a><a href='tel:"+results.rows.item(i).phone+"' rel=external><img src=images/shortcut_contact.png height=35px width=35px /></a>" + results.rows.item(i).uname+" "+results.rows.item(i).phone+
					   "</td></tr></table>_______________________________________________";
				   } 
			   }
			}
}

function error(err)
{
alert("Error processing SQL: "+err.code);
}
function getContactList()
{
	document.getElementById('calllog').innerHTML =" ";
	document.getElementById('foot').style.visibility = 'visible';
	document.getElementById('foot').innerHTML ="";
    var obj = new ContactFindOptions();
    obj.filter = " ";
    obj.multiple=true;
    var filter=[ "displayName","name","phoneNumbers"];
    obj.multiple = true;
    navigator.contacts.find(filter,contacts_display,contacts_fail, obj);
	
}
function contacts_display(contacts)
{
	 var len=contacts.length; 
	 var f=0;
     var flag=0;
	 
	 if(contactOfGroup!=0)
    	{
		 
	       var idnum=0;
	  	   	for (var i = 0; i < contacts.length ; i++) 
			     {  
		   					flag=0;
				   			for(var k=1;k<contactOfGroup.length;k++)
				   			{
				   					if(contactOfGroup[k]==contacts[i].name.formatted)
					   				{
				   						flag=1;
						   				break;
						   			}
				   			}
			   			   if(flag!=1)
			   				{
			   				  // alert("i is "+i);
			   				   
			   				   for (var j=0; j<contacts[i].phoneNumbers.length; j++) 
							   		{
			   			        		//arrForMultipleSend[i]=contacts[i].phoneNumbers[j].value;
			   					  
			   							if (contacts[i].name && contacts[i].name.formatted) 
								         {
			   							    //alert(contacts[i].phoneNumbers[j].value);
						   					f++;
						   				    document.getElementById('calllog').innerHTML=document.getElementById('calllog').innerHTML + 
							                "<br/><table><tr><td><input type=checkbox id=chkbox"+idnum+" style=height:30px; width:27px; !important; name='"+contacts[i].name.formatted+"' phone='"+contacts[i].phoneNumbers[j].value+"'></td><td><a href='tel:"+contacts[i].phoneNumbers[j].value+"' rel=external><img src=images/shortcut_contact.png height=35px width=35px /></a></td><td>" + contacts[i].name.formatted+" "+contacts[i].phoneNumbers[j].value+
							                "</td></tr></table>____________________________________________________";
						   				    idnum++;
				   			             }
			   				     }
			   		        }
			            }
		   	document.getElementById('foot').innerHTML =
				 "<table><tr><td><button id=right onclick=\"addContactToGroupSucess("+f+");\"> <img src=images/fb_ok.png style=height:35px; width:35px; !important /></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>" +
				 "<td><button><a href=Home.html?btn3 rel=external><img src=images/fb_cancel.png style=height:35px; width:35px; !important/></a></button></td></tr></table>";
			      }
	    else
    	 {
			  document.getElementById('foot').innerHTML =
				 "<table><tr><td><button id=right onclick=\"addContactToGroupSucess("+len+");\"> <img src=images/fb_ok.png style=height:35px; width:35px; !important /></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>" +
				 "<td><button><a href=Home.html?btn3 rel=external><img src=images/fb_cancel.png style=height:35px; width:35px; !important/></a></button></td></tr></table>";
		   	for (var i = 0; i < contacts.length ; i++) 
		     {       
			   for (var j=0; j<contacts[i].phoneNumbers.length; j++) 
		   		{
				  
		   		  if (contacts[i].name && contacts[i].name.formatted) 
				        {
		   			       
		   			  		document.getElementById('calllog').innerHTML=document.getElementById('calllog').innerHTML + 
			                "<br/><table><tr><td><input type=checkbox id=chkbox"+i+" style=height:30px; width:27px; !important; name='"+contacts[i].name.formatted+"' phone='"+contacts[i].phoneNumbers[j].value+"'></td><td><a href='tel:"+contacts[i].phoneNumbers[j].value+"' rel=external><img src=images/shortcut_contact.png height=35px width=35px /></a></td><td>" + contacts[i].name.formatted+" "+contacts[i].phoneNumbers[j].value+
			                "</td></tr></table>____________________________________________________";
		   			  		
				        }
		         }
		     }
	    }
}
function smsToMultiple()
{
	
	var len=arrForMultipleSend.length;
	//alert("len"+len);
	var temp="";
	if(len==0)
		{
			alert("No Contact into group!!!!");
		}
	else
		{
			for(var i=1;i<len;i++)
				{
					
				 temp=temp+arrForMultipleSend[i]+",";  
				 //alert(temp);
				}
			window.location.href ="sms:"+temp+"?body=";
		}
}
function addContactToGroupSucess(len)
{
	var j=0;
	var t=new Array();
	for(var i=0;i<len;i++)
		{
			t[i]=document.getElementById("chkbox"+i);
			if(t[i].checked)
				{		
					//alert("name is "+t[i].name);
					//alert("phone is "+t[i].getAttribute("phone"));
				    contactOfGroup_local_name[j]=t[i].name;
				    contactOfGroup_local_phone[j]=t[i].getAttribute("phone");
					j++;
				}
		}
	if(contactOfGroup_local_name.length==0)
		{
			alert("No contact is selected");
		}
	else
		{
	        db.transaction(createDB_displayGroup, error,InsertContact);
		}
}
function InsertContact()
{
	 db.transaction(insertRecord, error);	
}
function insertRecord(tx)
{
	for(var i=0;i<contactOfGroup_local_name.length;i++)
		{
		 tx.executeSql('INSERT INTO GROUP_TBL (gname,uname,phone) VALUES ("'+group_name+'","'+contactOfGroup_local_name[i]+'","'+contactOfGroup_local_phone[i]+'")');
		}
	 db.transaction(test1, error);
	
}
function test1(tx)
{
	tx.executeSql('SELECT uname FROM GROUP_TBL WHERE gname="'+group_name+'"', [], test, error);
}
function test(tx,results)
{
	alert("Sucessfully Contacts Added into Group");
	window.open("Home.html?click", "", "");
}

                           /********************favorite*********************/


function cnt_fav()
{
	 db.transaction(createDB_fav, error, successCB_fav);
}
function createDB_fav(tx)
{	
	 //tx.executeSql('DROP TABLE IF EXISTS MYBOOK');
	 tx.executeSql('CREATE TABLE IF NOT EXISTS MYBOOK (id INTEGER PRIMARY KEY AUTOINCREMENT,name VARCHAR(25),phone VARCHAR(25))');
}
function successCB_fav() 
{
       db.transaction(queryDB_fav, error);
}
function queryDB_fav(tx) 
{	
	    tx.executeSql('SELECT * FROM MYBOOK', [], querySuccess_fav, error);
}

function querySuccess_fav(tx, results) 
{	
       contactOfFav=[];
       var len = results.rows.length;  
       document.getElementById('calllog').innerHTML =" ";
      
	   document.getElementById('foot').style.visibility = 'hidden';
	   //document.getElementById('calllog').innerHTML="<button id=fav onclick=get_contacts1();>ADD<img src=images/fav_add.png style=height:35px; width:30px; !important;></button>";
	   document.getElementById('calllog').innerHTML=document.getElementById('calllog').innerHTML+
	   "<br/><table align=center><tr><td>"+
       "<button  style=\"height:85px; width:85px; !important;\"><font size=+1 color=black>ADD</font><img src=images/fav_add.png  onclick=get_contacts1(); align=middle  style=\"height:35px; width: 35px; padding-left:1px; padding-right: 1px;\"/> </button>" +
       "</td></tr></table>";
	   if(len==0)
		{
		  document.getElementById('calllog').innerHTML=document.getElementById('calllog').innerHTML+"<br/>NO contact is set as favorite....<br/>press + to set favorite";
		}
   	  else
		{   
   		   for (var i=0; i<len; i++)
			   {
				   if(results.rows.item(i).name!=null)
				   {
					   contactOfFav[i]=results.rows.item(i).name;
					   document.getElementById('calllog').innerHTML=document.getElementById('calllog').innerHTML+
					    "<button id=bid style=\"width:90%; height:50px; padding:left; !important;\" name="+results.rows.item(i).name+" phone="+results.rows.item(i).phone+" onclick=\"favoriteAction('"+results.rows.item(i).name+"','"+results.rows.item(i).phone+"');\"><font align=left style=\"width:80%; height:35px; !important;\">"+results.rows.item(i).name+"</font></button>";      
				   }
			   }	   
    	}
}

function favoriteAction(name,num)
{
	//alert("num is "+num);
	//var a=new Array();
     document.getElementById('calllog').innerHTML =" ";
 	 document.getElementById('calllog').innerHTML = document.getElementById('calllog').innerHTML+
	  "<table align=center ><tr><td><h3 align=center >"+name+"</h3></td></tr></table>" +
	 /* "<tr><td aligh=center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src=images/fav_img.png style=\"height:85px; width:85px; !imporatant;\"></td></tr></table>" +*/
	  "<table ><tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Call</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>Send SMS</td></tr><tr><td><a href='tel:"+num+"' style=border-bottom: 1px;!important;><img src=images/gallery_call.png style=\"height:85px; width:85px; !important;\"></a></td>" +
	  "<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><a href='sms:"+num+"' style=border-bottom: 1px;!important;><img src=images/gallery_sms.png style=\"height:85px; width:85px; !important;\"></a></td></tr></table>";
}

function get_contacts1() 
{
	document.getElementById('calllog').innerHTML =" ";
	document.getElementById('foot').style.visibility = 'visible';
    document.getElementById('foot').innerHTML ="";
    var obj = new ContactFindOptions();
    obj.filter = "";
    obj.multiple=true;
    var filter=[ "displayName","name","phoneNumbers"];
    obj.multiple = true;
    navigator.contacts.find(filter,contacts_success1,contacts_fail1, obj);
}
function contacts_success1(contacts)
{
	 var len=contacts.length; 
	 var f=0;
     var flag=0;
	 
	 if( contactOfFav!=0)
    	{
		 
	       var idnum=0;
	  	   	for (var i = 0; i < contacts.length ; i++) 
			     {  
		   					flag=0;
				   			for(var k=0;k< contactOfFav.length;k++)
				   			{
				   					if( contactOfFav[k]==contacts[i].name.formatted)
					   				{
				   						flag=1;
						   				break;
						   			}
				   			}
			   			   if(flag!=1)
			   				{
			   				  	   for (var j=0; j<contacts[i].phoneNumbers.length; j++) 
							   		{
			   							if (contacts[i].name && contacts[i].name.formatted) 
								         {
						   					f++;
						   				    document.getElementById('calllog').innerHTML=document.getElementById('calllog').innerHTML + 
							                "<br/><table><tr><td><input type=checkbox id=chkbox"+idnum+" style=height:30px; width:27px; !important; name='"+contacts[i].name.formatted+"' phone='"+contacts[i].phoneNumbers[j].value+"'></td><td><a href='tel:"+contacts[i].phoneNumbers[j].value+"' rel=external><img src=images/shortcut_contact.png height=35px width=35px /></a></td><td>" + contacts[i].name.formatted+" "+contacts[i].phoneNumbers[j].value+
							                "</td></tr></table>____________________________________________________";
						   				    idnum++;
				   			        }
			   				     }
			   		        }
			            }
		      	document.getElementById('foot').innerHTML =
				 "<table><tr><td><button id=right onclick=\"addContactToFavSucess("+f+");\"> <img src=images/fb_ok.png style=height:35px; width:35px; !important /></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>" +
				 "<td><button><a href=Home.html?btn3 rel=external><img src=images/fb_cancel.png style=height:35px; width:35px; !important/></a></button></td></tr></table>";
			      }
	    else
    	 {
	    	    document.getElementById('foot').innerHTML =
				 "<table><tr><td><button id=right onclick=\"addContactToFavSucess("+len+");\"> <img src=images/fb_ok.png style=height:35px; width:35px; !important /></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>" +
				 "<td><button><a href=Home.html?btn3 rel=external><img src=images/fb_cancel.png style=height:35px; width:35px; !important/></a></button></td></tr></table>";
		   	for (var i = 0; i < contacts.length ; i++) 
		     {       
			   for (var j=0; j<contacts[i].phoneNumbers.length; j++) 
		   		{
		   		  if (contacts[i].name && contacts[i].name.formatted) 
				        {
		   			  		document.getElementById('calllog').innerHTML=document.getElementById('calllog').innerHTML + 
			                "<br/><table><tr><td><input type=checkbox id=chkbox"+i+" style=height:30px; width:27px; !important; name='"+contacts[i].name.formatted+"' phone='"+contacts[i].phoneNumbers[j].value+"'></td><td><a href='tel:"+contacts[i].phoneNumbers[j].value+"' rel=external><img src=images/shortcut_contact.png height=35px width=35px /></a></td><td>" + contacts[i].name.formatted+" "+contacts[i].phoneNumbers[j].value+
			                "</td></tr></table>____________________________________________________";
		   			  		
				        }
		         }
		     }
	    }
  
}
function addContactToFavSucess(len)
{
	
	var j=0;
	var t=new Array();
	for(var i=0;i<len;i++)
		{
			t[i]=document.getElementById("chkbox"+i);
			if(t[i].checked)
				{	
				
				    contactOfFav_local_name[j]=t[i].name;
				    contactOfFav_local_phone[j]=t[i].getAttribute('phone');
				   // alert( contactOfFav_local_phone[j]+"  contactOfFav_local_phone[j]");
					j++;
				}
		}
	db.transaction(createDB_fav, error,InsertFav);
}
function InsertFav()
{
	 db.transaction(insertRecordInTbl, error);	
}
	

function insertRecordInTbl(tx)
{
		for(var i=0;i<contactOfFav_local_name.length;i++)
		{
		 tx.executeSql('INSERT INTO MYBOOK (name,phone) VALUES ("'+contactOfFav_local_name[i]+'","'+contactOfFav_local_phone[i]+'")');
		}
	 db.transaction(selectName, error);
	
}
function selectName(tx)
{
	tx.executeSql('SELECT * FROM MYBOOK', [], testFav, error);
}
function testFav(tx,results)
{
	alert("Contact Set As Favorite");
	cnt_fav();
}
function contacts_fail1 (error) 
{
    document.getElementById('calllog').innerHTML = "<strong>Error getting contacts.</strong>";
}
function error(e)
{
	alert("somthing went wrong!!!!!! "+e);
}





