<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<nav id="navigation">
    <div class="container">
        <div id="responsive-nav">
            <ul class="main-nav nav navbar-nav">
                <li class="nav-item" data-target="home"><a href="/shop">Trang chủ</a></li>
                <li class="nav-item" data-target="store"><a href="/shop/store">Điện thoại</a></li>
            </ul>
        </div>
    </div>
</nav><script>
    document.addEventListener('DOMContentLoaded', function() {
        const navItems = document.querySelectorAll('.nav-item');

        // Function to set active item based on localStorage
        function setActiveNavItem() {
            const activeItem = localStorage.getItem('activeNavItem');
            navItems.forEach(item => {
                if (item.getAttribute('data-target') === activeItem) {
                    item.classList.add('active');
                } else {
                    item.classList.remove('active');
                }
            });
        }

        // Initialize active state on page load
        setActiveNavItem();

        // Add click event listeners to nav items
        navItems.forEach(item => {
            item.addEventListener('click', function(event) {
                event.preventDefault(); // Prevent default action to allow setting active class
                // Remove 'active' class from all nav items
                navItems.forEach(nav => nav.classList.remove('active'));

                // Add 'active' class to the clicked nav item
                this.classList.add('active');

                // Store the active item in local storage
                const target = this.getAttribute('data-target');
                localStorage.setItem('activeNavItem', target);

                // Navigate to the href link
                window.location.href = this.querySelector('a').getAttribute('href');
            });
        });
    });
</script>