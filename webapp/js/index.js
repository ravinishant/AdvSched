//$("#scheduleBtn").button();
//$("#loginBtn").button().click(function(){});
function newCookie(username,value,days) {
 var days = 10;   // the number at the left reflects the number of days for the cookie to last
                 // modify it according to your needs
 if (days) {
   var date = new Date();
   date.setTime(date.getTime()+(days*24*60*60*1000));
   var expires = "; expires="+date.toGMTString(); }
   else var expires = "";
   document.cookie = username+"="+value+expires+"; path=/"; }
 
function readCookie(username) {
   var nameSG = username + "=";
   var nuller = '';
  if (document.cookie.indexOf(nameSG) == -1)
    return nuller;
 
   var ca = document.cookie.split(';');
  for(var i=0; i<ca.length; i++) {
    var c = ca[i];
    while (c.charAt(0)==' ') c = c.substring(1,c.length);
  if (c.indexOf(nameSG) == 0) return c.substring(nameSG.length,c.length); }
    return null; }
 
function eraseCookie(username) {
  newCookie(username,"",1); }
 
function toMem(a) {
    newCookie('theName', document.form.username.value);     // add a new cookie as shown at left for every
    newCookie('thePassword', document.form.password.value);   // field you wish to have the script remember
}
 
function delMem(a) {
  eraseCookie('theName');   // make sure to add the eraseCookie function for every field
  eraseCookie('thePassword');
 
   document.form.username.value = '';   // add a line for every field
   document.form.password.value = ''; }
 
 
function remCookie() {
document.form.username.value = readCookie("theName");
document.form.password.value = readCookie("thePassword");
}
 
// Multiple onload function created by: Simon Willison
// http://simon.incutio.com/archive/2004/05/26/addLoadEvent
function addLoadEvent(func) {
  var oldonload = window.onload;
  if (typeof window.onload != 'function') {
    window.onload = func;
  } else {
    window.onload = function() {
      if (oldonload) {
        oldonload();
      }
      func();
    }
  }
}
 
addLoadEvent(function() {
  remCookie();
});


$("#loginBtn").on('click', function () {
    bootbox.dialog({
        title: "Login",
        message: "<form role='form' id='loginform' method='POST' action='LoginValidation.jsp' onsubmit='return validate()'>"
                + "<div class='form-group'>"
                + "<label for='username'>User Email</label>"
                + "<input class='form-control' type='text' name='username' id='username' value=''>"
                + "</div>"
                + "<div class='form-group'>"
                + "<label for='password'>Password</label>"
                + "<input class='form-control' type='password' name='password' id='password' value=''>"
                + "<input type='submit' style='display:none'/>"
                + "</div>"
                + "<div class='form-group'>"
                + "<label class='checkbox'>"
                + "<input type='checkbox' value='remember-me' id='remember_me' onsubmit='toMem()'> Remember me</label>"           
                + "</form>"
//                + "<input type='submit' value='Login' id='loginBtn2' class='btn btn-default'>"
        ,
        buttons: {
            success: {
                label: "Login",
                className: "btn-primary",
                callback: function () {
                    document.getElementById("loginform").submit();
                }
            }
        }

    });
//    bootbox.alert("noooooo", function(){});
});
$("#leftAccordion").accordion({heightStyle: content});
$("#rightAccordion").accordion({heightStyle: content});
$("#centerAccordion").accordion({heightStyle: content}); //Abhijeet Chopra Mar 7: Created new id for center positioning
//$("#scheduleBtn").button().click(function(){});


function validate() {
    var username = document.forms["loginform"]["username"].value;
    var password = document.forms["loginform"]["password"].value;
    
    if (username === null || username === "") {
        $("#username").notify("Please enter your username", "error",
                {elementPosition: 'bottom center',
                    globalPosition: 'bottom center'})
        return false;
    }

    if (password === null || password === "") {
        $("#password").notify("Please enter your password", "error",
                {elementPosition: 'bottom center',
                    globalPosition: 'bottom center'})
        return false;
    }

    
}

