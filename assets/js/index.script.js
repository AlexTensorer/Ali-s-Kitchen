// Flash timeout
S
setTimeout(() => {
    const successFlash = document.getElementById('success-flash');
    const errorFlash = document.getElementById('error-flash');
  
    if (successFlash) {
      successFlash.remove();
    }
  
    if (errorFlash) {
      errorFlash.remove();
    }
  }, 5000);