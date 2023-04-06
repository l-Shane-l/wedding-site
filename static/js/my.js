function initSidenav() {
    var elems = document.querySelectorAll('.sidenav');
    var instances = M.Sidenav.init(elems);
    
    var toggleSidenav = function() {
      var screenWidth = window.innerWidth;
      var isMobile = screenWidth < 1500;
      var sidenav = document.getElementById('mobile-nav');
      var menuItems = document.querySelector('.right.hide-on-med-and-down');
  
      if (isMobile) {
        sidenav.style.display = 'block';
        menuItems.style.display = 'none';
      } else {
        sidenav.style.display = 'none';
        menuItems.style.display = 'flex';
      }
    };
  
    toggleSidenav();
    window.addEventListener('resize', toggleSidenav);
  }