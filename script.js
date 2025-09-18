// JavaScript to handle the dropdown functionality
document.addEventListener('DOMContentLoaded', function () {
    var dropdowns = document.querySelectorAll('.dropdown-wrapper');

    dropdowns.forEach(function (dropdown) {
        dropdown.addEventListener('click', function (e) {
            // Prevent navigation when clicking the dropdown header
            if (e.target.classList.contains('dropdown-list')) {
                e.preventDefault();
                var content = this.querySelector('.dropdown-content');
                content.style.display = content.style.display === 'block' ? 'none' : 'block';
            }
        });
    });

    // Close dropdowns when clicking elsewhere
    document.addEventListener('click', function (e) {
        if (!e.target.closest('.dropdown-wrapper')) {
            var openDropdowns = document.querySelectorAll('.dropdown-content');
            openDropdowns.forEach(function (dropdown) {
                dropdown.style.display = 'none';
            });
        }
    });
});