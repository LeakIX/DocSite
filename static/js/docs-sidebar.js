// Documentation Sidebar Toggle for Mobile
(function () {
  'use strict';

  // Wait for DOM to be ready
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initSidebar);
  } else {
    initSidebar();
  }

  function initSidebar() {
    const sidebar = document.querySelector('.docs-sidebar');
    const toggle = document.querySelector('.sidebar-toggle');

    if (!sidebar || !toggle) {
      return;
    }

    // Toggle sidebar on mobile
    toggle.addEventListener('click', function () {
      sidebar.classList.toggle('sidebar-open');

      // Update aria-expanded attribute
      const isOpen = sidebar.classList.contains('sidebar-open');
      toggle.setAttribute('aria-expanded', isOpen);
    });

    // Close sidebar when clicking on a link (mobile only)
    if (window.innerWidth <= 992) {
      const sidebarLinks = sidebar.querySelectorAll('.sidebar-menu-item a');

      sidebarLinks.forEach(function (link) {
        link.addEventListener('click', function () {
          // Add a small delay to allow navigation to start
          setTimeout(function () {
            sidebar.classList.remove('sidebar-open');
            toggle.setAttribute('aria-expanded', 'false');
          }, 150);
        });
      });
    }

    // Handle window resize
    let resizeTimer;
    window.addEventListener('resize', function () {
      clearTimeout(resizeTimer);
      resizeTimer = setTimeout(function () {
        if (window.innerWidth > 992) {
          // Desktop: ensure sidebar is not in open state
          sidebar.classList.remove('sidebar-open');
          toggle.setAttribute('aria-expanded', 'false');
        }
      }, 250);
    });
  }
})();
