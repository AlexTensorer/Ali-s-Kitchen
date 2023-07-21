const validatePassword = (password) => {
    const passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
  
    if (!passwordRegex.test(password)) {
      return "Password must contain at least one alphabetic character, one numeric digit, and one special character, with a total minimum length of 8 characters";
    }
  
    return null; 
  };
  
  module.exports = validatePassword;