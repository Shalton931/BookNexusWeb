function switchTab(tabName) {
    // Hide all tab contents
    var tabs = document.querySelectorAll('.tab-content');
    for (var i = 0; i < tabs.length; i++) {
        tabs[i].classList.remove('active');
    }

    // Deactivate all tabs
    var tabButtons = document.querySelectorAll('.tab');
    for (var i = 0; i < tabButtons.length; i++) {
        tabButtons[i].classList.remove('active');
    }

    // Activate selected tab
    document.getElementById(tabName + '-tab').classList.add('active');

    // Find and activate the corresponding tab button
    var tabButtons = document.querySelectorAll('.tab');
    for (var i = 0; i < tabButtons.length; i++) {
        if (tabButtons[i].textContent.toLowerCase().includes(tabName)) {
            tabButtons[i].classList.add('active');
            break;
        }
    }
}

function generateReport(type) {
    // Show the report results section
    document.getElementById('reportResults').style.display = 'block';

    // This would be populated with actual data from the server
    alert('Generating ' + type + ' report...');
}

function downloadReport() {
    alert('Report download functionality would be implemented here.');
}