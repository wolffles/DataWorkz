window.addEventListener("turbolinks:load", function() {
  if (document.querySelector('input[id="user_email"]')){
    var email_input = document.querySelector('input[id="user_email"]');
    email_input.value = "wolfgang.truong@gmail.com";
  }
  if (document.querySelector('input[id="user_password"]')){
    var password_input = document.querySelector('input[id="user_password"]');
    password_input.value = "password";
  }
});