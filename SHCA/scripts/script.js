function toggleFilters() {
  document.getElementById("filtersDropdown").classList.toggle("show");
}

function toggleFavorites() {
  document.getElementById("favoritesDropdown").classList.toggle("show");
}

// Close the dropdown menus if the user clicks outside of them
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    for (var i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}