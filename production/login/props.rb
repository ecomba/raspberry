main_container {
  
  input_container {
    label :text => "Username: "
    input :id => 'username', :players => 'text_box', :width => 270
  }
  input_container {
    label :text => "Password: "
    input :id => 'password', :players => 'password_box', :width => 270
  }
  button :id => 'login', :players => 'login', :text => 'Login'
}