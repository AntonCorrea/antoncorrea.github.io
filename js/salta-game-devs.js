document.addEventListener('DOMContentLoaded', function () {
  var hamburger = document.getElementById('hamburger');
  var mobileMenu = document.getElementById('mobileMenu');
  var mobileOverlay = document.getElementById('mobileOverlay');
  var mobileClose = document.getElementById('mobileClose');
  var navbar = document.getElementById('navbar');

  function openMenu() {
    mobileMenu.classList.add('mobile-menu--open');
    mobileOverlay.style.display = 'block';
    hamburger.setAttribute('aria-expanded', 'true');
    document.body.style.overflow = 'hidden';
  }

  function closeMenu() {
    mobileMenu.classList.remove('mobile-menu--open');
    mobileOverlay.style.display = 'none';
    hamburger.setAttribute('aria-expanded', 'false');
    document.body.style.overflow = '';
  }

  if (hamburger) hamburger.addEventListener('click', openMenu);
  if (mobileClose) mobileClose.addEventListener('click', closeMenu);
  if (mobileOverlay) mobileOverlay.addEventListener('click', closeMenu);

  if (mobileMenu) {
    mobileMenu.querySelectorAll('a').forEach(function (link) {
      link.addEventListener('click', closeMenu);
    });
  }

  if (navbar) {
    window.addEventListener('scroll', function () {
      if (window.scrollY > 50) {
        navbar.style.borderBottom = '1px solid #2a2a2a';
      } else {
        navbar.style.borderBottom = '1px solid #2a2a2a';
      }
    });
  }
});
